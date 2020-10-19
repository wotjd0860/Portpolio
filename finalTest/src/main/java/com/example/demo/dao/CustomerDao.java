package com.example.demo.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.CustomerManager;
import com.example.demo.vo.CustomerVO;

@Repository
public class CustomerDao {

	public List<CustomerVO> findAll(){
		return CustomerManager.findAll();
	}
	
	public CustomerVO findByCust_No(int cust_no) {
		return CustomerManager.findByCust_No(cust_no);
	}
	
	public int update(CustomerVO c) {
		return CustomerManager.update(c);
	}
}
