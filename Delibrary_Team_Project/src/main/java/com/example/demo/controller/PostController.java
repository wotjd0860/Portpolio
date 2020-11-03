package com.example.demo.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.CustomerDAO;
import com.example.demo.dao.PostDAO;
import com.example.demo.dao.ReplyDAO;
import com.example.demo.vo.CustomerVO;
import com.example.demo.vo.PostVO;

@Controller
public class PostController {

   public static int pageSIZE =  3;
   public static int totalCount  = 0;
   public static int totalPage = 1;
   public static int updateHit=0;
   
   @Autowired
   private PostDAO dao;
   public void setDao(PostDAO dao) {
      this.dao = dao;
   }
   
   @Autowired
   private ReplyDAO re_dao;
   public void setRe_dao(ReplyDAO re_dao) {
      this.re_dao = re_dao;
   }
   
   @Autowired
   private CustomerDAO c_dao;
   public void setC_dao(CustomerDAO c_dao) {
	   this.c_dao = c_dao;
   }
   
   //전체 게시글 목록
   @RequestMapping("/postList.do")
   public void postList(Model model, int group, @RequestParam(value = "pageNUM", defaultValue = "1") int pageNUM) {

      HashMap map=new HashMap();
      map.put("group", group);
      
      totalCount = dao.getTotalCount(map);
      totalPage = (int)Math.ceil( (double)totalCount/pageSIZE ) ;
      int start = (pageNUM-1)*pageSIZE + 1;
      int end = start + pageSIZE-1;
      if(end > totalCount) {
         end = totalCount;
      }
      
      model.addAttribute("list", dao.findAll(map));
      model.addAttribute("group", group);
      model.addAttribute("start", start-1);
      model.addAttribute("end", end-1);
      model.addAttribute("totalCount", totalCount);
      model.addAttribute("totalPage", totalPage);
   }

   //게시글 상세보기
   //전체 댓글목록
   @RequestMapping("/postDetail.do")
   public void detail(int p_id, int group, Model model) {
      
      updateHit=dao.updateHit(p_id);
      
      HashMap map=new HashMap();
      map.put("p_id", p_id);
      map.put("group", group);
      
      model.addAttribute("p",dao.findById(map));
      model.addAttribute("group", group);
      model.addAttribute("listReply",re_dao.findAll(map));
   }
   
   //새글 작성
   @RequestMapping(value="/postInsert.do", method = RequestMethod.GET)
   public void form(Model model, String nickname, int cust_no, int group) {
	   CustomerVO c=c_dao.findByCust_No(cust_no);
	   
	   model.addAttribute("group", group);
	   model.addAttribute("c", c_dao.findByCust_No(cust_no));
   }
   
   @RequestMapping(value="/postInsert.do", method = RequestMethod.POST)
   public ModelAndView submit(HttpServletRequest request, PostVO p, int group) {
      
      String path=request.getRealPath("upload");
      System.out.println("path : "+path);
      
      ModelAndView mav=new ModelAndView("redirect:/postList.do");
      int re=dao.insert(p);

      if(re<=0) {
         mav.addObject("msg", "게시글 작성 실패");
         mav.setViewName("error");
      }
      
      return mav;
   }
   
   //게시글 수정
   @RequestMapping(value="postUpdate.do", method = RequestMethod.GET)
   public void update(int group, int p_id, int cust_no, String nickname, Model model) {
	   HashMap map=new HashMap();
	   map.put("p_id", p_id);
	   map.put("cust_no", cust_no);
	   map.put("group", group);
	   
	   CustomerVO c=c_dao.findByCust_No(cust_no);

	   model.addAttribute("group", group);
	   model.addAttribute("c", c_dao.findByCust_No(cust_no));
	   model.addAttribute("p", dao.findById(map));
   }
   @RequestMapping(value="postUpdate.do", method = RequestMethod.POST)
   public ModelAndView update(HttpServletRequest request, PostVO p, int group) {
	  String p_title=request.getParameter(p.getP_title());
	  p.setP_title(p_title);
	  String p_content=request.getParameter(p.getP_content());
	  p.setP_content(p_content);
            
      ModelAndView mav=new ModelAndView("redirect:/postList.do?group="+group);
      int re=dao.update(p);
      if(re<=0) {
         mav.addObject("msg", "게시글 수정 실패");
         mav.setViewName("error");
      }
      return mav;
   }
   
   //게시글 삭제
   @RequestMapping(value = "postDelete.do", method = RequestMethod.GET)
   public void delete(int p_id, int cust_no, Model model) {
      
   }
   @RequestMapping(value = "postDelete.do", method = RequestMethod.POST)
   public ModelAndView delete(HttpServletRequest request, int p_id, int cust_no) {
      
      System.out.println(p_id+", "+cust_no);
      
      HashMap map=new HashMap();
      map.put("p_id", p_id);
      map.put("cust_no", cust_no);
      
      ModelAndView mav=new ModelAndView("redirect:/postList.do");
      int re=dao.delete(map);
      if(re<=0) {
         mav.addObject("msg", "게시글 삭제 실패");
         mav.setViewName("error");
      }
      return mav;
   }
}
