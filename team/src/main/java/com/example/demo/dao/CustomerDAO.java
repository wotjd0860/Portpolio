package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.CustomerManager;
import com.example.demo.vo.CustomerVO;

@Repository
public class CustomerDAO {
	
	//회원가입
	public int insertCustomer(CustomerVO c) {
		return CustomerManager.insertCustomer(c);
	}
	
	//회원탈퇴
	public int deleteCustomer(HashMap map) {
		return CustomerManager.deleteCustomer(map);
	}
	
	//회원넘버받아오기
	public int getNextNo() {
		return CustomerManager.getNextNo();
	}
	
	//로그인
	public CustomerVO logIn(HashMap map) {
		return CustomerManager.logInCustomer(map);
	}


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