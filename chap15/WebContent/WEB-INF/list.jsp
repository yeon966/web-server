<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="guestbook.service.MessageListView"%>
<%@ page import="guestbook.service.GetMessageListService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>방명록 메시지 목록</title>
</head>
<body>
<form action="./write" method="post">
	메시지 : <textarea style="resize: none" name="message" cols="30" rows="3"></textarea><br>
	<input type="submit" value="메시지 남기기" />
	<br/>
	<a href="../index.jsp">[Index]</a>
</form>
<hr>
<c:if test="${ viewData.isEmpty() }">
	등록된 메시지가 없습니다.
</c:if>

<c:if test="${ !viewData.isEmpty() }">
<!-- table 2차원 도표를 나타내주는 태그  -->
<table border="1">
<!-- getter가 존재하면 필드이름만으로 el문에서 호출가능  -->
	<c:forEach var="message" items="${ viewData.messageList }">
	<tr>
		<td>
			메시지 번호 : ${ message.id } <br/>
			멤버 : ${ message.memberid } <br/>
			메시지 : ${ message.message } <br/>
			<a href="./delete?messageId=${ message.id }">[삭제하기]</a>
		</td>
	</tr>
	</c:forEach>
</table>
<!-- pageNum값의 시작값이 1이라는 뜻 (begin) -->
<c:forEach var="pageNum" begin="1" end="${ viewData.pageTotalCount }">
<a href="./list?page=${ pageNum }">[${ pageNum }]</a>
</c:forEach>
</c:if>
</body>
</html>