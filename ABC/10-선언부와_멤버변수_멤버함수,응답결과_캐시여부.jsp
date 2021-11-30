<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // 응답결과를 캐시할 것인가에 대한 설정
    response.setHeader("Pragma","No-cache");
    response.setHeader("Cache-Control","no-cache");
    response.addHeader("Cache-Control","no-store"); 
    response.setDateHeader("Expires",1L); 
%>

<%! 
  // 선언문영역 - 함수는 선언은 반드시 여기서
  
  // 여기서 선언한 멤버변수와 멤버함수는 페이지 어디에서든 다 사용 가능함.
  
  // 여기서 선언된 변수와 함수는 JSP 페이지가 Servlet 코드로 변환되면
  // Servlet 클래스의 멤버변수와 멤버함수로 선언됨
  int countMenu = 3;
  String contMenu = "JSP, Servlet, 프로그래밍구현";
  
  int multiply(int a, int b){
    return a*b;
  }
  
%>    

<%
  // 스크립트릿 영역
  
  /*
   1. 여기에서 선언된 변수는 자동으로 만들어지는 _jspService() 함수의 지역변수로
      선언이 된다.
      
   2. 여기에서는 함수를 선언할 수 없음
      만약 선언을 하게 되면 함수안에서 함수를 선언한 것이기 때문에 에러 발생
      
   3. 지역변수, if, switch, for, while, do~while 등의 코드는 사용 가능함
  */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멤버변수와 멤버함수</title>
</head>
<body>
  <h1>선언부에서 선언한 변수와 함수는 Servlet 클래스의 멤버변수와 멤버함수로 변환된다.</h1>
  
  <h2>포트폴리오 메뉴개수 : <%=countMenu %></h2>
  <p>메뉴내용 : <%=contMenu %></p>
  
  <!-- hr은 위, 아래 내용을 의미상 구분짓고 싶을때 사용 -->
  <hr />
  
  <h2>멤버함수를 이용한 연산</h2>
  <p>7*5 = <%=multiply(7,5) %></p>
  
  
</body>
</html>
