<%@page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="common.JDBConnect" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>골프연습장 회원관리 프로그램</title>
</head>
<body>
   <jsp:include page ="header.jsp"></jsp:include>
   <section class="main-section">
  <h2>강사매출현황</h2>
	<table>
		<thead>
			<tr>
				<th>강사코드</th>
				<th>강의명</th>
				<th>강사명</th>
				<th>총매출</th>
			</tr>
		</thead>
		<tbody>
		<%
		ResultSet rs = null;
		
		JDBConnect jdbc = new JDBConnect();
		try{
			String sql = "SELECT C.TEACHER_CODE, T.CLASS_NAME, T.TEACHER_NAME, SUM(C.TUITION) AS TOTAL "
					+	 "FROM TBL_CLASS_202201 C "
					+	 "JOIN TBL_TEACHER_202201 T ON C.TEACHER_CODE = T.TEACHER_CODE "
					+	 "GROUP BY C.TEACHER_CODE, T.CLASS_NAME, T.TEACHER_NAME "
					+	 "ORDER BY C.TEACHER_CODE ";
			jdbc.stmt = jdbc.con.createStatement();
			rs = jdbc.stmt.executeQuery(sql);
			
			while(rs.next()){
				%>
				<tr>
					<td><%= rs.getString(1) %></td>
					<td><%= rs.getString(2) %></td>
					<td><%= rs.getString(3) %></td>
					<td>￦<%= rs.getInt(4) %></td>
				</tr>
				<%
			}
		} catch (SQLException e){
			out.print("데이터 베이스 접속 에러");
		} finally {
			if (rs!=null) rs.close();
			if(jdbc.con !=null) jdbc.con.close();
		}
		%>
		</tbody>
	</table>
    
  </section>
  <jsp:include page="footer.jsp"></jsp:include>

</body>
</html>