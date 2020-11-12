package com.example.demo.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.dao.BookDAO;
import com.example.demo.dao.BookStoreDAO;

@Controller
public class DetailBookController {
	@Autowired
	private BookDAO dao;

	public void setDao(BookDAO dao) {
		this.dao = dao;
	}
	@Autowired
	private BookStoreDAO dao2;

	public void setDao2(BookStoreDAO dao2) {
		this.dao2 = dao2;
	}
	@RequestMapping("/detailBook.do")
	public void list(int b_no, Model model, HttpServletRequest request) {
		model.addAttribute("b", dao.findByNo(b_no));
		model.addAttribute("bs", dao2.findByNo());
		model.addAttribute("query", request.getParameter("query"));
		System.out.println(request.getParameter("query"));
	}
}
