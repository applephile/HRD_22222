<%@page import="DBPKG.JDBConnection"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

	request.setCharacterEncoding("utf-8");

	Connection conn = null;
	Statement stmt = null;
	PreparedStatement psmt = null;
	int result = 0;
	
	String v_jumin = request.getParameter("v_jumin");
	String v_name = request.getParameter("v_name");
	String m_no = request.getParameter("m_no");
	String v_time = request.getParameter("v_time");
	String v_area = request.getParameter("v_area");
	String v_confirm = request.getParameter("v_confirm");
	
	try {
		
		conn = JDBConnection.getConnection();
		
		String sql = "INSERT INTO tbl_vote_202005 values(?, ?, ?, ?, ?, ?)";
				
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, v_jumin);
		psmt.setString(2, v_name);
		psmt.setString(3, m_no);
		psmt.setString(4, v_time);
		psmt.setString(5, v_area);
		psmt.setString(6, v_confirm);
		
		result = psmt.executeUpdate();
		
		response.sendRedirect("voteResult.jsp");
	} catch(Exception e) {
		e.printStackTrace();
	}
%>    