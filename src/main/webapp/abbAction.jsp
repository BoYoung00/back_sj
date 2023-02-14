<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="Dao.Dao" %>
<%@ page import="Dto.Dto" %>
<%@ page import="java.io.PrintWriter" %>

<%
    request.setCharacterEncoding("UTF-8"); //index에서 값 가져올 때 어떤 언어로 가져올지 정해주는거

    PrintWriter script = response.getWriter(); //jsp에서 자바의 sout 기능을 해주는거

    String userID = null;
    String userPW = null;

    if (request.getParameter("userID") != null) {
        userID = (String) request.getParameter("userID");
    }

    if (request.getParameter("userPW") != null) {
        userPW = (String) request.getParameter("userPW");
    }

    if (userID.equals("") || userPW.equals("")) {
        script.println("<script>");
        script.println("alert('입력이 안된 사항이 있습니다.')");
        script.println("location.href='index.jsp'");
        script.println("</script>");
        script.close();
        return;
    }

    Dto dto = new Dto(userID, userPW);
    Dao dao = new Dao();
    int insert = dao.addUser(dto);

    if (insert == 1) {
        script.println("<script>");
        script.println("alert('회원가입에 성공하였습니다.')");
        script.println("location.href='index.jsp'");
        script.println("</script>");
        script.close();
        return;
    }
%>