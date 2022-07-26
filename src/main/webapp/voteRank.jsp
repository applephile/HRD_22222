<%@page import="DBPKG.JDBConnection"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header.jsp"/>
	
	<%
		request.setCharacterEncoding("utf-8");
	
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = JDBConnection.getConnection();
			stmt = conn.createStatement();
			
			String sql = " SELECT m.m_no, m.m_name, COUNT(*) rank "
					+ " FROM tbl_member_202005 m, tbl_vote_202005 v " 
					+ " WHERE  m.m_no = v.m_no AND v.v_confirm = 'Y' "
					+ " GROUP BY m.m_no, m.m_name "
					+ " ORDER BY rank DESC ";
			
			rs = stmt.executeQuery(sql);
		
	%>	
	<section>
		<h2>후보자등수</h2>
		<form>
			<table>
				<tr>
					<td>후보번호</td>
					<td>성명</td>
					<td>총투표건수</td>
				</tr>
				<tr>
					<%
						while(rs.next()) {
					%>
						<tr>
							<td><%=rs.getString("m_no")%></td>
							<td><%=rs.getString("m_name")%></td>
							<td><%=rs.getString("rank")%></td>
						</tr>
					<%
						}
						} catch(Exception e) {
							e.printStackTrace();
						}			
					%>
				</tr>
			</table>
		</form>
	</section>
	<jsp:include page="footer.jsp"/>
</body>
</html>