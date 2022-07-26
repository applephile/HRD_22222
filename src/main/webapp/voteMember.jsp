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
			String sql = "select m_no, m_name from tbl_member_202005";
			
			rs = stmt.executeQuery(sql);	
		
	%>
	
	<section>
		<h2>투표하기</h2>
		
		<form name="frm" method="post" action="voteMemberProcess.jsp">
			<table>
				<tr>
					<th>주민번호</th>
					<td><input type="text" name="v_jumin"/> 예 : 8906153154726</td>
				</tr>
				<tr>
					<th>성명</th>
					<td><input type="text" name="v_name"/></td>
				</tr>
				<tr>
					<th>투표번호</th>
					<td>
						<select name="m_no">
							<option></option>
							<!-- <option>[1]김후보</option>
							<option>[2]이후보</option>
							<option>[3]박후보</option>
							<option>[4]조후보</option>
							<option>[5]최후보</option> -->
							<%
									while(rs.next()) {
							%>
										<option value="<%=rs.getString("m_no")%>">[<%=rs.getString("m_no")%>]<%=rs.getString("m_name")%></option>
							<%		
									}
							
								} catch(Exception e) {
									e.printStackTrace();
								}
							%>
						</select>
					</td>
				</tr>
				<tr>
					<th>투표시간</th>
					<td><input type="text" name="v_time"/></td>
				</tr>
				<tr>
					<th>투표장소</th>
					<td><input type="text" name="v_area"/></td>
				</tr>
				<tr>
					<th>유권자확인</th>
					<td>
						<input type="radio" name="v_confirm"  value="Y"/> 확인
						<input type="radio" name="v_confirm" value="N"/> 미확인
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button class="btn" type="submit" onclick="return fn_submit()">투표하기</button>
						<button class="btn" type="button" onclick="return fn_reset()">다시하기</button>
					</td>
				</tr>
			</table>
		</form>
	</section>
	<script src="./check.js"></script>
	<jsp:include page="footer.jsp"/>
</body>
</html>