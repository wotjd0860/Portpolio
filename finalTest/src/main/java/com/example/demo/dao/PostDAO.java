package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.PostManager;
import com.example.demo.vo.PostVO;

@Repository
public class PostDAO {
	public List<PostVO> findAll(HashMap map){
		return PostManager.findAll(map);
	}
	public int getTotalCount() {
		return PostManager.getTotalCount();
	}
	public PostVO getQna(int p_id) {
		return PostManager.findById(p_id);
	}
	public int getNextNo() {
		return PostManager.getNextNo();
	}
	
	
	
	
	
	
	
	
	
	
	
	
	////////////////////////////////////////
//	public int insert(PostVO p) {
//		return PostManager.insert(p);
//	}
//	public int update(PostVO p) {
//		return PostManager.update(p);
//	}
//	public int delete(HashMap map) {
//		return PostManager.delete(map);
//	}
}
