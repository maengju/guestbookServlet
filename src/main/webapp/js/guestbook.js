function checkGuestbookWrite(){
	
	document.getElementById("subjectDiv").innerText = "";
	document.getElementById("contentDiv").innerText = "";
	
	if (document.getElementById("subject").value == "") {
		document.getElementById("subjectDiv").innerText = "제목을 입력하세요"

	} else if (document.getElementById("content").value == "") {
		document.getElementById("contentDiv").innerText = "내용을 입력하세요"

	}else {
		document.guestbookWriteForm.action="http://localhost:8080/guestbookServlet/guestbook/guestbookWrite.jsp";
		document.guestbookWriteForm.submit();
	}

	
}