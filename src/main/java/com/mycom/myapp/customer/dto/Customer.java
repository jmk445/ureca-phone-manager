package com.mycom.myapp.customer.dto;

public class Customer {
private int customerId;
private String customerName;
private String email;
public int getCustomerId() {
	return customerId;
}
public void setCustomerId(int customerId) {
	this.customerId = customerId;
}
public String getCustomerName() {
	return customerName;
}
public void setCustomerName(String customerName) {
	this.customerName = customerName;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
@Override
public String toString() {
	return "Customer [customerId=" + customerId + ", customerName=" + customerName + ", email=" + email + "]";
}
public Customer(int customerId, String customerName, String email) {
	super();
	this.customerId = customerId;
	this.customerName = customerName;
	this.email = email;
}

public Customer() {
	
}


}
