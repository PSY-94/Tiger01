<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

  //한글깨짐을 방지하기 위해
  request.setCharacterEncoding("utf-8");

  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet  rs = null;

  String dbUrl = "jdbc:mysql://localhost:3306/jsp?useUnicode=true&characterEncoding=utf8";
  String dbId = "root";
  String dbPw = "123456";

  String idx_ = request.getParameter("idx");
  
  if(idx_ ==null || idx_.equals("") || idx_.equals("null")){
    out.println("<script>alert('잘못된 접근입니다.');history.back();</script>");
  }else{
    
    int idx = Integer.parseInt(idx_);
    String pwd = request.getParameter("pwd");
    
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
        
        String dbPwd = rs.getString("pwd");//DB에 저장된 패스워드
        
        // 비밀번호 내용비교 - equals()는 문자열의 내용을 비교
        if(pwd.equals(dbPwd)){
         
          // 삭제처리
          sql = "delete from board_mvc1 where idx = ?";
          pstmt = conn.prepareStatement(sql);
          pstmt.setInt(1,idx);
          
          pstmt.executeUpdate();
          
          response.sendRedirect("list.jsp");
          
        }else{
          // 비밀번호가 틀릴경우
          out.println("<script>alert('비밀번호가 틀립니다.');history.back();</script>"); 
        }
        
      }else{
        // idx에 해당하는 레코드가 없는경우
        out.println("<script>alert('게시글이 존재하지 않습니다.');history.back();</script>");
      }
    }catch(Exception e){
      
    }finally{
      
    }
    
    
  }

%>    
    