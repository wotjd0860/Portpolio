package com.example.demo.Controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.DAO.HomeDAO;
import com.example.demo.VO.CustomerVO;
import com.example.demo.VO.InsertCustomerVO;

@Controller
public class MainController {
	
	@Autowired
	private HomeDAO dao;

	@RequestMapping("LoginPage.do")
	public void loginPage() {}
	
	@RequestMapping("siteMap.do")
	public void siteMap() {}
	
	@RequestMapping(value = "optOutCustomer.do", method = RequestMethod.GET)
	public void optOutCustomer() {}
	
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
	
	@RequestMapping("logout.do")
	public String Logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("cust_no");
		return "LoginPage";
	}
	
	@RequestMapping(value = "insertCustomer.do", method = RequestMethod.GET)
	public void insertCustomerPage() {}
	
	@RequestMapping(value = "insertCustomer.do", method = RequestMethod.POST)
	public String insertCustomer(InsertCustomerVO vo, CustomerVO custVO, HttpServletRequest request, MultipartFile uploadfile) throws IllegalStateException, IOException {
		String email = vo.getEmail1() + "@" + vo.getEmail2();
		String addr = vo.getAddr2() + vo.getAddr3();
		
		//INTEREST
		String[] values = request.getParameterValues("interest");
		String interest = "";
		for (int i = 0; i < values.length; i++) {
			if (i == values.length-1) {
				interest += values[i];
			} else {
				interest += (values[i] + ",");
			}
		}
		
		// file
		String path = request.getServletContext().getRealPath("img");
		if (!uploadfile.isEmpty()) {
			String fname = uploadfile.getOriginalFilename();
			uploadfile.transferTo(new File(path));
			custVO.setFname(fname);
		} else {
			custVO.setFname("");
		}
		
		custVO.setEmail(email);
		custVO.setAddr(addr);
		custVO.setInterest(interest);

		
		dao.insertCustomer(custVO);
		return "redirect:Home.do";
	}
	
	@RequestMapping(value = "optOutCustomerOk.do", method = RequestMethod.POST)
	public String optOutCustomerOk(HttpServletRequest request) {
		Map map = new HashMap();
		HttpSession session = request.getSession();
		if(request.getParameter("email") != null) {
			String email = request.getParameter("email")+ "@" + request.getParameter("emailer");
			String pw = request.getParameter("pw");
			map.put("email", email);
			map.put("pw", pw);
			dao.OptOut(map);
		}
		session.removeAttribute("cust_no");
		return "redirect:Home.do";
	}
}