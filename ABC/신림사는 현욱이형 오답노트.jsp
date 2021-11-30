<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

String res = "";
String num_ = request.getParameter("num");
int num = Integer.parseInt(num_);

if(num < 101) res = num+"명이요? 땡 훨씬 더 많습니다~!";

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신림사는 현욱이형의 오답노트</title>
</head>
<body>
 <h1><%=res %></h1>
 <style>
 h1{
     font-style:italic;
     color:red;
 }</style>
</body>
</html>