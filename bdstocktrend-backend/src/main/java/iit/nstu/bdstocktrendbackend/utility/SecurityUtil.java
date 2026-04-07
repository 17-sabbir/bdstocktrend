package iit.nstu.bdstocktrendbackend.utility;

import iit.nstu.bdstocktrendbackend.repository.RoleRepository;
import iit.nstu.bdstocktrendbackend.service.user.UserDetailImpl;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;

public class SecurityUtil {

  public static Long getCurrentUserId() {
    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    UserDetailImpl userDetails =(UserDetailImpl) authentication.getPrincipal(); // Your custom UserDetails class
    return userDetails.getId(); // Fetch the user ID from your custom class
  }

  public static boolean hasAuthority(String authority) {
    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    UserDetailImpl userDetails =(UserDetailImpl) authentication.getPrincipal(); // Your custom UserDetails class

    return userDetails.getAuthorities()
        .stream()
        .map(GrantedAuthority::getAuthority)
        .toList()
        .contains(authority);
  }

}
