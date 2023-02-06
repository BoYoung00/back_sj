<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>

<form action="" method="post">
    <input type="text" name="name" id="">
    <input type="submit" value="확인">
</form>

<%
    String name = request.getParameter("name");
%>

받은 값 : <%=name%>

<hr>

<form action="loginAction.jsp" method="post">
    <input type="text" name="userID" id="userID">
    <input type="text" name="userPW" id="userPW">
    <input type="submit" value="로그인">
</form>

<hr>

<form action="deleteAction.jsp" method="post">
    <input type="text" name="userID" id="delID">
    <input type="submit" value="삭제">
</form>

</body>
</html>