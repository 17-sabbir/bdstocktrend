package iit.nstu.bdstocktrendbackend.service.user;

import iit.nstu.bdstocktrendbackend.dto.request.user.LoginRequest;
import iit.nstu.bdstocktrendbackend.dto.response.user.LoginResponse;
import iit.nstu.bdstocktrendbackend.models.Payment;
import iit.nstu.bdstocktrendbackend.models.Role;
import iit.nstu.bdstocktrendbackend.models.User;
import iit.nstu.bdstocktrendbackend.repository.PaymentRepository;
import iit.nstu.bdstocktrendbackend.repository.RoleRepository;
import iit.nstu.bdstocktrendbackend.repository.UserRepository;
import iit.nstu.bdstocktrendbackend.security.JwtUtils;
import java.time.LocalDate;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class LoginServiceImpl implements LoginService {

  private static final String BEARER_TYPE = "Bearer";

  @Autowired
  AuthenticationManager authenticationManager;

  @Autowired
  JwtUtils jwtUtils;

  @Autowired
  UserRepository userRepository;

  @Autowired
  PaymentRepository paymentRepository;

  @Autowired
  RoleRepository roleRepository;

  @Override
  public LoginResponse process(LoginRequest request) {

    User user = userRepository.findByEmail(request.getEmail()).orElseThrow(
        () -> new UsernameNotFoundException("Incorrect email or password")
    );

    //check subscription validity
    Optional<Payment> paymentOptional = paymentRepository.findFirstByUserIdOrderByExpiryDateDesc(
        user.getId());

    if (paymentOptional.isPresent() && !paymentOptional.get().getExpiryDate()
        .isBefore(LocalDate.now())) {
      Role role = roleRepository.findByName("ROLE_PREMIUM_USER").get();
      user.getRoles().add(role);
      user.getRoles().remove(roleRepository.findByName("ROLE_USER").get());
    } else {
      Role role = roleRepository.findByName("ROLE_USER").get();
      user.getRoles().add(role);
      user.getRoles().remove(roleRepository.findByName("ROLE_PREMIUM_USER").get());
    }

    userRepository.save(user);

    user = userRepository.findByEmail(request.getEmail()).orElseThrow(
        () -> new UsernameNotFoundException("Incorrect email or password")
    );

    Authentication authentication = authenticationManager.authenticate(
        new UsernamePasswordAuthenticationToken(user.getUsername(), request.getPassword()));

    SecurityContextHolder.getContext().setAuthentication(authentication);
    String jwt = jwtUtils.generateJwtToken(authentication);

    UserDetailImpl userDetails = (UserDetailImpl) authentication.getPrincipal();
    List<String> roles = userDetails.getAuthorities().stream()
        .map(GrantedAuthority::getAuthority)
        .collect(Collectors.toList());

    return LoginResponse.builder()
        .token(jwt)
        .type(BEARER_TYPE)
        .username(userDetails.getUsername())
        .email(userDetails.getEmail())
        .name(userDetails.getName())
        .roles(roles)
        .build();
  }
}
