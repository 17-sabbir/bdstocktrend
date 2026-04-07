package iit.nstu.bdstocktrendbackend.service.user;

import iit.nstu.bdstocktrendbackend.dto.request.user.RegisterRequest;
import iit.nstu.bdstocktrendbackend.exception.InvalidRequestException;
import iit.nstu.bdstocktrendbackend.models.Role;
import iit.nstu.bdstocktrendbackend.models.RoleType;
import iit.nstu.bdstocktrendbackend.models.User;
import iit.nstu.bdstocktrendbackend.repository.RoleRepository;
import iit.nstu.bdstocktrendbackend.repository.UserRepository;
import lombok.AllArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.Set;

@Service
@AllArgsConstructor
public class RegisterServiceImpl implements RegisterService {

    UserRepository userRepository;

    RoleRepository roleRepository;

    PasswordEncoder encoder;

    @Override
    public void process(RegisterRequest request) throws InvalidRequestException {
        boolean usernameExists = userRepository.existsByUsername(request.getUsername());
        if (usernameExists) throw new InvalidRequestException("username already exists");

        boolean emailExists = userRepository.existsByEmail(request.getEmail());
        if (emailExists) throw new InvalidRequestException("email already exists");

        User user = new User();
        user.setUsername(request.getUsername());
        user.setEmail(request.getEmail());
        user.setName(request.getName());
        user.setPassword(encoder.encode(request.getPassword()));

        Set<String> strRoles = request.getRole();
        Set<Role> roles = new HashSet<>();

        Role userRole = roleRepository.findByName(RoleType.ROLE_USER.toString())
                .orElseThrow(() -> new RuntimeException("role not found"));
        roles.add(userRole);

        /*if (strRoles == null) {
            Role userRole = roleRepository.findByName(RoleType.ROLE_USER.toString())
                    .orElseThrow(() -> new RuntimeException("role not found"));
            roles.add(userRole);
        }
        else {
            strRoles.forEach(role -> {
                Role adminRole = roleRepository.findByName(role)
                        .orElseThrow(() -> new RuntimeException("role not found"));
                roles.add(adminRole);
            });
        }*/

        user.setRoles(roles);
        userRepository.save(user);

    }
}
