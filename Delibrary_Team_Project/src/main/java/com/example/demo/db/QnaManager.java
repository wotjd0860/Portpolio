package com.example.demo.db;

import java.io.InputStream;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.example.demo.vo.PostVO;


public class QnaManager {
	public static SqlSessionFactory sqlSessionFactory;
	
	static {
		try {
			String resource = "com/example/demo/db/sqlMapConfig.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);
			sqlSessionFactory =
			  new SqlSessionFactoryBuilder().build(inputStream);
		} catch (Exception e) {
			System.out.println("占쎌굙占쎌뇚獄쏆뮇源�:"+e.getMessage());
		}
	}
	
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public static int getNextNo() {
	      int re =  -1;
	      SqlSession session=sqlSessionFactory.openSession();
	      re=session.selectOne("qna.nextNo");
	      session.close();
	      return re;
	   }

	
	public static List<PostVO> findAll(HashMap map){
		List<PostVO> list = null;
		SqlSession session = sqlSessionFactory.openSession();
		list = session.selectList("qna.selectAll", map);
		session.close();
		return list;
	}
	
	
	public static int getTotalCount(HashMap map) {
		int re =  -1;
		SqlSession session = sqlSessionFactory.openSession();
		re = session.selectOne("qna.selectCount",map);
		session.close();
		return re;
	}


	public static PostVO findById(int p_id) {
		// TODO Auto-generated method stub
		PostVO p = null;
		SqlSession session = sqlSessionFactory.openSession();
		p = session.selectOne("qna.selectById",p_id);
		session.close();
		return p;
	}


	public static int updateHit(int p_id) {
		int re =  -1;
		SqlSession session=sqlSessionFactory.openSession(true);
		re = session.update("post.updateHit", p_id);
		session.close();
		return re;
	}
	
}

