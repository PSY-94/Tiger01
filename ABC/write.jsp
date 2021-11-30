<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 게시판</title>
<style>
  table{border-collapse:collapse;width:400px;}
  td{border:1px solid #dedede;}
  td:nth-child(1){width:150px;text-align:right;}
  input,textarea{width:270px;}
</style>
</head>
<body>
  <h1>새글작성</h1>
  <p><a href="list.jsp">목록보기</a></p>
  <form action="write_ok.jsp" method="post">
    <fieldset>
    	<legend>내용입력</legend>
    	
    	<table>
    	
  <tr>
    <td>글제목</td>
    <td><input type="text" id="title" name="title" autocomplete="off" required autofocus/></td>
  </tr>
  <tr>
    <td>글내용</td>
    <td>
      <textarea name="cont" cols="30" rows="10"></textarea>
    </td>
  </tr>
  <tr>
    <td>작성자</td>
    <td><input type="text" name="writer" autocomplete="off"/></td>
  </tr>
  <tr>
    <td>비밀번호</td>
    <td><input type="password" name="pwd" required/></td>
  </tr>
  
</table>

<p>
  <button>확인</button>
  <button onclick="history.back()">취소</button>
</p>
    </fieldset>
  </form>
  
<script>

 // 페이지 로드시 제목입력란이 활성화 됨
 document.getElementByld('title').focus();

</script>  
  
</body>
</html>