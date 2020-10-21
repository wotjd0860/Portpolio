package com.example.demo.DAO;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.example.demo.DB.DBManager;
import com.example.demo.VO.PostVO;

@Repository
public class PostDAO {

	// 홈화면에서 커뮤니티 클릭 or 공지사항으로 이동
	public List<PostVO> getListPost(Map map) {
		return DBManager.getListPost(map);
	}
	
	// 페이징 처리 시 총 게시물 목록을 받아오는 메소드
	public int getTotalCount(Map map) {
		return DBManager.getTotalCount(map);
	}
}