package com.example.demo.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.DAO.HomeDAO;
import com.example.demo.VO.CustomerVO;

@Controller
public class MainController {
	
	@Autowired
	private HomeDAO dao;

	@RequestMapping("/Home.do")
	public String home(Model model, CustomerVO custVO, String loginOk, HttpServletRequest request) {
		// 로그인 요청이 있는 경우
		if (loginOk != null) {
			CustomerVO vo = dao.getCustInfo(custVO);
			if (!custVO.getEmail().equals(vo.getEmail()) || !custVO.getPw().equals(vo.getPw())) {
				return "LoginPage";
			} else {
				HttpSession session = request.getSession();
				session.setAttribute("cust_no", vo.getCust_no());
			}
		}
		// 로그인 요청이 없는 경우 (맨 처음 홈화면에 접속한 경우)
		model.addAttribute("SRlist", dao.getStaffRecommend());
		model.addAttribute("Newlist", dao.getNewRecommend());
		model.addAttribute("HNlist", dao.getHomePost(10));
		model.addAttribute("HMakinglist", dao.getHomePost(20));
		model.addAttribute("HMarketlist", dao.getHomePost(30));
		return "Home";
	}
}