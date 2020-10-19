package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.PostManager;
import com.example.demo.vo.PostVO;
import com.example.demo.vo.ReplyVO;

@Repository
public class PostDAO {
	
	//ê²Œì‹œ?Œ ? „ì²´ê? ?ˆ˜ ì¡°íšŒ
	public int getTotalCount(HashMap map) {
		return PostManager.getTotalCount(map);
	}	
	
	//ê²Œì‹œ?Œ ? „ì²´ê? ê°?? ¸?˜¤ê¸?
	public List<PostVO> findAll(HashMap map){
		return PostManager.findAll(map);
	}
	
	//ê²Œì‹œ?Œ ?ƒ?„¸ê¸? ë³´ê¸°
	public PostVO findById(HashMap map) {
		return PostManager.findById(map);
	}
	
	//?ƒˆê¸? ?‘?„±
	public int insertCreate(PostVO p) {
		return PostManager.insertCreate(p);
	}
	
	//ê¸? ?ˆ˜? •
	public int update(PostVO b) {
		return PostManager.update(b);
	}
	
	//ê¸? ?‚­? œ
	public int delete(HashMap map) {
		return PostManager.delete(map);
	}
	
//	public int updateStep(HashMap map) {
//		return PostManager.updateStep(map);
//	}
	
}
