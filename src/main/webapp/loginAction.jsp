<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="Dao.Dao" %>
<%@ page import="Dto.Dto" %>
<%@ page import="java.io.PrintWriter" %>

<%
    request.setCharacterEncoding("UTF-8");

    PrintWriter script = response.getWriter(); //jsp에서 자바 언어로 js, html, css 언어를 사용할 때

    String userID = null;
    String userPW = null;

    //메인 페이지에 있는 텍스트 박스 값을 가져오는 코드
    if(request.getParameter("userID")!=null){
        userID = (String)request.getParameter("userID");
    }
    if(request.getParameter("userPW")!=null){
        userPW = (String)request.getParameter("userPW");
    }

    //비어있는 값 오류 제어
    if (userID.equals("") || userPW.equals("")) { //userID == ""
        script.println("<script>");
        script.println("alert('입력이 안된 사항이 있습니다.')");
        script.println("location.href='index.jsp'");
        script.println("</script>");
        script.close();
        return;
    }

    Dto dto = new Dto(userID, userPW);
    Dao dao = new Dao();

    int insert = dao.loginUser(dto);

    if (insert==1) { //성공
        script.println("<script>");
        script.println("alert('로그인에 성공하였습니다.')");
        script.println("</script>");
        script.close();
        return;
    }
    if (insert==0) { //하나 불일치
        script.println("<script>");
        script.println("alert('비밀번호가 틀렸습니다.')");
        script.println("</script>");
        script.close();
        return;
    }
    if (insert==-1) { //모두 불일치
        script.println("<script>");
        script.println("alert('일치하는 계정이 존재하지 않습니다.')");
        script.println("</script>");
        script.close();
        return;
    }
    if (insert==-2) { //DB오류
        script.println("<script>");
        script.println("alert('DB 오류')");
        script.println("</script>");
        script.close();
        return;
    }

%>
