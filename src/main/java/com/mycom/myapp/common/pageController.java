package com.mycom.myapp.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class pageController {
	

	@GetMapping("/pages/register")
	public String register() {
		return "register";
	}
	
	@GetMapping("/pages/login")
	public String login() {
		return "login";
	}	

	
	
	@GetMapping("/pages/orders")
	public String orders() {
		return "orders";
	}
	@GetMapping("/pages/shopping")
	public String shopping() {
		return "shopping";
	}
	@GetMapping("/pages/customers")
	public String customers() {
		return "customers";
	}
	@GetMapping("/phones")
	public String phones() {
		return "phones";
	}
	
}
