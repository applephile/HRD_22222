<%@page import="java.sql.*"%>
<%@page import="DBPKG.JDBConnection"%>
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
			
			String sql = "SELECT v_name, "
					 + " '19'||substr(v_jumin,1,2)|| "
					 + " '년'||substr(v_jumin,3,2)|| "
					 + " '월'||substr(v_jumin,5,2)|| "
					 + " '일생' v_jumin, "		 
					 + " '만 '||(to_number(to_char(sysdate,'yyyy')) " 
					 + " - to_number('19'||substr(v_jumin,1,2)))||'세' v_age, "
					 + " DECODE(substr(v_jumin,7,1),'1','남','여') v_gender, "	   
					 + " m_no, "
					 + " substr(v_time,1,2)||':'||substr(v_time,3,2) v_time, "
					 + " DECODE(v_confirm,'Y','확인','미확인') v_confirm "
					 + " FROM tbl_vote_202005 "
					 + " WHERE v_area='제1투표장' ";
			
			rs = stmt.executeQuery(sql);
			
		
	%>
	<section>
		<h2>투표검수조회</h2>
		
		<form>
			<table style="width: 700px">
				<tr>
					<td>성명</td>
					<td>생년월일</td>
					<td>나이</td>
					<td>성별</td>
					<td>후보번호</td>
					<td>투표시간</td>
					<td>유권자확인</td>
				</tr>
				<%
						while(rs.next()) {
				%>
				<tr>
					<td><%=rs.getString("v_name") %></td>
					<td><%=rs.getString("v_jumin") %></td>
					<td><%=rs.getString("v_age") %></td>
					<td><%=rs.getString("v_gender") %></td>
					<td><%=rs.getString("m_no") %></td>
					<td><%=rs.getString("v_time") %></td>
					<td><%=rs.getString("v_confirm") %></td>
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