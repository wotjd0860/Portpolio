package com.bit.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.bit.db.PostManager;
import com.bit.vo.PostVO;
import com.bit.vo.ReplyVO;

@Repository
public class PostDAO {
	
	//게시판 전체글 수 조회
	public int getTotalCount(HashMap map) {
		return PostManager.getTotalCount(map);
	}	
	
	//게시판 전체글 가져오기
	public List<PostVO> findAll(HashMap map){
		return PostManager.findAll(map);
	}
	
	//게시판 상세글 보기
	public PostVO findById(HashMap map) {
		return PostManager.findById(map);
	}
	
	//새글 작성
	public int insertCreate(PostVO p) {
		return PostManager.insertCreate(p);
	}
	
	//글 수정
	public int update(PostVO b) {
		return PostManager.update(b);
	}
	
	//글 삭제
	public int delete(HashMap map) {
		return PostManager.delete(map);
	}
	
//	public int updateStep(HashMap map) {
//		return PostManager.updateStep(map);
//	}
	
}
