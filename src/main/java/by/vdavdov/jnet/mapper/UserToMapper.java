package by.vdavdov.jnet.mapper;

import by.vdavdov.jnet.model.dto.UserTo;
import by.vdavdov.jnet.model.entity.User;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

@Mapper(componentModel = "spring")
public interface UserToMapper {

    UserToMapper INSTANCE = Mappers.getMapper( UserToMapper.class );

    UserTo userToUserDto(User user);

    User userDtoToUser(UserTo userTo);
}


