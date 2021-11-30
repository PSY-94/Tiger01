<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

  // 한글깨짐을 방지하기 위해
  request.setCharacterEncoding("utf-8");

  String idx_ = request.getParameter("idx");
  String pwd = request.getParameter("pwd");
  
  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet  rs = null;

  String dbUrl = "jdbc:mysql://localhost:3306/jsp?useUnicode=true&characterEncoding=utf8";
  String dbId = "root";
  String dbPw = "123456";
      
  
  if(idx_==null || idx_.equals("")){
    
    response.sendRedirect("list.jsp");
    
  }else{
    
    int idx = Integer.parseInt(idx_);
    
    // 실제 테이블에서 pwd 항목의 데이터를 추출
  String sql = "select pwd from board_mvc1 where idx = ?";
    
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
       
       String dbPwd = rs.getString("pwd"); // DB에 저장된 패스워드
       
       
       if(pwd.equals(dbPwd)){
         
         String title = request.getParameter("title");
         String cont = request.getParameter("cont");
         String writer = request.getParameter("writer");
         
         sql = "update board_mvc1 set title=?, cont=?, writer=? where idx = ?";
         
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, title);
         pstmt.setString(2, cont);
         pstmt.setString(3, writer);
         pstmt.setInt(4, idx);
         
         pstmt.executeUpdate();
         
         response.sendRedirect("list.jsp");
         
       }else{
         // 비밀번호가 틀릴경우
         out.println("<script>alert('비밀번호가 틀립니다.');history.back();</script>");
       }
       
     }else{
       response.sendRedirect("list.jsp");
     }
     
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
  }

%>