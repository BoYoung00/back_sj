package Test;

import Dao.Dao;
import Dto.Dto;

public class Test {
    public static void main(String[] args) {

        //검색
//        Dao dao = new Dao();
//        Dto dto = dao.getUser("qhdud20");
//
//        System.out.println(dto);


        //삭제
//        String id = "qhdud20";
//
//        Dao dao = new Dao();
//
//        int deleteCount = dao.deletetUser(id);
//
//        System.out.println(deleteCount);

        //수정
        Dto dto = new Dto("qhdud20", "5555");
        Dao dao = new Dao();

        int updateCount = dao.updateUser(dto);

        System.out.println(updateCount);

    }

    //추가
    public void addUser() {
        String id = "qhdud20";
        String pw = "aaaa11";

        Dto dto = new Dto(id, pw);
        Dao dao = new Dao();

        int insetCount = dao.addUser(dto);

        System.out.println(insetCount);
    }
}
