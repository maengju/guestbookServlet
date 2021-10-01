<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="guestbook.bean.GuestbookDTO"  %>
    <%@ page  import="guestbook.dao.GuestbookDAO"    %>

    
<%
    //데이터
    request.setCharacterEncoding("UTF-8");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String homepage = request.getParameter("homepage");
    String subject = request.getParameter("subject");
    String content = request.getParameter("content");

    GuestbookDTO guestbookDTO = new GuestbookDTO();

    guestbookDTO.setName(name);
    guestbookDTO.setEmail(email);
    guestbookDTO.setHomepage(homepage);
    guestbookDTO.setSubject(subject);
    guestbookDTO.setContent(content);

    //db
    GuestbookDAO guestbookDAO = GuestbookDAO.getInstance();
    guestbookDAO.write(guestbookDTO);

    //응답
    
    response.setContentType("text/html;charset=UTF-8"); 
    
    %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>작성하신 글을 저장하였습니다.</h3>

<input type="button" value="글 목록" name="documentListBtn" id="documentListBtn" onclick="location.href='guestbookList.jsp'">
<input type="button" value="글쓰기" onclick="location.href='guestbookWriteForm.jsp'">
</body>
</html>