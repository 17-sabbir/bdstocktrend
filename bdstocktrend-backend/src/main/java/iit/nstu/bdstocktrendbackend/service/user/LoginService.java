package iit.nstu.bdstocktrendbackend.service.user;

import iit.nstu.bdstocktrendbackend.dto.request.user.LoginRequest;
import iit.nstu.bdstocktrendbackend.dto.response.user.LoginResponse;

public interface LoginService {
    LoginResponse process(LoginRequest request);

}
