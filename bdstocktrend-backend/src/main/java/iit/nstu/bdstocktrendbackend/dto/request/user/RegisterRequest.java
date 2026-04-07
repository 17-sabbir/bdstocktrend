package iit.nstu.bdstocktrendbackend.dto.request.user;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Set;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class RegisterRequest {

    @NotBlank(message = "username cannot be blank")
    @Size(min = 3, max = 20, message = "username must be 3 to 20 character long")
    private String username;

    @NotBlank
    @Size(max = 50)
    @Email
    private String email;

    private Set<String> role;

    @NotBlank(message = "password cannot be blank")
    @Size(min = 6, max = 40, message = "password must be 6 to 40 character long")
    private String password;

    @NotBlank(message = "Name cannot be blank")
    @Size(min = 3, max = 20, message = "Name must be 3 to 20 character long")
    private String name;
}
