package com.example.demo.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.CustomerDAO;
import com.example.demo.dao.QnaDAO;
import com.example.demo.dao.ReplyDAO;
import com.example.demo.vo.PostVO;

import lombok.Setter;

@Controller
public class QnaController {
	
	public static int pageSIZE =  3;	//�븳 �럹�씠吏��뿉 蹂댁뿬以� 寃뚯떆湲��쓽 �닔
	public static int pageMAX =  5;		//�븳 �럹�씠吏��뿉�꽌 �럹�씠吏뺣컮 �닔
	public static int totalCount  = 0;	
	public static int totalPage = 0;	
	public static int updateHit = 0;
	public static int nextId;
	public static int nextNo;
	
	@Autowired
	@Setter
	private QnaDAO dao;
	
	@Autowired
	@Setter
	private ReplyDAO re_dao;
	
	@Autowired
	@Setter
	private CustomerDAO c_dao;
	
	
		//紐⑸줉
		@RequestMapping("/QnaList.do")
		public void list(Model model, @RequestParam(value = "pageNUM", defaultValue = "1") int pageNUM, String option, String search, HttpSession session) {
			System.out.println("***pageNUM : "+	pageNUM);

			
			
			System.out.println("search::::"+search);
			System.out.println("option::::"+option);
			
			if( search == null && session.getAttribute("search") != null) {
				search = (String)session.getAttribute("search");
				option = (String)session.getAttribute("option");
			}
			
			HashMap map=new HashMap();
			
			map.put("search", search);
			map.put("option", option);
			
			totalCount = dao.getTotalCount(map);
			totalPage = (int)Math.ceil( (double)totalCount/pageSIZE );
			
			//�럹�씠吏� 踰꾪듉 �닽�옄
			int startPage = (pageNUM-1)/pageMAX*pageMAX+1;
			int endPage = startPage+pageMAX-1;
			if(endPage>totalPage) {
				endPage = totalPage;
			}
			
//			map.put("startPage", startPage);
//			map.put("endPage", endPage);
			
			//�럹�씠吏��뿉 異쒕젮�릺�뒗 �젅肄붾뱶踰덊샇
			int start = (pageNUM-1)*pageSIZE+1;
			int end = start + pageSIZE-1; 
			if (end > totalCount) {
				end = totalCount;
			}
			map.put("start", start);
			map.put("end", end);
			
			
			
			System.out.println("***start : "+start);
			System.out.println("***end : "+end);
			System.out.println("***startPage : "+startPage);
			System.out.println("***endPage : "+endPage);
			System.out.println("***totalPage : "+totalPage);
			
		
			
			
			model.addAttribute("list", dao.findAll(map));
			model.addAttribute("totalCount", totalCount);
			model.addAttribute("totalPage", totalPage);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
//			model.addAttribute("start", start);
//			model.addAttribute("end", end);
			model.addAttribute("pageNUM", pageNUM);
			
			if(search != null) {
				session.setAttribute("search", search);
				session.setAttribute("option", option);
			}
			
			//nav諛붿뿉 ~�떂 �븯湲곗쐞�븳 肄붾뱶
//			model.addAttribute("cust_name",c_dao.findByCust_No((int)session.getAttribute("cust_no")).getName());
			
		
		}
		
	
	
		//�긽�꽭蹂닿린 + �뙎湲�
		@RequestMapping("/QnaDetail.do")
		public void detail(HttpServletRequest request, Model model) {
			int p_id = 0;
			
			if(request.getParameter("p_id")!=null) {
				p_id = Integer.parseInt(request.getParameter("p_id"));
			}
			System.out.println(p_id);
			
			updateHit = dao.updateHit(p_id);
			
			HashMap map = new HashMap();
			map.put("p_id", p_id);
			
			model.addAttribute("qna", dao.getQna(p_id));
			model.addAttribute("listReply",re_dao.findAll(map));
		
			//濡쒓렇�씤�맂 �쉶�썝踰덊샇 諛쏆븘�삤湲�
			HttpSession session=request.getSession(); 
			session.setAttribute("cust_no", session.getAttribute("cust_no"));
		}
	
		
	
	   //�깉湲� �옉�꽦
	   @RequestMapping(value="/QnaInsert.do", method = RequestMethod.GET)
	   public void insertForm(Model model, String nickname, int cust_no , PostVO post) {
		    nextId=dao.getNextId();
			post.setP_id(nextId);
			nextNo=dao.getNextNo();
			post.setP_no(nextNo);
			
			model.addAttribute("p_id", nextId);
			model.addAttribute("p_no", nextNo);
			model.addAttribute("c", c_dao.findByCust_No(cust_no));
	   }
	   @RequestMapping(value="/QnaInsert.do", method = RequestMethod.POST)
	   public ModelAndView insertSubmit(PostVO pvo,int cust_no, int p_id, int p_no, String p_title,String p_content, HttpServletRequest request) {
	      
		    String path=request.getRealPath("img");
			System.out.println("path : "+path);
			
			MultipartFile uploadFile = pvo.getUploadFile();
			String fname = uploadFile.getOriginalFilename();
			
			if(fname != null && !fname.equals("")) {
				try {
					byte[] data = uploadFile.getBytes();
					FileOutputStream fos = new FileOutputStream(path + "/" + fname);
					fos.write(data);
					fos.close();
				}catch (Exception e) {
					System.out.println("�삁�쇅諛쒖깮 : " + e.getMessage());
				}
				pvo.setFname(fname);
	        } else{
	        	pvo.setFname("");
	        }
			
			
			
			String p_writer = c_dao.findByCust_No(cust_no).getNickname();
			int p_hit=0;
			
			HashMap map=new HashMap();
			map.put("p_id", p_id);
			map.put("p_no", p_no);
			map.put("cust_no", cust_no);
			map.put("p_title", p_title);
			map.put("p_writer", p_writer);
			map.put("p_content", p_content);
			map.put("p_hit", p_hit);
			map.put("fname", fname);
	      
			ModelAndView mav = new ModelAndView("redirect:/QnaList.do?option=p_title&search=");
			int re=dao.insert(map);	
		     if(re<=0) {
		        mav.addObject("msg", "寃뚯떆湲��씠 �젙�긽�쟻�쑝濡� �벑濡앸릺吏� �븡�븯�뒿�땲�떎.");
		        mav.setViewName("error");
		     }
		     
		     return mav;
	   }
	   
	   //寃뚯떆湲� �닔�젙
	   @RequestMapping(value="QnaUpdate.do", method = RequestMethod.GET)
	   public void update(int p_id, int cust_no, String nickname, Model model) {
		   HashMap map = new HashMap();
		   map.put("p_id", p_id);
		   map.put("cust_no", cust_no);
		      
		   model.addAttribute("c", c_dao.findByCust_No(cust_no));
		   model.addAttribute("qna", dao.getQna(p_id));
	   }
	   @RequestMapping(value="QnaUpdate.do", method = RequestMethod.POST)
	   public ModelAndView update(HttpServletRequest request, PostVO m, MultipartFile uploadFile) {
		  
		   	String path = request.getRealPath("img");
			System.out.println("path: "+path);
			String oldFname = m.getFname();
			String fname = uploadFile.getOriginalFilename();
			if(fname != null && !fname.equals("")) {
				m.setFname(fname);
				try {
					byte[] data = uploadFile.getBytes();
					FileOutputStream fos = new FileOutputStream(path + "/" + fname);
					fos.write(data);
					fos.close();
				}catch (Exception e) {
					System.out.println("�삁�쇅諛쒖깮 updateCustomer : " + e.getMessage());
				}
				m.setFname(fname);
	        } else{
	           m.setFname(oldFname);
	        }  
		   
	      ModelAndView mav=new ModelAndView("redirect:/QnaDetail.do?p_id="+m.getP_id());
	      int re = dao.update(m);
	      if(re<=0) {
	         mav.addObject("msg", "寃뚯떆湲��씠 �젙�긽�쟻�쑝濡� �닔�젙�릺吏� �븡�븯�뒿�땲�떎.");
	         mav.setViewName("error");
	      }else {
				if(fname != null && !fname.equals("") && !m.getFname().equals("")) {
					File file = new File(path + "/" + oldFname);
													// oldFname�쑝濡� 蹂�寃�
					file.delete();
				}
	  	  }
	      return mav;
	   }	   
	   
	    //寃뚯떆湲� �궘�젣
	    @RequestMapping(value = "QnaDelete.do", method = RequestMethod.POST)
		@ResponseBody
		public int delete(int p_id, int cust_no, HttpServletRequest request) {
			int re=-1;

			HashMap map=new HashMap();
			map.put("p_id",p_id);
			map.put("cust_no",cust_no);
			
			re=dao.delete(map);

			return re;
		}
}
