package com.mycom.myapp.customer.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycom.myapp.customer.dto.Customer;
import com.mycom.myapp.customer.service.CustomerService;

@Controller
@RequestMapping("/customers")
public class CustomerController {
	private final CustomerService customerService;
	public CustomerController(CustomerService customerService) {
		this.customerService = customerService;
	}
	
	@GetMapping(value="/")
	public String customerMain() {
		return "customers";
	}
	
	@GetMapping("/list")
	@ResponseBody
	public List<Customer> listCustomer(Model model) {
		List<Customer> customerList = customerService.listCustomer();	
		return customerList;		
	}
	
	@GetMapping(value="/detail/{customerId}")
	@ResponseBody
	public Customer detailCustomer(@PathVariable int customerId) {
		System.out.println(customerId);
		Customer  customer = customerService.detailCustomer( customerId);
		
		return customer;		
	}
	
	@PostMapping(value="/insert")
	@ResponseBody
	public Map<String, String> insertCustomer(Customer customer) {
		System.out.println(customer);
		int ret = customerService.insertCustomer(customer);
		System.out.println(ret);		
		Map<String, String> map = new HashMap<>();
        if (ret == 1) {
            map.put("result", "success");
        } else {
            map.put("result", "fail");
        }
        
        return map;	
	}
	//수정 : 	/customers/update, 		post, customer, updateResult.jsp
	@PostMapping(value="/update")
	@ResponseBody
	public Map<String, String> updateCustomer(Customer customer) {
		System.out.println(customer);
		int ret = customerService.updateCustomer(customer);
		System.out.println(ret);
		Map<String, String> map = new HashMap<>();
        if (ret == 1) {
            map.put("result", "success");
        } else {
            map.put("result", "fail");
        }
        
        return map;		
	}
	//삭제 : 	/customers/delete, 		get,  customerId	, deleteResult.jsp
	@GetMapping(value="/delete/{customerId}")
	@ResponseBody
	public Map<String, String> deleteCustomer(@PathVariable int customerId, Model model) {
		System.out.println(customerId);
		int ret = customerService.deleteCustomer(customerId);	
		Map<String, String> map = new HashMap<>();
        if (ret == 1) {
            map.put("result", "success");
        } else {
            map.put("result", "fail");
        }
        
        return map;	
	}
}
