<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 게시판</title>
<style>
  table{border-collapse:collapse;width:400px;}
  td{border:1px solid #dedede;}
  td:nth-child(1){width:110px;text-align:right;}
  td:nth-child(2){padding-left:10px;}
  input,textarea{width:270px;}
</style>
</head>
<body>
  <h1>내용수정</h1>
  <p><a href="list.jsp">목록보기</a></p>
 
<%

String idx_ = request.getParameter("idx");

if(idx_==null || idx_.equals("")){
  response.sendRedirect("list.jsp");
}else{
  
int idx = Integer.parseInt(idx_); // 사용자로부터 받은 idx값을 정수로 변환

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet  rs = null;

String dbUrl = "jdbc:mysql://localhost:3306/jsp?useUnicode=true&characterEncoding=utf8";
String dbId = "root";
String dbPw = "123456";
    
String sql = "select * from board_mvc1 where idx = ?";

try{
  
  // 1. mysql-connector-java-8.0.23.jar 파일을 사용할 수 있도록 로드
  Class.forName("com.mysql.cj.jdbc.Driver");
     
  // 2. DB연결
  conn = DriverManager.getConnection(dbUrl, dbId, dbPw);
  
  // 3. Statement객체 추출
  pstmt = conn.prepareStatement(sql);
  pstmt.setInt(1, idx);
  
  // 4. 쿼리실행
  rs = pstmt.executeQuery(); // 레코드 한줄

  if(rs.next()){
  
  
%> 
 
<form action="edit_ok.jsp" method="post">
<input type="hidden" name="idx" value="<%=idx %>"/>
    <fieldset>
      <legend>내용입력</legend>
      
      <table>
      
  <tr>
    <td>글제목</td>
    <td><input value= "<%=rs.getString("title") %>" type="text" id="title" name="title" autocomplete="off" required autofocus/></td>
  </tr>
  <tr>
    <td>글내용</td>
    <td>
      <textarea name="cont" cols="30" rows="10"><%=rs.getString("cont") %></textarea>
    </td>
  </tr>
  <tr>
    <td>작성자</td>
    <td><input value= "<%=rs.getString("writer")%>"type="text" name="writer" autocomplete="off"/></td>
  </tr>
  <tr>
    <td>비밀번호</td>
    <td><input type="password" name="pwd" required/></td>
  </tr>
  
</table>

<p>
  <button>확인</button>
  <button onclick="history.back()">취소</button>
</p>
    </fieldset>
  </form>

<%
  }else{
    
%>

  <p>수정요청한 게시글이 존재하지 않습니다.</p>
<%    
  }

}catch(Exception e){
  
  e.printStackTrace();
  System.out.println("데이터베이스 처리 실패~!");
  
}finally{
  
  // 다 쓰고 나면 DB관련 여러객체를 닫아줘야 한다.
 if(rs!=null) {try{rs.close();}catch(Exception e) {}}
 if(pstmt!=null) try {pstmt.close();} catch (Exception e) {}
 if(conn!=null) try {conn.close();} catch (Exception e) {}
 
}

%>
  
</body>
</html>

<% } %>