package com.example.demo.db;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.example.demo.vo.CustomerVO;

public class CustomerManager {
	
	public static SqlSessionFactory sqlSessionFactory;
	
	static {
		try {
		String resource = "com/example/demo/db/sqlMapConfig.xml";
		InputStream inputStream = Resources.getResourceAsStream(resource);
		sqlSessionFactory =
		  new SqlSessionFactoryBuilder().build(inputStream);
		}catch (Exception e) {
			System.out.println("예외발생 static:"+e.getMessage());
		}
	}
	
	public static List<CustomerVO> findAll(){
		List<CustomerVO> list = null;
		SqlSession session = sqlSessionFactory.openSession();
		list = session.selectList("customer.selectAll");
		session.close();
		return list;
	}
	
	public static CustomerVO findByCust_No(int cust_no) {
		CustomerVO c = null;
		SqlSession session = 
		sqlSessionFactory.openSession();
		c = session.selectOne("customer.selectByCust_No",cust_no);
		session.close();
		return c;
	}
	
	public static int update(CustomerVO c) {
		int re = -1;
		SqlSession session
		= sqlSessionFactory.openSession(true);
		re= session.update("customer.updateCustomer", c);
		session.close();
		return re;
	}
}
