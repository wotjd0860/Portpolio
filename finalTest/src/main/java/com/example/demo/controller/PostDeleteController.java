package com.example.demo.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.PostDAO;
import com.example.demo.vo.PostVO;

@Controller
@RequestMapping("postDeleteCreate.do")
public class PostDeleteController {
	@Autowired
	private PostDAO dao;
	public void setDao(PostDAO dao) {
		this.dao = dao;
	}
	
	@RequestMapping(method = RequestMethod.GET)
	public void form(int p_id, Model model) {
		
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView submit(HttpServletRequest request, int p_id) {
		HashMap map=new HashMap();
		map.put("p_id", p_id);
		
		ModelAndView mav=new ModelAndView("redirect:/postListCreate.do");
		int re=dao.delete(map);
		if(re<=0) {
			mav.addObject("msg", "�Խñ� ������ ���������� �Ϸ���� �ʾҽ��ϴ�.");
			mav.setViewName("error");
		}
		return mav;
	}
}
