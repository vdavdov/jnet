package by.vdavdov.jnet.service;

import by.vdavdov.jnet.model.entity.User;
import by.vdavdov.jnet.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

@Service
@Transactional
@RequiredArgsConstructor
public class UserService {
    private final UserRepository userRepository;

    public User create(final User user) {
        userRepository.save(user);
        return user;
    }

    public User update(final User user) {
        userRepository.save(user);
        return user;
    }

    public User delete(final Long id) {
        userRepository.deleteById(id);
        return userRepository.findById(id).orElse(null);
    }

    public Optional<User> findById(final Long id) {
        return userRepository.findById(id);
    }

}
