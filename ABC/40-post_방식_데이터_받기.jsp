<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

 // 클라이언트가 보낸 데이터를 utf-8 방식으로 인코딩 하겠다.
 // 한글깨짐 방지코드
 request.setCharacterEncoding("utf-8");

 String username = request.getParameter("username");
 
int birth = 1993;
 
 // 오류방지코드
 String birth_ = request.getParameter("birth");
 if(birth_!=null && !birth_.equals("")){
   birth = Integer.parseInt(birth_);
 }
 
 String gender = request.getParameter("gender");
 if(gender.equals("0")){
   gender = "여성";
 }else if(gender.equals("1")){
   gender = "남성";
 }
 
 String intro = request.getParameter("intro");
 
 // 취미데이터 (배열의 출력) 
 String[] hobby = request.getParameterValues("hobby"); // {"게임", "노래", "쇼핑", "그림"}
 
 String hobbyList = "";
 // 방법-1
 //String hobbyList = hobby[0]+", "+hobby[1]+", "+hobby[2]+", "+hobby[3];
 
 // 방법-2
 String hobbylist = Arrays.toString(hobby); // 간단하게 배열원소를 문자열로 출력
 
 hobbyList = "";
 // 방법-3
 if(hobby!=null){
   for(int i=0;i<hobby.length;i++){
     if(i<3){
       hobbyList += hobby[i]+", ";
     }else{
       hobbyList += hobby[i];
     }
   }
 }else{
   hobbyList = "취미없음";
 } // end of if
 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>40-post_방식_데이터_받기</title>
</head>
<body>
  <h1>POST 방식으로 전달받은 데이터</h1>
  
  <ol>
   <li>이름 : <%=username %></li>
   <li>출생년도 : <%=birth %>년</li>
   <li>취미 : <%=hobbyList %></li>
   <li>성별 : <%=gender %></li>
   <li>소개글 : <%=intro %></li>
  </ol>
</body>
</html>