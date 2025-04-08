package com.mycom.myapp.auth.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycom.myapp.auth.service.LoginService;
import com.mycom.myapp.user.dto.UserDto;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/auth")
public class LoginController {
	private final LoginService loginService;
	
	public LoginController(LoginService loginService) {
		this.loginService = loginService;
	}
	
//	//todo트러블 슈팅
//	@PostMapping(value="/login")
//	public String login(UserDto userDto) {
//		if(loginService.login(userDto)!=null) {
//			System.out.println("성공");
//			return "phones";
//		}
//		
//		return "phones";
//		
//	}
	@PostMapping("/login")
	@ResponseBody
	public Map<String, String> login(UserDto userDto, HttpSession session){
		
		Map<String, String> map = new HashMap<>();
		Optional<UserDto> optional= this.loginService.login(userDto);
		
		if(optional.isPresent()) { //로그인 성공
			UserDto dto = optional.get(); 
			
			session.setAttribute("userDto", dto); // session에다 담아준다.
			System.out.println(dto.getProfileImage());
			map.put("result","success");
		}
		
		else map.put("result", "fail");
		
		return map;
	}
}
