package com.mycom.myapp.auth.service;

import java.util.Optional;

import org.springframework.stereotype.Service;

import com.mycom.myapp.auth.dao.LoginDao;
import com.mycom.myapp.user.dto.UserDto;

@Service
public class LoginServiceImpl implements LoginService{
	private final LoginDao loginDao;
	
	public LoginServiceImpl(LoginDao loginDao) {
		this.loginDao = loginDao;
	}
	
	//userDto를 받아서 -> string으로 변환 후 -> dao 실행 후 (db의 userdto가져온 후) -> 비교 후 userDto return 
	@Override
	public Optional<UserDto> login(UserDto userDto) {
		UserDto dtoFromDB = loginDao.login(userDto.getUserEmail());
		
		if(userDto != null && userDto.getUserPassword().equals(dtoFromDB.getUserPassword())) {
			return Optional.of(dtoFromDB);
		}
		return Optional.empty();
	}
	
}
