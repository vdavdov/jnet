package by.vdavdov.jnet.mapper;

import by.vdavdov.jnet.model.dto.UserTo;
import by.vdavdov.jnet.model.entity.User;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

class UserToMapperTest {
    private final UserToMapper userToMapper = UserToMapper.INSTANCE;

    @Test
    void userToUserDto() {
        User user = new User();
        user.setUsername("username");
        user.setFirstName("firstName");
        user.setLastName("lastName");
        user.setEmail("email");
        UserTo userTo = userToMapper.userToUserDto(user);

        assertNotNull(userTo);
        assertEquals("email", userTo.getEmail());
        assertEquals("lastName", userTo.getLastName());
        assertEquals("firstName", userTo.getFirstName());
        assertEquals("username", userTo.getUsername());
    }

    @Test
    void userToUser() {
        UserTo userTo = new UserTo("username", "firstName", "lastName", "email");

        User user = userToMapper.userDtoToUser(userTo);

        assertNotNull(user);
        assertEquals("email", user.getEmail());
        assertEquals("lastName", user.getLastName());
        assertEquals("firstName", user.getFirstName());
        assertEquals("username", user.getUsername());
    }
}
