package Test;

import Dao.Dao;
import Dto.Dto;

public class Test {
    public static void main(String[] args) {
        Dao dao = new Dao();
        Dto dto = dao.getUser("qhdud20");

        System.out.println(dto);
    }

    public void addUser() {
        String id = "qhdud20";
        String pw = "aaaa11";

        Dto dto = new Dto(id, pw);
        Dao dao = new Dao();

        int insetCount = dao.addUser(dto);

        System.out.println(insetCount);
    }
}
