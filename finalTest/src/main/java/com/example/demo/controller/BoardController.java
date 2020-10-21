package com.example.demo.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.dao.PostDAO;

@Controller
public class BoardController {
	
	public static int pageSIZE =  2;
	public static int totalCount  = 0;
	public static int totalPage = 1;
	
	@Autowired
	private PostDAO dao;
	
	@RequestMapping("/listPost.do")
	   public String postList(Model model, String group, @RequestParam(value = "pageNUM", defaultValue = "1") int pageNUM) {
	      HashMap map=new HashMap();
	      map.put("group", group);
	      
	      totalCount = dao.getTotalCount(map);
	      totalPage = (int)Math.ceil( (double)totalCount/pageSIZE ) ;
	      int start = (pageNUM-1)*pageSIZE + 1;
	      int end = start + pageSIZE -1;
	      if(end > totalCount) {
	         end = totalCount;
	      }
	      
	      map.put("start", start);
	      map.put("end", end);
	      
	      model.addAttribute("list", dao.getListPost(map));
	      model.addAttribute("group", group);
	      model.addAttribute("totalCount", totalCount);
	      model.addAttribute("totalPage", totalPage);
	      model.addAttribute("start", start);
	      model.addAttribute("end", end);
	      return "listPost";
	   }
}
