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
  <h1>상세내용</h1>
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
 
<table>

  <tr>
    <td>글제목</td>
    <td><%=rs.getString("title") %></td>
  </tr>
  <tr>
    <td>글내용</td>
    <td><%=rs.getString("cont") %></td>
  </tr>
  <tr>
    <td>작성자</td>
    <td><%=rs.getString("writer") %></td>
  </tr>
  <tr>
    <td>작성일</td>
    <td><%=rs.getDate("regdate") %></td>
  </tr>

</table>

<p>
  <a href="edit.jsp?idx=<%=idx%>">수정</a> &nbsp;
  <a href="pwd.jsp?idx=<%=idx%>">삭제</a>
</p>

<%
  }else{
    
%>

  <p>요청한 게시글의 내용이 없습니다.</p>
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