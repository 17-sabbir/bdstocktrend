package iit.nstu.bdstocktrendbackend.service.user;

import iit.nstu.bdstocktrendbackend.dto.request.user.RegisterRequest;
import iit.nstu.bdstocktrendbackend.exception.InvalidRequestException;

public interface RegisterService {

    void process(RegisterRequest request) throws InvalidRequestException;
}
