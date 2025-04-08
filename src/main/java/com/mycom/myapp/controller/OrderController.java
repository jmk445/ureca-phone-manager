package com.mycom.myapp.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycom.myapp.dto.Order;
import com.mycom.myapp.service.OrderService;

@Controller
@RequestMapping("/orders")
public class OrderController {
	private final OrderService orderService;
	
	public OrderController(OrderService orderService) {
		this.orderService = orderService;
	}
	
	
	
	@GetMapping("/list")
	@ResponseBody
	public List<Order> listOrder(){
		return (this.orderService.listOrders());
	}
	
}
