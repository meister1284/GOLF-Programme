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
  
	<h2>회원정보조회</h2>
	<table>
		<thead>
			<tr>
				<th>수강일</th>
				<th>회원번호</th>
				<th>회원명</th>
				<th>강의명</th>
				<th>강의장소</th>
				<th>수강료</th>
				<th>등급</th>
			</tr>
		</thead>
		<tbody>
		<%
		ResultSet rs = null;
		
		JDBConnect jdbc = new JDBConnect();
		try{
			String sql = "SELECT C.REGIST_MONTH, M.C_NO, M.C_NAME, T.CLASS_NAME, C.CLASS_AREA, C.TUITION, M.GRADE "
					+		"FROM tbl_teacher_202201 T "
					+		"JOIN tbl_class_202201 C ON t.teacher_code = c.teacher_code "
					+		"JOIN tbl_member_202201 M ON c.c_no = m.c_no";
			jdbc.stmt = jdbc.con.createStatement();
			rs = jdbc.stmt.executeQuery(sql);
			
			while(rs.next()){
				%>
				<tr>
					<td><%= rs.getString(1) %></td>
					<td><%= rs.getString(2) %></td>
					<td><%= rs.getString(3) %></td>
					<td><%= rs.getString(4) %></td>
					<td><%= rs.getString(5) %></td>
					<td>￦<%= rs.getString(6) %></td>
					<td><%= rs.getString(7) %></td>
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