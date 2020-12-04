package com.example.demo.controller;

import java.util.HashMap;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dao.FindEmailPwDao;
import com.example.demo.service.UserSha256;

@Controller
public class FindEmailPwController {
	
	//源껉퉫源껉퉫源껉퉫源껉퉫源�
	@Autowired
	private FindEmailPwDao dao;
	
	
	@Autowired
	private MailSender javamailMailSender;

	public void setDao(FindEmailPwDao dao) {
		this.dao = dao;
	}
	
	public void setJavamailMailSender(MailSender javamailMailSender) {
		this.javamailMailSender = javamailMailSender;
	}
	

	//濡쒓렇�씤: 媛��엯 �씠硫붿씪 李얘린
	@RequestMapping(value="/findEmail.do", method=RequestMethod.POST)
	@ResponseBody
	public String findEmail(String name, String m_phone) {
		System.out.println("�씠硫붿씪李얘린 而⑦듃濡ㅻ윭 �룞�옉�븿");
		System.out.println("�씠由�:: " + name);
		System.out.println("�쟾踰�:: " + m_phone);
		HashMap map = new HashMap();
		map.put("name", name);
		map.put("m_phone", m_phone);
		String re = dao.FindEmail(map);
		System.out.println(re);
		return re;
	}
	
	@RequestMapping(value = "/emailCheck.do", method=RequestMethod.GET)
	@ResponseBody
	public void emailCheck() {
		
	}
	
	//�쉶�썝媛��엯: �씠硫붿씪 以묐났泥댄겕
	@RequestMapping(value = "/emailCheck.do", method=RequestMethod.POST)
	@ResponseBody
	public String emailCheck(@RequestParam (value="email")String email) {
		System.out.println("以묐났泥댄겕 �룞�옉�븿");
		System.out.println(email);
		String re = dao.checkEmail(email);
		System.out.println(re);
		return re;
	}
	
	
	//�뙣�뒪�썙�뱶 �씠硫붿씪 蹂대궡�뒗 硫붿냼�뱶
	public String sendPwEmailExecute(String email, String name, String tempPw){
		String r  = "";
		SimpleMailMessage mailMessage = new SimpleMailMessage();
		mailMessage.setSubject(name + " �떂 Delibrary 怨꾩젙 �엫�떆 鍮꾨�踰덊샇");
		mailMessage.setFrom("hello@delibrary.gov.kr");
		mailMessage.setText("�븞�뀞�븯�꽭�슂. �쉶�썝�떂猿� �엫�떆 鍮꾨�踰덊샇瑜� 諛쒓툒�빐�뱶�졇�뒿�땲�떎.\n "
				+ "�븘�옒 �엫�떆 鍮꾨�踰덊샇濡� 濡쒓렇�씤 �뮘 �쉶�썝�젙蹂� 蹂�寃쎌뿉�꽌 鍮꾨�踰덊샇瑜� 蹂�寃쏀빐 二쇱꽭�슂!\n\n" + 
				 "�엫�떆 鍮꾨�踰덊샇: " + tempPw + "\n\n" + 
				"�엫�떆 鍮꾨�踰덊샇�뿉 愿��젴�븯�뿬 沅곴툑�븯�떊 �젏�씠�굹 媛쒖꽑�궗�빆 嫄댁쓽 �떆 hello@delibrary.gov.kr �쑝濡� 蹂대궡二쇱떆嫄곕굹 \n"+
				 "�궗�씠�듃 �궡 Q&A 寃뚯떆�뙋�쓣 �씠�슜�빐 二쇱떆湲� 諛붾엻�땲�떎.\n\n"
				+"媛먯궗�빀�땲�떎. \n\n" + 				 
				"-�� �뵜由щ툕�윭由�-" + "\n\n" 
				+ "�뵜由щ툕�윭由� �씠�슜�븯�윭媛�湲�: http://localhost:8088/LoginPage.do");
		mailMessage.setTo(email);
			try {
				javamailMailSender.send(mailMessage);
			}catch (Exception e) {
				// TODO: handle exception'
				System.out.println("�씠硫붿씪蹂대궡湲� �삤瑜� " + e.getMessage());
			}
		return r;
	}	
	
	//濡쒓렇�씤: 鍮꾨쾲李얘린 李� �뀋�뀑
	@RequestMapping(value = "/pwEmail.do", method=RequestMethod.POST)
	@ResponseBody
	public String sendPwEmail(String name, String email) {
		System.out.println("�씠由� �뱾�뼱媛� ::::" + name);
		System.out.println("�씠硫붿씪 �뱾�뼱媛�::::" + email);
		HashMap map = new HashMap();
		map.put("name", name);
		map.put("email", email);
		String re = dao.sendPwEmail(map);
		int result = Integer.parseInt(re);
		System.out.println(result);
		if(result > 0) {
			String tempPw = randomPwGenerator();
			HashMap map2 = new HashMap();
			map2.put("email", email);
			map2.put("pw", UserSha256.encrypt(tempPw));
			dao.updatePw(map2);
			sendPwEmailExecute(email, name, tempPw);
		}
		return re;		
	}
	
	//�뙣�뒪�썙�뱶蹂�寃� 硫붿냼�뱶
	@RequestMapping(value = "/pwChangeInEmail.do", method=RequestMethod.POST)
	@ResponseBody
	public String updatePw(String email, String pw) {
		HashMap map = new HashMap();
		pw = UserSha256.encrypt(pw);
		map.put("email", email);
		map.put("pw", pw);
		int re = dao.updatePw(map);
		return re + "";
	}
			
	//�엫�떆 鍮꾨�踰덊샇 留뚮뱾湲�
	public String randomPwGenerator() {
		Random rand = new Random();
		String[] capital = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X","Y", "Z"};
		String[] smallLetter = {"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"};
		int a = rand.nextInt(capital.length);
		int b = rand.nextInt(smallLetter.length);
		String randNo = "";
		
		for(int i=0; i<5; i++) {
			randNo += rand.nextInt(9) + "";
		}
		
        String randomPw = smallLetter[b]+ randNo + capital[a];
		return randomPw;
	}
	
	@RequestMapping(value = "/pwChangeInEmail.do", method=RequestMethod.GET)
	public void updatePw() {

	}
	
	
//	@RequestMapping(value="/insertCustomerSuccess.do", method=RequestMethod.POST)
//	public void insertCustomerOk(String email, String pw){
//		
//	}
	
}
