package iit.nstu.bdstocktrendbackend.controller.user;

import iit.nstu.bdstocktrendbackend.dto.UserDTO;
import iit.nstu.bdstocktrendbackend.dto.request.user.LoginRequest;
import iit.nstu.bdstocktrendbackend.dto.response.user.LoginResponse;
import iit.nstu.bdstocktrendbackend.models.Role;
import iit.nstu.bdstocktrendbackend.service.user.LoginService;
import jakarta.validation.Valid;
import java.util.HashSet;
import javax.management.modelmbean.ModelMBean;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
public class LoginController {

    private final LoginService loginService;
    private final ModelMapper modelMapper;

    @PostMapping("/api/auth/login")
    public ResponseEntity<LoginResponse> login(@Valid @RequestBody LoginRequest loginRequest) {
        LoginResponse response = loginService.process(loginRequest);

        return ResponseEntity.ok(response);
    }

    @GetMapping("/api/auth/account")
    public ResponseEntity<UserDTO> account() {
        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext()
            .getAuthentication()
            .getPrincipal();

        UserDTO userDTO = modelMapper.map(userDetails, UserDTO.class);

        HashSet<String> roles = new HashSet<>();
        for (GrantedAuthority authority : userDetails.getAuthorities()) {
            roles.add(authority.getAuthority());
        }
        userDTO.setRoles(roles);

        return ResponseEntity.ok(userDTO);
    }
}
