<%@page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

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
  <%	
		JDBConnect jdbc = new JDBConnect();
		
		System.out.print("action.jsp");
		String regist_month = request.getParameter("regist_month");
		String c_no = request.getParameter("c_no");
		String class_area = request.getParameter("class_area");
		String teacher_code = request.getParameter("teacher_code");
		String tuition = request.getParameter("tuition");
		
		int result = 0;
		
		try{
			String sql = "INSERT INTO TBL_CLASS_202201 VALUES(?,?,?,?,?)";
			PreparedStatement pstmt = jdbc.con.prepareStatement(sql);
			
			pstmt.setString(1,regist_month);
			pstmt.setString(2,c_no);
			pstmt.setString(3,class_area);
			pstmt.setInt(4,Integer.parseInt(tuition));
			pstmt.setString(5,teacher_code);
			
			result = pstmt.executeUpdate();
			pstmt.close();
			
			if(result == 1){
				out.print("<script>alert('수강신청이 정상적으로 완료되었습니다!'); location.href='index.jsp';</script>");
			} else {
				out.print("<script>alert('수강신청 실패! \n 메인화면으로 이동합니다.'); location.href='index.jsp'; </script>");
			}
			
		} catch (Exception e){
			e.printStackTrace();
		}

%>
  </section>
  <jsp:include page="footer.jsp"></jsp:include>

</body>
</html>