<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
 //클라이어트가 보낸 데이터를 utf-8 방식으로 인코딩 하겠다.
 //한글깨짐 방지코드
 request.setCharacterEncoding("utf-8");

 String title = request.getParameter("title");
 String cont = request.getParameter("cont");
 String writer = request.getParameter("writer");
 String pwd = request.getParameter("pwd");
 
 Connection conn = null;
 PreparedStatement pstmt = null;
 ResultSet  rs = null;
 
 String dbUrl = "jdbc:mysql://localhost:3306/jsp?useUnicode=true&characterEncoding=utf8";
 String dbId = "root";
 String dbPw = "123456";
     
 String sql = "insert into board_mvc1 (title, cont, writer, pwd) values (?,?,?,?)";
  
 try{

   // 1. mysql-connector-java-8.0.23.jar 파일을 사용할 수 있도록 로드
   Class.forName("com.mysql.cj.jdbc.Driver");
      
   // 2. DB연결
   conn = DriverManager.getConnection(dbUrl, dbId, dbPw);
   
   // 3. Statement객체 추출
   pstmt = conn.prepareStatement(sql);
   pstmt.setString(1, title);
   pstmt.setString(2, cont);
   pstmt.setString(3, writer);
   pstmt.setString(4, pwd);
   
   pstmt.executeUpdate();
   
   response.sendRedirect("list.jsp");
 
 }catch(Exception e){
   
   e.printStackTrace();
   System.out.println("데이터베이스 처리 실패~!");
   response.sendRedirect("write.jsp");
   
 }finally{
   
   // 다 쓰고 나면 DB관련 여러객체를 닫아줘야 한다.
  if(rs!=null) {try{rs.close();}catch(Exception e) {}}
  if(pstmt!=null) try {pstmt.close();} catch (Exception e) {}
  if(conn!=null) try {conn.close();} catch (Exception e) {}
  
 }

 
%>