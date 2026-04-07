package iit.nstu.bdstocktrendbackend.dto.request.user;

import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UpdateProfileRequest {
    @Size(max = 50)
    private String name;

    @Size(max = 20)
    private String mobile;

    @Size(max = 255)
    private String photoUrl;
}
