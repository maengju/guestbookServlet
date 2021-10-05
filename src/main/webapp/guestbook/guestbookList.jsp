<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="guestbook.bean.GuestbookDTO"  %>
    <%@ page  import="guestbook.dao.GuestbookDAO"  %>
    <%@ page  import="java.util.ArrayList"  %>
    <%@ page  import="java.util.List"  %>
  
 
    
<%
List<GuestbookDTO> list= new ArrayList<GuestbookDTO>();



//data
request.setCharacterEncoding("UTF-8");
int pg = Integer.parseInt(request.getParameter("pg"));


//db

response.setContentType("text/html;charset=UTF-8"); 

//페이징 처리 한페이지당 3개
int endNum = pg*3;
int startNum = endNum-2;

GuestbookDAO guestbookDAO = GuestbookDAO.getInstance();

list = guestbookDAO.printAll(startNum, endNum);

int totalA = guestbookDAO.getTotalA(); //총글수
int totalP = (totalA+2)/3; //페이지 번호

%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style type="text/css">


#currentPagingA{
	color: red;
	text-decoration: underline;
}

#pagingA{
	color:black;
	text-decoration: none;
}

a:hover{
	text-decoration: underline;
	background: cyan;
}
</style>

<title>방명록</title>

</head>
<body>
<h1>글 목록</h1>
<input type="button" value="글쓰기" onclick="location.href='guestbookWriteForm.jsp'"><br><br>

<h1> <%= totalA %> </h1>
 

<% if(list != null){ %>
	
	
	<% for(int i=0; i<list.size(); i++){ %>
	
		<table border="1"   width="450px" >
			<tr>
				<td width="70" align="center">작성자</td>
				<td width="100" align="center"><%=list.get(i).getName() %>
				<td width="70" align="center">작성일</td>
				<td align="center"><%=list.get(i).getLogtime() %>
			</tr>
		
			<tr>
				<td width="70" align="center">이메일</td>
				<td colspan="3" align="center"><%=list.get(i).getEmail() %>
			
			</tr>
			
			<tr>
				<td width="70" align="center">홈페이지</td>
				<td colspan="3"  align="center"><%=list.get(i).getHomepage() %>
			
			</tr>	
			
			<tr>
				<td width="70" align="center">제목</td>
				<td colspan="3" align="center"><%=list.get(i).getSubject() %></td>
			
			</tr>
				
			<tr>
				
				<td colspan="4" height="200px" align="center"><pre> <%=list.get(i).getContent() %> </pre></td>
			
			</tr>
		
		</table>
		<hr width="500" align="left" color="red">
	
	<%} /* for */ %>
	<div style="width:450px; text-align:center;">
	<% for(int i=1; i<=totalP; i++) {%>
		<%if(i==pg) {%>
			 [<a href="guestbookList.jsp?pg=<%=i %>" id="currentPagingA"><%=i%></a>]
		
		<%}else{ %>
			 [<a href="guestbookList.jsp?pg=<%=i %>" id="pagingA"><%=i%></a>]
		<% } %>
	
	<%} %>
	</div>
	
<% } %>
</body>
</html>