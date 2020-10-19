package com.bit.dao;

import java.io.InputStream;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Repository;

import com.bit.db.PostManager;
import com.bit.db.ReplyManager;
import com.bit.vo.PostVO;
import com.bit.vo.ReplyVO;

@Repository
public class ReplyDAO {
	
	//댓글 불러오기
	public List<ReplyVO> findAll(HashMap map){
		return ReplyManager.findAll(map);
	}
	/*
	public List<ReplyVO> findReplyBull(int p_id){
		return ReplyManager.findReplyBull(p_id);
	}
	public List<ReplyVO> findReplyCreate(int p_id){
		return ReplyManager.findReplyCreate(p_id);
	}
	public List<ReplyVO> findReplyUsed(int p_id){
		return ReplyManager.findReplyUsed(p_id);
	}
	*/
	
	
//	//댓글 작성
//	public int insertBull(PostVO p) {
//		return PostManager.insertBull(p);
//	}
//	
//	public int updateStep(HashMap map) {
//		return PostManager.updateStep(map);
//	}
	
//	public int delete(HashMap map) {
//		return PostManager.delete(map);
//	}
//	
//	public int update(BoardVo b) {
//		return PostManager.update(b);
//	}
}
