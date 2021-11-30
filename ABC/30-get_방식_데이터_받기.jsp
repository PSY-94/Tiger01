<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    
<%
 /*
   1.만약 보내는 쪽에서 ~.jsp?num= 이렇게 보내면 
     num에는 "" 빈문자열이 할당됨
   
   2.만약 보내는 쪽에서 ~.jsp 이렇게 보내면
     num에는 null("지금 현재 값을 알수없다.") 값이 할당됨
 */
 
 String num_ = request.getParameter("num");
 int num = 7;
 
 // 유효성 검사
 if(num_ != null && !num_.equals("")){
    num = Integer.parseInt(num_);
   
 }


 String result = ""; // 빈문자열
 int i=0;
 
 while(i<num){
   result += "내일 당신에게 "+(i+1)+"번의 행운이 찾아올 거에요 <br />";
   i++;
 }
 /*
 result += "내일 당신에게 "+1+"번의 행운이 찾아올 거에요 <br />";
 result += "내일 당신에게 "+2+"번의 행운이 찾아올 거에요 <br />";
 result += "내일 당신에게 "+3+"번의 행운이 찾아올 거에요 <br />";
 result += "내일 당신에게 "+4+"번의 행운이 찾아올 거에요 <br />";
 result += "내일 당신에게 "+5+"번의 행운이 찾아올 거에요 <br />";
 result += "내일 당신에게 "+6+"번의 행운이 찾아올 거에요 <br />";
 result += "내일 당신에게 "+7+"번의 행운이 찾아올 거에요 <br />";
 result += "내일 당신에게 "+8+"번의 행운이 찾아올 거에요 <br />";
 result += "내일 당신에게 "+9+"번의 행운이 찾아올 거에요 <br />";
 result += "내일 당신에게 "+10+"번의 행운이 찾아올 거에요 <br />";
 */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>get_방식_데이터_받기</title>
</head>
<body>
  <h1>get 방식으로 데이터 처리</h1>
  <p><%=result %></p>
  
  <hr />
<%
  // 브라우저가 요청한 URL경로를 구함
  String uri = request.getRequestURI();
  uri = URLDecoder.decode(uri,"utf-8");
  
  // 도메인과 파일명을 제외한 중간컨텍스트 경로를 구함
  String contextPath = request.getContextPath();
  
  // 파일명 가져오기(슬래시 포함) - 방법1
  String filename = request.getServletPath();
  
  // 서버이름
  String serverName = request.getServerName();
  
  // 서버포트
  int serverPort = request.getServerPort();
%>
  <h2>클라이언트 정보 및 서버정보 추출</h2>
  <ol>
   <li>request.getRequestURI() = <%=uri %> </li>
   <li>request.getContxtPath() = <%=contextPath %></li>
   <li>request.getServletPath() = <%=filename %></li>
   <li>request.getSeverName() = <%=serverName %></li>
   <li>request.getServerPort() = <%=serverPort %></li>
  </ol>
</body>
</html>