package com.example.demo.controller;

import java.sql.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.CustomerDAO;
import com.example.demo.dao.HomeDAO;
import com.example.demo.vo.CustomerVO;

@Controller
public class CustomerController {
   @Autowired
   private CustomerDAO dao;
   
   @Autowired
   private HomeDAO dao2;

   public void setDao(CustomerDAO dao) {
      this.dao = dao;
   }

   //홈화면 임시
   @RequestMapping("/Home.do")
   public void home(Model model, CustomerVO
           custVO, String loginOk, HttpServletRequest request) {
      
	   if (request.getParameter("loginOk") != null) {
		   HashMap map = new HashMap();
		   String email = request.getParameter("email");
		   String password = request.getParameter("pw");
		   map.put("email",email);
		   map.put("pw",password);
		   custVO = dao.getLoginInfo(map);
			
			if (email.equals(custVO.getEmail()) && password.equals(custVO.getPw())) {
				HttpSession session = request.getSession();
				session.setAttribute("cust_no", custVO.getCust_no());
				request.setAttribute("cust_no", custVO.getCust_no());
			}
		}
	   
      model.addAttribute("SRlist", dao2.getStaffRecommend());
      model.addAttribute("Newlist", dao2.getNewRecommend());
      model.addAttribute("HNlist", dao2.getHomePost(10));
      model.addAttribute("HMakinglist", dao2.getHomePost(20));
        model.addAttribute("HMarketlist", dao2.getHomePost(30));
      
      HttpSession session = request.getSession();
      request.setAttribute("cust_no", session.getAttribute("cust_no"));
   }
   
   //회원가입FORM
   @RequestMapping(value="/insertCustomer.do", method=RequestMethod.GET)
   public void insertCustomer() {
      
   }
   
   @RequestMapping(value="/insertCustomer.do", method=RequestMethod.POST)
   public ModelAndView insertCustomerOk(CustomerVO c, HttpServletRequest request) {
      ModelAndView mav = new ModelAndView("redirect:/LoginPage.do");
      
      // 파일 업로드
      String fname = "";
      MultipartFile multipartFile = c.getUploadFile();
      if (!multipartFile.isEmpty()) {
    	  fname = multipartFile.getOriginalFilename();
      }
      System.out.println("fname : " + c.getFname());
      c.setFname(fname);
      
      c.setCust_no(dao.getNextNo());
      System.out.println(c.getCust_no());
      
      String addr = request.getParameter("addr1") + request.getParameter("addr2");
      c.setAddr(addr);
      
      c.setName("");
      c.setM_phone("");
      c.setBirthday(Date.valueOf("2020-01-01"));
      
      
      int re = dao.insertCustomer(c);
      if(re<0) {
         mav.setViewName("/error");
      }
      
      return mav;
   }
   
   //로그인 FORM
   @RequestMapping(value="/LoginPage.do", method=RequestMethod.GET)
   public void logInForm() {
      
   }
   
   //로그인 OK
   @RequestMapping(value="/LoginPage.do", method=RequestMethod.POST)
   public ModelAndView logInOk(String email, String pw, HttpServletRequest request, HttpSession session) {
      ModelAndView mav = new ModelAndView("redirect:/Home.do");
      CustomerVO c = null;
      HashMap map = new HashMap();
      map.put("pw",pw);
      map.put("email",email);
      c = dao.logIn(map);
         if(c !=null) {
         //세션유지파트
         session = request.getSession();
         request.setAttribute("cust_no",c.getCust_no());         
         } else {
            mav.setViewName("/LoginPage.do");
         }
         return mav;
      }
   
   //로그아웃
   @RequestMapping(value="/logout.do")
   public ModelAndView logOut(HttpServletRequest request) {
      ModelAndView mav = new ModelAndView("redirect:/LoginPage.do");
      HttpSession session = request.getSession();
      session.removeAttribute("cust_no");
      return mav;
   }
   
   //회원탈퇴
   @RequestMapping(value="/optOutCustomer.do", method=RequestMethod.GET)
   public void deleteCustomerForm() {
      
   }
   
   @RequestMapping(value="/optOutCustomer.do", method=RequestMethod.POST)
   public ModelAndView deleteCustomerOk(String email, String emailer, String pw, HttpSession session) {
      ModelAndView mav = new ModelAndView("redirect:/Home");
      HashMap map = new HashMap();
      int re = dao.deleteCustomer(map);
      String completeEmail = email + emailer;
      System.out.println("이메일!!!!" + completeEmail);
      map.put("email",completeEmail);
      map.put("pw",pw);
      
      if(re<0) {
         mav.setViewName("/error");
      }
      return mav;   
   }

   // 회원정보 디테일 and 수정
   @RequestMapping("/MyPage_Info.do")
   public void detail(int cust_no, Model model, HttpServletRequest request) {
      
      CustomerVO c = dao.findByCust_No(cust_no);
      
      request.setAttribute("c", c);
      String Email = c.getEmail();
      String id = Email.substring(0, Email.indexOf("@"));
      String email = Email.substring(Email.indexOf("@")+1);
      request.setAttribute("id", id);
      request.setAttribute("email", email);
      
      model.addAttribute("c",dao.findByCust_No(cust_no));
   }

}