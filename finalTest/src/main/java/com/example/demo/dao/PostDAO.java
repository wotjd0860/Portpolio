package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.db.PostManager;
import com.example.demo.vo.PostVO;

@Repository
public class PostDAO {
	
	//게시판 전체 게시글수
	public int getTotalCount(HashMap map) {
		return PostManager.getTotalCount(map);
	}	
	
	//게시판 전체글 가져오기
	public List<PostVO> findAll(HashMap map){
		return PostManager.findAll(map);
	}
	
	//게시글 상세보기
	public PostVO findById(HashMap map) {
		return PostManager.findById(map);
	}
	
	//게시글 조회수
	public int updateHit(int p_id) {
		return PostManager.updateHit(p_id);
	}
	
	//새글 번호 불러오기
	public int getNextNo(int group) {
		return PostManager.getNextNo(group);
	}
	//새글 작성
	public int insert(PostVO p) {
		return PostManager.insert(p);
	}
	
	//글 수정
	public int update(PostVO b) {
		return PostManager.update(b);
	}
	
	//글 삭제
	public int delete(HashMap map) {
		return PostManager.delete(map);
	}
	
	// 홈화면에서 커뮤니티 클릭 or 공지사항으로 이동[재성]
		public List<PostVO> getpostList(Map map) {
			return DBManager.getpostList(map);
		}
	
	// 페이징 처리 시 총 게시물 목록을 받아오는 메소드[재성]
	public int getTotalCount(Map map) {
		return DBManager.getTotalCount(map);
	}
	
}
