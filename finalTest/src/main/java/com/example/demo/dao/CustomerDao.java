package com.example.demo.dao;

import java.util.HashMap;

import org.springframework.stereotype.Repository;

import com.example.demo.db.CustomerManager;
import com.example.demo.vo.CustomerVO;

@Repository
public class CustomerDao {
	
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
	
}
