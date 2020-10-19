package com.example.demo.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.dao.PostDAO;

@Controller
public class QnaController {
	
	public static int pageSIZE =  10;
	public static int totalCount  = 0;
	public static int totalPage = 1;
	
	@Autowired
	private PostDAO dao;

	public void setDao(PostDAO dao) {
		this.dao = dao;
	}
	
	@RequestMapping("/listQna.do")
	public void list(Model model, @RequestParam(value = "pageNUM", defaultValue = "1") int pageNUM) {
		totalCount = dao.getTotalCount();
		totalPage = (int)Math.ceil( (double)totalCount/pageSIZE ) ;
		int start = (pageNUM-1)*pageSIZE + 1;
		int end = start + pageSIZE;
		if(end > totalCount) {
			end = totalCount;
		}
		
		HashMap map = new HashMap();
		map.put("start",start);
		map.put("end",end);
		
	
		model.addAttribute("list", dao.findAll(map));
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("totalCount", totalCount);
	
	}
	
	@RequestMapping("/detailQna.do")
	public void detail(int p_id, Model model) {
		model.addAttribute("p", dao.getQna(p_id));
	}
	
	
}
