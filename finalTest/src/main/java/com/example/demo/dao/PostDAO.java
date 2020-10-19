package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.PostManager;
import com.example.demo.vo.PostVO;
import com.example.demo.vo.ReplyVO;

@Repository
public class PostDAO {
	
	//게시?�� ?��체�? ?�� 조회
	public int getTotalCount(HashMap map) {
		return PostManager.getTotalCount(map);
	}	
	
	//게시?�� ?��체�? �??��?���?
	public List<PostVO> findAll(HashMap map){
		return PostManager.findAll(map);
	}
	
	//게시?�� ?��?���? 보기
	public PostVO findById(HashMap map) {
		return PostManager.findById(map);
	}
	
	//?���? ?��?��
	public int insertCreate(PostVO p) {
		return PostManager.insertCreate(p);
	}
	
	//�? ?��?��
	public int update(PostVO b) {
		return PostManager.update(b);
	}
	
	//�? ?��?��
	public int delete(HashMap map) {
		return PostManager.delete(map);
	}
	
//	public int updateStep(HashMap map) {
//		return PostManager.updateStep(map);
//	}
	
}
