package com.test.notice;

import static org.junit.Assert.*;

import java.sql.Connection;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import com.nuri.notice.noticeDAO;
import com.nuri.util.DBConnector;

public class NoticeDAOTest {
	private noticeDAO noticeDAO;
	private Connection con;
	
	public NoticeDAOTest(){
		noticeDAO = new noticeDAO();
	}
	
	@BeforeClass
	public static void beforeClass() {
		System.out.println("Before Class");
	}
	
	//@AfterClass
	public static void afterClass() {
		System.out.println("After Class");
	}
	
	@Before
	public void before()throws Exception {
		System.out.println("Before");
		con = DBConnector.getConnection();
		con.setAutoCommit(false);
	}
	
	@After
	public void after()throws Exception {
		System.out.println("After");
		con.rollback();
//		con.commit();
		con.setAutoCommit(true);
		con.close();
	}
	
	@Test
	public void listTest()throws Exception{
		noticeDAO.noticeList(con);
	}
	
	public void selectTest()throws Exception {
		noticeDAO.noticeSelect(con, num);
		
	}

}
