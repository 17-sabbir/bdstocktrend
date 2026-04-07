package iit.nstu.bdstocktrendbackend.service.user;

import iit.nstu.bdstocktrendbackend.dto.request.user.ChangePasswordRequest;
import iit.nstu.bdstocktrendbackend.dto.request.user.UpdateProfileRequest;
import iit.nstu.bdstocktrendbackend.dto.UserDTO;

public interface UserService {
    UserDTO updateProfile(Long userId, UpdateProfileRequest request);
    void changePassword(Long userId, ChangePasswordRequest request);
}
