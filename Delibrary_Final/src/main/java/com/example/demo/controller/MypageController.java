package com.example.demo.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dao.CustomerDAO;
import com.example.demo.dao.MypageDAO;
import com.example.demo.dao.PostDAO;
import com.example.demo.dao.ReplyDAO;
import com.example.demo.vo.PostVO;

@Controller
public class MypageController {
	
	public static int totalFol = 0;
	public static int totalFile = 0;
	
	public static int updateHit=0;
	public static int pageSIZE =  2;
	public static int totalCount  = 0;
	public static int totalPage = 1;
	public static int nextId;
	public static int nextNo;
	
	@Autowired
	private MypageDAO dao;
	public void setDao(MypageDAO dao) {
		this.dao = dao;
	}
	
	@Autowired
	private CustomerDAO dao2;
	public void setDao2(CustomerDAO dao2) {
		this.dao2 = dao2;
	}
	
	@Autowired
	private PostDAO dao3;
	public void setDao3(PostDAO dao3) {
		this.dao3 = dao3;
	}
	
	@Autowired
	private ReplyDAO re_dao;
	public void setRe_dao(ReplyDAO re_dao) {
		this.re_dao = re_dao;
	}
	
	// 마이페이지 폴더 보기
	@RequestMapping("/MyPage_Folder.do")
	public void mypageFolder2(int group, int cust_no, HttpServletRequest request, Model model) {
		
		cust_no = Integer.parseInt(request.getParameter("cust_no"));
		
		request.setAttribute("c", dao2.findByCust_No(cust_no));
		request.setAttribute("flist", dao.getUserFolder(cust_no));
		request.setAttribute("cust_no", cust_no);
		
		totalFol = dao.folder_cnt(cust_no);
		model.addAttribute("totalFol", totalFol);
		
		totalFile = dao.file_cnt(cust_no);
		model.addAttribute("totalFile", totalFile);
	}
	
	// 마이페이지 폴더에서 클릭하면 파일 나열하기
	@RequestMapping("/MyPage_File.do")
	public void postList(String fol_name, int cust_no, int fol_no, HttpServletRequest request,  HttpSession session, Model model, String group, @RequestParam(value = "pageNUM", defaultValue = "1") int pageNUM) {
		cust_no = Integer.parseInt(request.getParameter("cust_no"));
		fol_no = Integer.parseInt(request.getParameter("fol_no"));
		fol_name = request.getParameter("fol_name");
		
		HashMap map=new HashMap();
		map.put("group", group);
		map.put("cust_no", cust_no);
		map.put("fol_no", fol_no);
	
		request.setAttribute("c", dao2.findByCust_No(cust_no));
		request.setAttribute("f", dao.getFol_one(map));
		request.setAttribute("cust_no", cust_no);
		request.setAttribute("fol_no", fol_no);
		request.setAttribute("fol_name", fol_name);
		
		totalFile = dao.file_cnt_Infol(map);
		model.addAttribute("totalFile", totalFile);
		model.addAttribute("list", dao3.findAll_fol(map));
		model.addAttribute("group", group);
	}
	
	// 마이페이지 파일 메모 수정
	@GetMapping("/updateMemo")
	@ResponseBody
	public int updateMemo(int p_id, String p_content) {
		HashMap map = new HashMap();
		
		map.put("p_id", p_id);
		map.put("p_content", p_content);
		int re = dao.updateMemo(map);
		
		return re;
	}
	
	// 마이페이지 파일 삭제
	@RequestMapping(value = "/deleteMyPage_file", method = RequestMethod.POST)
	@ResponseBody
	public int deleteMyPage_file (@RequestParam(value = "p_id_arr[]") List<Integer> p_id_arr) {
		int[] result = new int[p_id_arr.size()];
		
		int re = -1;
		
		for(int i=0; i<p_id_arr.size(); i++) {
			result[i] = dao.deleteMyPage_file(p_id_arr.get(i)); //{1,1,1,-1}
		}
		
		root1:
		for(int i=0; i<result.length; i++) {
			
			//만약 한개라도 지워지지 않은 것이 있는 것을 판별
			if(result[i] == -1) { //지워지지 않은게 있다는거잖아
				re = -1; // 일단 다 안지워졌다고 보는거지
				
				root2:
				for(int j=0; j<result.length; j++) {
					if(result[j] == 1) { //다 안지워진건 아니네
						re = -2; // 일부만 지워졌네 
						break root1;
					}
				}
				
			} else { //모두 지워졌을 경우
				re = 1;
				break;
			}
		}
		
		return re;
	}
	
	// 마이페이지 폴더 삭제
	@RequestMapping(value = "/deleteMyPage_folder", method = RequestMethod.POST)
	@ResponseBody
	public int deleteMyPage_folder (@RequestParam(value = "fol_no_arr[]") List<Integer> fol_no_arr) {
		int[] result = new int[fol_no_arr.size()];
		
		int re = -1;
		for(int i=0; i<fol_no_arr.size(); i++) {
			result[i] = dao.deleteMyPage_folder(fol_no_arr.get(i)); //{1,1,1,-1}
		}
		
		root1:
			for(int i=0; i<result.length; i++) {
				
				// 만약 한개라도 지워지지 않은 것이 있는 것을 판별
				if(result[i] == -1) { //지워지지 않은게 있다는거잖아
					re = -1; // 일단 다 안지워졌다고 보는거지
					
					root2:
						for(int j=0; j<result.length; j++) {
							if(result[j] == 1) { //다 안지워진건 아니네
								re = -2; // 일부만 지워졌네 
								break root1;
							}
						}
					
				} else { //모두 지워졌을 경우
					re = 1;
					break;
				}
			}
		
		return re;
	}
	
}
