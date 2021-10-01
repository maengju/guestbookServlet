<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록</title>
<style type="text/css">


div{
	font-size: 8pt;
	color: red;
	font-weight: bold;
	
}

</style>

<script type="text/javascript" src="http://localhost:8080/guestbookServlet/js/guestbook.js"></script>

</head>
<body>

<header>
	<h1>글쓰기</h1>
</header>

<section>

<form name="guestbookWriteForm" method="post" action="">
	<table border="1" cellspacing="0" cellpadding="5" width="650px">
		<tr>
			<td width="100" align="center">작성자</td>
			<td>
				<input type="text" name="name" id="name" placeholder="작성자 입력">
			</td>
		</tr>
		
		<tr>
			<td width="100" align="center">이메일</td>
			<td>
				<input type="email" name="email" id="email" size = "30"placeholder="이메일 입력">
			</td>
		</tr>
		
		<tr>
			<td width="100" align="center">홈페이지</td>
			<td>
				<input type="text" value="http://" name="homepage" id="homepage" size = "40" >
			</td>
		</tr>
		
		<tr>
			<td width="100" align="center">제목</td>
			<td>
				<input type="text" name="subject" id="subject" size = "70" placeholder="제목 입력">
				<div id="subjectDiv"></div>
			</td>
		</tr>
		
		<tr>
			<td width="100" height="150" align="center">내용</td>
			<td>
				<textarea name="content" id="content" rows="14" cols="70" placeholder="내용 입력"></textarea>
				<div id="contentDiv"></div>
			</td>
		</tr>
		
		<tr>
			<td colspan="3" align="center">
				<input type="button" value="글작성" name="writeBtn" id="writeBtn" onclick="checkGuestbookWrite()">
				<input type="reset" value="다시작성" name="resetBtn" id="resetBtn">
				<input type="button" value="글목록" name="listBtn" id="listBtn" onclick="location.href='guestbookList.jsp'">
			</td>
		</tr>
	</table>
	
</form>	
</section>

</body>
</html>