package triple.assignment.clubmileage;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import triple.assignment.clubmileage.model.users.Users;
import triple.assignment.clubmileage.model.users.UsersRepository;

import java.util.UUID;

@Slf4j
@Component
@RequiredArgsConstructor
public class AppRunner implements ApplicationRunner {

    private final UsersRepository usersRepository;

    @Override
    @Transactional
    public void run(ApplicationArguments args) throws Exception {
        Users user1 = new Users();
        Users user2 = new Users();
        if (usersRepository.count() == 0) {
            usersRepository.save(user1);
            usersRepository.save(user2);
        }
        log.info("user1 = {}", user1.getUserId());
        log.info("user2 = {}", user2.getUserId());
        log.info("place1 = {}", UUID.randomUUID());
        log.info("place2 = {}", UUID.randomUUID());
        log.info("review1 = {}", UUID.randomUUID());
        log.info("review2 = {}", UUID.randomUUID());
    }
}
