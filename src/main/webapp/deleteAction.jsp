<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="Dao.Dao" %>
<%@ page import="Dto.Dto" %>
<%@ page import="java.io.PrintWriter" %>

<%
    request.setCharacterEncoding("UTF-8");

    PrintWriter script = response.getWriter(); //jsp에서 자바 언어로 js, html, css 언어를 사용할 때

    String userID = null;

    //메인 페이지에 있는 텍스트 박스 값을 가져오는 코드
    if(request.getParameter("userID")!=null){ //비어있지 않다면
        userID = (String)request.getParameter("userID");
    }

    if (userID.equals("")) { //userID 안에 값이 ""와 같냐 (userID == "")
        script.println("<script>");
        script.println("alert('아이디를 입력해주세요')");
        script.println("location.href='index.jsp'");
        script.println("</script>");
        script.close();
        return;
    }

    Dao dao = new Dao();
    int insert = dao.deletetUser(userID);

    if (insert == 1) {
        script.println("<script>");
        script.println("alert('삭제 성공')");
        script.println("location.href='index.jsp'");
        script.println("</script>");
        script.close();
        return;
    }
%>



