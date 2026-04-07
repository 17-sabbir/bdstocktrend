package iit.nstu.bdstocktrendbackend.dto;

import iit.nstu.bdstocktrendbackend.models.Role;
import jakarta.persistence.*;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;

import java.util.HashSet;
import java.util.Set;

@Getter
@Setter
public class UserDTO {

    private Long id;

    private String username;

    private String email;

    private String name;

    private String mobile;
    
    private String photoUrl;

    private Set<String> roles = new HashSet<>();
}
