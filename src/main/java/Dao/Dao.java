package Dao;

import Dto.Dto;

import java.sql.*;

public class Dao {
    //1단계 import java.sql.*; : sql문 일단 연동
    //2단계 드라이버를 로드한다 : 본인 컴퓨터에 깔려있는 버전 선언
    //3단계 Connection 객체 생성 : 데이터베이스 연결(url, user, pw 필요) jdbc:mysql://localhost:3306/sj_db / root / rlaqhdud2@
    //4단계 Statement 객체 생성 : inset into ~ (sql문 쿼리 연결)
    //sql문 결과물이 있다면 resultSet 생성 //결과값 가져오기 (ex. 숫자, 행 등등)
    //객체 닫아주기 (중요)

    private static String url = "jdbc:mysql://localhost:3306/sj_db";

    private static String user = "root";

    private static String password = "rlaqhdud2@";

    //추가
    public int addUser(Dto dto) {
        int inserCount = 0; //추가가 완료 되면 1으로 반환해주려고 선언

        //드라이버 로드
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        }catch (ClassNotFoundException e){
            e.printStackTrace();
        }

        String sql = "insert into sj_tb(id, pw) values (?,?)";

        try(Connection conn = DriverManager.getConnection(url, user, password);
            PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, dto.getId());
            ps.setString(2, dto.getPw());

            inserCount = ps.executeUpdate();

        }catch (Exception e) {
            e.printStackTrace();
        }

        return inserCount;
    }

    //검색
    public Dto getUser(String id) {
        //초고화
        Dto dto = null; //객체 연결
        Connection conn = null; //데이터베이스 연결

        PreparedStatement ps = null; //sql문장
        ResultSet rs = null; //값으로 뭔갈 해야할 때 사용

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, user, password);
            String sql = "select id, pw from sj_tb where id=?";
            ps=conn.prepareStatement(sql);
            ps.setString(1, id);

            rs = ps.executeQuery();

            if (rs.next()) { //값이 있다면
                String iid = rs.getString(1);
                String pw = rs.getString(2);
                
                dto = new Dto(iid, pw);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        
        //객체 닫기
        finally { //무조건 한 번 실행 시키기
            if (rs != null) { //Resultset 값이 없다면
                try {
                    rs.close(); //객체 닫기
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            if (ps != null) { //sql문장이 널값이 아니라면
                try {
                    ps.close();
                }catch (Exception e) {
                    e.printStackTrace();
                }
                
            }
        }
        return dto;
    }

}
