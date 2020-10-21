package com.example.demo.db;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.example.demo.vo.BookVO;
import com.example.demo.vo.PostVO;

public class DBManager {
	
	public static SqlSessionFactory sqlSessionFactory;
	
	static {
		String resource = "com/example/demo/DB/sqlMapConfig.xml";
		InputStream inputStream;
		try {
			inputStream = Resources.getResourceAsStream(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (Exception e) {
			System.out.println("static 예외발생: "+e.getMessage());
		}
	}
	
	// 홈화면 사서추천도서 뽑아오는 메소드
	public static List<BookVO> getStaffRecommend() {
		List<BookVO> list = null;
		SqlSession session = sqlSessionFactory.openSession();
		list = session.selectList("main.getStaffRecommend");
		session.close();
		return list;
	}
	
	// 홈화면 신작도서 뽑아오는 메소드
	public static List<BookVO> getNewRecommend() {
		List<BookVO> list = null;
		SqlSession session = sqlSessionFactory.openSession();
		list = session.selectList("main.getNewRecommend");
		session.close();
		return list;
	}
	
	// 홈화면 게시글 뽑아오는 메소드
	public static List<PostVO> getHomePost(int group) {
		List<PostVO> list = null;
		SqlSession session = sqlSessionFactory.openSession();
		list = session.selectList("main.getHomePost", group);
		session.close();
		return list;
	}
}