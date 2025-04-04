package com.mycom.myapp.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mycom.myapp.dao.CustomerDao;
import com.mycom.myapp.dto.Customer;

@Service
public class CustomerService {
	
	private final CustomerDao customerDao;
	public CustomerService(CustomerDao customerDao) {
		this.customerDao = customerDao;
	}
	
	public List<Customer> listCustomer(){
		return customerDao.listCustomer();
	}
	public Customer detailCustomer(int customerId) {
		return customerDao.detailCustomer(customerId);
	}
	public int insertCustomer(Customer customer) {
		return customerDao.insertCustomer(customer);
	}
	public int updateCustomer(Customer customer) {
		return customerDao.updateCustomer(customer);
	}
	public int deleteCustomer(int customerId) {
		return customerDao.deleteCustomer(customerId);
	}
	
}

