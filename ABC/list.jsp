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

<!-- CSS는 HTML이 화면에 어떻게 보일까를 디자인하는 언어이다. -->
<style>
  table{border-collapse:collapse;width:950px;}
  td{border:1px solid #dedede;text-align:center;}
  td:nth-child(1){width:70px;}
  td:nth-child(2){width:450px;}
  td:nth-child(3){width:150px;}
  td:nth-child(4){width:180px;}
  td:nth-child(5){width:100px;}
</style>
</head>
<body>

	<h1>게시판 글목록</h1>
	<p>
		<a href="write.jsp">글쓰기</a>
	</p>
	<table>

		<tr>
			<td>번호</td>
			<td>글제목</td>
			<td>작성자</td>
			<td>등록일</td>
			<td>조회수</td>
		</tr>
<%

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet  rs = null;

String dbUrl = "jdbc:mysql://localhost:3306/jsp?useUnicode=true&characterEncoding=utf8";
String dbId = "root";
String dbPw = "123456";
    
String sql = "select * from board_mvc1 order by idx desc";

 try{

  // 1. mysql-connector-java-8.0.23.jar 파일을 사용할 수 있도록 로드
  Class.forName("com.mysql.cj.jdbc.Driver");
     
  // 2. DB연결
  conn = DriverManager.getConnection(dbUrl, dbId, dbPw);
  
  // 3. Statement객체 추출
  pstmt = conn.prepareStatement(sql);
  
  // 4. 쿼리실행
  rs = pstmt.executeQuery();
  
  // 5. 결과 출력
  while(rs.next()){

%>	
		<tr>
			<td><%=rs.getInt("idx") %></td>
			<td><a href="content.jsp?idx=<%=rs.getInt("idx") %>"><%=rs.getString("title") %></a></td>
			<td><%=rs.getString("writer") %></td>
			<td><%=rs.getDate("regdate") %></td>
			<td><%=rs.getInt("hit") %></td>
		</tr>

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

	</table>

</body>
</html>