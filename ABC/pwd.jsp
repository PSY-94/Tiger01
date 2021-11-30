<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 게시판</title>
<style>
 ul{list-style:none;}
 li{padding:5px 0;}
</style>
</head>
<body>

  <h1>비밀번호 확인</h1>
  <p><a href="list.jsp">목록보기</a></p>
  
  <form action="del_ok.jsp" method="post">
    <input type="hidden" name="idx" value="<%=request.getParameter("idx") %>" />
    <fieldset>
      <legend>비번입력</legend>
  
      <ul>
      	<li>비밀번호 : <input type="password" name="pwd"/></li>
      	<li>
      	 <button type="submit">확인</button>
      	 <button type="button" onclick="history.back();">취소</button>
      	</li>
      </ul>
    </fieldset>
  
  
  </form>
</body>
</html>