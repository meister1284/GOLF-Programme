<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="common.JDBConnect" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>

    
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>골프연습장 회원관리 프로그램</title>
<script src="check1.js"></script>
</head>
<body>
   <jsp:include page ="header.jsp"></jsp:include>
   <style> 
   td {
    padding-left: 10px;
    text-align:left;
    }
   </style>

<section class="main-section">
 <h2>수강신청</h2> <br>
 
 <form name="frm" method="post" action="action.jsp"> 
        
<table>
<%
System.out.println("join.jsp");
%>

    <tr>
			<th>수강월</th>
			<td>
			<input type="text" name="regist_month" maxlength="6" autofocus>
			2022년03월 예)202203
			</td>
		</tr>
		<tr>
			<th>회원명</th>
			<td>
			<select name="c_name" onchange="fn_change1();">
			<option value="">회원명</option>
			<option value="10001">홍길동</option>			
			<option value="10002">장발장</option>			
			<option value="10003">임꺽정</option>			
			<option value="20001">성춘향</option>			
			<option value="20002">이몽룡</option>			
			</select>		
			
			</td>
		</tr>
		<tr>
			<th>회원번호</th>
			<td><input type="text" name="c_no" readonly>예)10001</td> 
		</tr>
		<tr>
			<th>강의장소</th>
			<td>
			 <input type ="radio" name ="class_area" value ="서울본원"> 서울본원
             <input type ="radio" name ="class_area" value ="성남분원"> 성남분원
             <input type ="radio" name ="class_area" value ="대전분원"> 대전분원
             <input type ="radio" name ="class_area" value ="부산분원"> 부산분원
			 <input type ="radio" name ="class_area" value ="대구분원"> 대구분원
			</td>
		</tr>
		<tr>
			<th>강의명</th>
			<td>
			<select name="teacher_code" onchange="fn_change2();">
			<option value="">강의신청</option>
			<option value="100">초급반</option>
			<option value="200">중급반</option>
			<option value="300">고급반</option>
			<option value="400">심화반</option>
			
			</select>
			</td>
		</tr>
		<tr>
			<th>수강료</th>
			<td><input type="text" name="tuition" readonly>원</td>
		</tr>
		<tr>
			<td style="text-align:center;" colspan="2">
			<button class="btn" type="submit" onclick="fn_submit(); return false;">수강신청</button>
			<button class="btn" type="button" onclick="fn_reset();" >다시쓰기</button>
			</td>			
		</tr>	
     

       
	
 
 	
</table>
</form>


  </section>
  <jsp:include page="footer.jsp"></jsp:include>

</body>
</html>