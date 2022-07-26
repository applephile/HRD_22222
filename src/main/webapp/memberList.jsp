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
		
		try{
			conn = JDBConnection.getConnection();
			stmt = conn.createStatement();
			
			String sql = " SELECT m_no, m_name, p_name, "
						+ " CASE p_school "
						+ " WHEN '1' THEN '고졸' "
						+ " WHEN '2' THEN '학사' "
						+ "	WHEN '3' THEN '석사' "
						+ "	WHEN '4' THEN '박사' "
						+ "	END p_school, "
						+ " CONCAT(CONCAT(SUBSTR(m_jumin, 1, 7) , '-'), SUBSTR(m_jumin, 7, 13)) m_jumin, "
						+ " m_city, "
						+ " p_tel1 || '-' || p_tel2 || '-' || p_tel3 p_tel "
						+ " FROM TBL_MEMBER_202005 m, TBL_PARTY_202005 p "
						+ " WHERE m.p_code = p.p_code ";
			
			rs = stmt.executeQuery(sql);
			
		
	%>
	<section>
		<h2>후보조회</h2>
		
		<form>
			<table style="width: 700px">
				<tr>
					<td>후보번호</td>
					<td>성명</td>
					<td>소속정당</td>
					<td>학력</td>
					<td>주민번호</td>
					<td>지역구</td>
					<td>대표전화</td>
				</tr>
				<%
					while(rs.next()) {
						
				%>
					<tr>
						<td><%=rs.getString("m_no") %></td>
						<td><%=rs.getString("m_name") %></td>
						<td><%=rs.getString("p_name") %></td>
						<td><%=rs.getString("p_school") %></td>
						<td><%=rs.getString("m_jumin") %></td>
						<td><%=rs.getString("m_city") %></td>
						<td><%=rs.getString("p_tel") %></td>
					</tr>
				<%
					}
				
				} catch(Exception e) {
					e.printStackTrace();
				}
				%>
			</table>
		</form>
	</section>
	<jsp:include page="footer.jsp"/>
</body>
</html>