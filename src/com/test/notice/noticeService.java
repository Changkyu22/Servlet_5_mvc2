package com.test.notice;

import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nuri.notice.noticeDAO;
import com.nuri.notice.noticeDTO;
import com.nuri.util.DBConnector;

public class noticeService {
	
	private noticeDAO noticeDAO;
	
	public noticeService() {
		noticeDAO = new noticeDAO();
	}
	
	public void selectList(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// DAO 보내기 전 처리작업
		// DAO 호출 후 처리작업
		Connection con = DBConnector.getConnection();
		ArrayList<noticeDTO> ar = noticeDAO.noticeList(con);
		con.close();
	}
	
	public void selectOne(HttpServletRequest request, HttpServletResponse response){
		try {
			Connection con = DBConnector.getConnection();
			int num = Integer.parseInt(request.getParameter("num"));
			noticeDTO noticeDTO = noticeDAO.noticeSelect(con, num);
			con.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}
}
