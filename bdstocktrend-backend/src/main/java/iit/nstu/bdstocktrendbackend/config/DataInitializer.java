package iit.nstu.bdstocktrendbackend.config;

import iit.nstu.bdstocktrendbackend.models.Role;
import iit.nstu.bdstocktrendbackend.repository.RoleRepository;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.Arrays;

@Configuration
public class DataInitializer {

    @PersistenceContext
    private EntityManager entityManager;

    @Bean
    public CommandLineRunner initRoles(RoleRepository roleRepository) {
        return new CommandLineRunner() {
            @Override
            @Transactional
            public void run(String... args) throws Exception {
                try {
                    // Fix sequence out of sync issue
                    try {
                         entityManager.createNativeQuery("SELECT setval('roles_id_seq', (SELECT MAX(id) FROM roles))").getSingleResult();
                    } catch (Exception ignored) {
                        System.out.println("Could not reset sequence (might not exist or be needed): " + ignored.getMessage());
                    }

                    Arrays.asList("ROLE_USER", "ROLE_ADMIN", "ROLE_MODERATOR", "ROLE_PREMIUM_USER").forEach(roleName -> {
                        if (roleRepository.findByName(roleName).isEmpty()) {
                            Role role = new Role();
                            role.setName(roleName);
                            roleRepository.save(role);
                            System.out.println("Initialized role: " + roleName);
                        }
                    });
                } catch (Exception e) {
                    System.err.println("Error initializing data: " + e.getMessage());
                    e.printStackTrace();
                    // Do not fail startup
                }
            }
        };
    }
}
