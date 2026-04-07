package iit.nstu.bdstocktrendbackend.service.user;

import iit.nstu.bdstocktrendbackend.dto.UserDTO;
import iit.nstu.bdstocktrendbackend.dto.request.user.ChangePasswordRequest;
import iit.nstu.bdstocktrendbackend.dto.request.user.UpdateProfileRequest;
import iit.nstu.bdstocktrendbackend.models.User;
import iit.nstu.bdstocktrendbackend.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    private final ModelMapper modelMapper;

    @Override
    public UserDTO updateProfile(Long userId, UpdateProfileRequest request) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found"));

        if (request.getName() != null) user.setName(request.getName());
        if (request.getMobile() != null) user.setMobile(request.getMobile());
        if (request.getPhotoUrl() != null) user.setPhotoUrl(request.getPhotoUrl());

        user = userRepository.save(user);
        return modelMapper.map(user, UserDTO.class);
    }

    @Override
    public void changePassword(Long userId, ChangePasswordRequest request) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found"));

        if (!passwordEncoder.matches(request.getOldPassword(), user.getPassword())) {
            throw new RuntimeException("Old password does not match");
        }

        user.setPassword(passwordEncoder.encode(request.getNewPassword()));
        userRepository.save(user);
    }
}
