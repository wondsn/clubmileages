package triple.assignment.clubmileage;

import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@SpringBootApplication
@EnableJpaAuditing
public class ClubmileageApplication {

    public static void main(String[] args) {
        SpringApplication.run(ClubmileageApplication.class, args);
    }
}
