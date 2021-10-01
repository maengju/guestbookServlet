<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="guestbook.bean.GuestbookDTO"  %>
    <%@ page  import="guestbook.dao.GuestbookDAO"  %>
    <%@ page  import="java.util.ArrayList"  %>
    <%@ page  import="java.util.List"  %>
  
<%! List<GuestbookDTO> list= new ArrayList<GuestbookDTO>();%>  
    
<%
request.setCharacterEncoding("UTF-8");



//db

GuestbookDAO guestbookDAO = GuestbookDAO.getInstance();

list = guestbookDAO.printAll();


response.setContentType("text/html;charset=UTF-8"); 

%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
<h1>글 목록</h1>
<input type="button" value="글쓰기" onclick="location.href='guestbookWriteForm.jsp'">

<% for(int i=0; i<list.size(); i++){ %>

	<table border="1" cellspacing="0" cellpadding="5">
		<tr>
			<td width="70" align="center">작성자</td>
			<td><%=list.get(i).getName() %>
			<td width="70" align="center">작성일</td>
			<td><%=list.get(i).getLogtime() %>
		</tr>
	
		<tr>
			<td width="70" align="center">이메일</td>
			<td colspan="3"><%=list.get(i).getEmail() %>
		
		</tr>
		
		<tr>
			<td width="70" align="center">홈페이지</td>
			<td colspan="3"><%=list.get(i).getHomepage() %>
		
		</tr>	
		
		<tr>
			<td width="70" align="center">제목</td>
			<td colspan="3"><%=list.get(i).getSubject() %>
		
		</tr>
			
		<tr>
			
			<td colspan="4"><%=list.get(i).getContent() %>
		
		</tr>
	
	</table>
	<hr>

<%} /* for */ %>


</body>
</html>