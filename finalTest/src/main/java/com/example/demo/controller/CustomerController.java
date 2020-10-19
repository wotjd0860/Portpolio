package com.example.demo.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.dao.CustomerDao;
import com.example.demo.vo.CustomerVO;

@Controller
public class CustomerController {

	@Autowired
	private CustomerDao dao;
	
	public void setDao(CustomerDao dao) {
		this.dao = dao;
	}

	@RequestMapping("/MyPage_Info.do")
	public void detail(int cust_no, Model model, HttpServletRequest request) {
		
		CustomerVO c = dao.findByCust_No(cust_no);
		
		request.setAttribute("c", c);
		String Email = c.getEmail();
		String id = Email.substring(0, Email.indexOf("@"));
		System.out.println(id);
		String email = Email.substring(Email.indexOf("@")+1);
		System.out.println(email);
		request.setAttribute("id", id);
		request.setAttribute("email", email);
		
		model.addAttribute("c",dao.findByCust_No(cust_no));
	}
}
