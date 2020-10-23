package com.example.demo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.dao.CustomerDAO;
import com.example.demo.dao.MypageDAO;

@Controller
public class MypageController {

	@Autowired
	private MypageDAO dao;
	public void setDao(MypageDAO dao) {
		this.dao = dao;
	}
	
	@Autowired
	private CustomerDAO dao2;
	public void setDao2(CustomerDAO dao2) {
		this.dao2 = dao2;
	}
	
	@RequestMapping("/MyPage_Folder.do")
	public void mypageFolder(int cust_no, HttpServletRequest request, HttpSession session) {
		session = request.getSession();
		
		cust_no = (int)session.getAttribute("cust_no");
		
		request.setAttribute("c", dao2.findByCust_No(cust_no));
		request.setAttribute("flist", dao.getUserFolder(cust_no));
		request.setAttribute("cust_no", cust_no);
	}
	
}
