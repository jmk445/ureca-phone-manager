package com.mycom.myapp.customer.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycom.myapp.customer.dto.Customer;

@Mapper
public interface CustomerDao {
	List<Customer> listCustomer();
	Customer detailCustomer(int customerId);
	int insertCustomer(Customer customer);
	int updateCustomer(Customer customer);
	int deleteCustomer(int customerId);
}
