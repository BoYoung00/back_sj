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

</body>
</html>