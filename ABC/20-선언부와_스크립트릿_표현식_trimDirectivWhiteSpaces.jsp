<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- HTML 소스코드에서 공백라인 제거 -->
<%@ page trimDirectiveWhitespaces="true"%>    
    
<%
//응답결과를 캐시할 것인가에 대한 설정
response.setHeader("Pragma","No-cache");
response.setHeader("Cache-Control","no-cache");
response.addHeader("Cache-Control","no-store"); 
response.setDateHeader("Expires",1L); 
%>

<%!
 String name = "길동";

 String fullName(){
   return "홍"+name;
 }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 웹프로그래머를 꿈꾸며</title>
</head>
<body>
  <h1>JSP 기초문법</h1>
  
  <h2>선언부의 출력</h2>
  
  <ul>
    <li>이름 : <%=name %></li>
    <li>성명 : <%=fullName() %></li>
  </ul>
  
  <hr />
  
<%
 String mission = "기초에 충실하자~!";

 // 스크립트릿 영역에서 출력을 하려면 out 내장객체를 이용해야 함
 out.println("<h2>내장객체 out을 이용한 출력 : mission = "+mission+"</h2>");
%>

 <hr />
 
 <h2>나의 사명</h2>
 <!-- 표현식은 변수를 출력하거나 메소드의 결과값을 브라우저에 출력함 -->
 <p><%=mission %></p>
</body>
</html>