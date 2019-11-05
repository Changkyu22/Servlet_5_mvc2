package com.test.notice;

import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nuri.action.ActionForward;
import com.nuri.notice.noticeDAO;
import com.nuri.notice.noticeDTO;
import com.nuri.util.DBConnector;
import com.sun.org.apache.bcel.internal.generic.RETURN;

public class noticeService {
	
	private noticeDAO noticeDAO;
	
	public noticeService() {
		noticeDAO = new noticeDAO();
	}
	
	public ActionForward selectList(HttpServletRequest request, HttpServletResponse response){
		// DAO 보내기 전 처리작업
		// DAO 호출 후 처리작업
		ActionForward actionForward = new ActionForward();
		try {
			Connection con = DBConnector.getConnection();
			ArrayList<noticeDTO> ar = noticeDAO.noticeList(con);
			con.close();
			request.setAttribute("list", ar);
			actionForward.setFlag(true);
			actionForward.setPath("./noticeList.jsp");
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return actionForward;
	}
	
	public ActionForward selectOne(HttpServletRequest request, HttpServletResponse response){
		ActionForward actionForward = new ActionForward();
		try {
			Connection con = DBConnector.getConnection();
			int num = Integer.parseInt(request.getParameter("num"));
			noticeDTO noticeDTO = noticeDAO.noticeSelect(con, num);
			if(noticeDTO != null) {
				request.setAttribute("dto", noticeDTO);
				actionForward.setFlag(true);
				actionForward.setPath("./noticeSelect.jsp");
			}else {
				actionForward.setFlag(false);
				actionForward.setPath("./noticeList.notice");
			}
			con.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return actionForward;
	}
	
	public ActionForward noticeWrite(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		
			noticeDTO noticeDTO = new noticeDTO();
			String method = request.getMethod();
			
			if(method.equals("POST")) {
				try {
					Connection con = DBConnector.getConnection();
					noticeDTO.setTitle(request.getParameter("title"));
					noticeDTO.setWriter(request.getParameter("writer"));
					noticeDTO.setContents(request.getParameter("contents"));
					int result = noticeDAO.noticeInsert(con, noticeDTO);
					con.close();
					if(result>0) {
						String msg = "Success";
						request.setAttribute("result", result);
						request.setAttribute("msg", msg);
						request.setAttribute("path", "./noticeList.notice");
						RequestDispatcher view = request.getRequestDispatcher("../common/common_result.jsp");
						view.forward(request, response);
					}else {
						request.setAttribute("msg", "Fail");
						request.setAttribute("path", "./noticeList.notice");
						RequestDispatcher view2 = request.getRequestDispatcher("../common/common_result.jsp");
						view2.forward(request, response);
					}
					
				} catch (Exception e) {
					// TODO: handle exception
				}
			}else {
				
				actionForward.setFlag(true);
				actionForward.setPath("./noticeWrite.jsp");
			}
		return actionForward;
	}
	
	public ActionForward noticeUpdate(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		
		try {
			
			String method = request.getMethod();
			if(method.equals("POST")) {
				Connection con = DBConnector.getConnection();
				noticeDTO noticeDTO = new noticeDTO();
				noticeDTO.setNum(Integer.parseInt(request.getParameter("num")));
				noticeDTO.setTitle(request.getParameter("title"));
				noticeDTO.setContents(request.getParameter("contents"));
				int result = noticeDAO.update(con, noticeDTO);
				actionForward.setFlag(true);
				actionForward.setPath("../common/common_result.jsp");
				request.setAttribute("path", "./noticeList.notice");
				con.close();
				
				String msg = "Update Fail";
				if(result>0) {
					msg = "Update Success";
				}
				request.setAttribute("msg", msg);
				
			}else {
				Connection con = DBConnector.getConnection();
				noticeDTO noticeDTO = noticeDAO.noticeSelect(con, Integer.parseInt(request.getParameter("num")));
				request.setAttribute("dto", noticeDTO);
				actionForward.setFlag(true);
				actionForward.setPath("./noticeUpdate.jsp");
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return actionForward;
	}
}
