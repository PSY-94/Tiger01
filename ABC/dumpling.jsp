<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

String key = "";
String num_ = request.getParameter("num");
int num = Integer.parseInt(num_);

if(num>=180 && num<=200){
  key = num+"cm는 전봇대도 아니고 ㅎㅎ";
}else if(num>=165 && num<180){
  key = num+"cm씩이나? 너무 후하다";
}else if(num>=140 && num<165){
  key = num+"보다 작을 겁니다.";
}else{
  key = num+"cm 맞쥬 땅꼬맠 케켘ㅋㅋㅋ";
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <h1><%=key %></h1>
  <style>
 h1{
     font-style:italic;
     color:red;
 }</style>
</body>
</html>