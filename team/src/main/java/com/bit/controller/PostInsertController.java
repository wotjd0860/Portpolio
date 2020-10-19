package com.bit.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bit.dao.PostDAO;
import com.bit.vo.PostVO;

@Controller
@RequestMapping("/postInsert.do")
public class PostInsertController {

	@Autowired
	private PostDAO dao;
	public void setDao(PostDAO dao) {
		this.dao = dao;
	}
	
	@RequestMapping(method = RequestMethod.GET)
	public void form() {
		
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView submit(HttpServletRequest request, PostVO p) {
		ModelAndView mav=new ModelAndView("redirect:/postList.do");
		int re=dao.insertCreate(p);
		if(re<=0) {
			mav.addObject("msg", "게시물 등록 실패");
			mav.setViewName("error");
		}
		
		return mav;
	}
}
