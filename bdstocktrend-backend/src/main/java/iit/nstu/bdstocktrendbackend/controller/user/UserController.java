package iit.nstu.bdstocktrendbackend.controller.user;

import iit.nstu.bdstocktrendbackend.dto.UserDTO;
import iit.nstu.bdstocktrendbackend.dto.request.user.ChangePasswordRequest;
import iit.nstu.bdstocktrendbackend.dto.request.user.UpdateProfileRequest;
import iit.nstu.bdstocktrendbackend.service.user.UserDetailImpl;
import iit.nstu.bdstocktrendbackend.service.user.UserService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api")
public class UserController {

    private final UserService userService;

    @PutMapping("/users/profile")
    public ResponseEntity<UserDTO> updateProfile(@Valid @RequestBody UpdateProfileRequest request) {
        UserDetailImpl currentUser = (UserDetailImpl) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        return ResponseEntity.ok(userService.updateProfile(currentUser.getId(), request));
    }

    @PostMapping("/auth/change-password")
    public ResponseEntity<String> changePassword(@Valid @RequestBody ChangePasswordRequest request) {
        UserDetailImpl currentUser = (UserDetailImpl) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        userService.changePassword(currentUser.getId(), request);
        return ResponseEntity.ok("Password changed successfully");
    }
}
