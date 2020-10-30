package com.example.demo.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.dao.QnaDAO;
import com.example.demo.dao.ReplyDAO;

import jdk.jfr.SettingDefinition;
import lombok.Setter;

@Controller
public class QnaController {
	
	public static int pageSIZE =  2;
	public static int totalCount  = 0;
	public static int totalPage = 1;
	public static int updateHit = 0;
	
	@Autowired
	@Setter
	private QnaDAO dao;
	
	@Autowired
	@Setter
	private ReplyDAO re_dao;
			
	
	@RequestMapping("/QnaList.do")
	public void list(Model model, @RequestParam(value = "pageNUM", defaultValue = "1") int pageNUM) {
		
		 HashMap map=new HashMap();
		
		totalCount = dao.getTotalCount(map);
		totalPage = (int)Math.ceil( (double)totalCount/pageSIZE ) ;
		int start = (pageNUM-1)*pageSIZE + 1;
		int end = start + pageSIZE;
		if(end > totalCount) {
			end = totalCount;
		}
		
		map.put("start",start);
		map.put("end",end);
		
	
		model.addAttribute("list", dao.findAll(map));
		model.addAttribute("start", start-1);
		model.addAttribute("end", end-1);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("totalCount", totalCount);
	
	}
	
	@RequestMapping("/QnaDetail.do")
	public void detail(int p_id, Model model) {
		
		updateHit = dao.updateHit(p_id);
		
		model.addAttribute("p", dao.getQna(p_id));
		
	}
	
	
}
