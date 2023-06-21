package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.bean.User;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.sql.Date;
import java.util.Calendar;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;

public class UserDAO extends RD {
    private static final String tableName = "user";

    @Override
    public List<Map<String, Object>> getAll() {

        return JDBIConnector.get().withHandle(
                h -> h.createQuery("SELECT * FROM " + tableName)
                        .mapToMap()
                        .list()
        );
    }

    @Override
    public Map<String, Object> getById(int id) {
        return checkId(id) ? JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT * FROM " + tableName + " WHERE id=:id")
                        .bind("id", id)
                        .mapToMap()
                        .first()
        ) : null;
    }

    public Map<String, Object> getByEmail(String email) {
        return checkEmail(email) ? JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT * FROM " + tableName + " WHERE email=:email")
                        .bind("email", email)
                        .mapToMap()
                        .first()
        ) : null;
    }

    public boolean checkUsernameAndMail(String username, String email) {
        int a = JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT COUNT(*) FROM " + tableName + " WHERE username=:username and email=:email")
                        .bind("username", username)
                        .bind("email", email)
                        .mapTo(Integer.class).first());
        return a == 1;
    }

    @Override
    public void delete(int id) {
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("UPDATE " + tableName + "    SET level = -1 WHERE id=:id").bind("id", id).execute());
    }

    public void insert(String username, String password, String name, String address, String phone, String email, int level) {
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("INSERT INTO " + tableName + "(username,password,name,address,phone,email,level) VALUES (:username, :password, :name,:address,:phone, :email,  :level)")
                        .bind("username", username)
                        .bind("password", password)
                        .bind("name", name)
                        .bind("email", email)
                        .bind("phone", phone)
                        .bind("level", level)
                        .bind("address", address)
                        .execute());
    }

    public boolean checkUsername(String username) {
        int a = JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT COUNT(*) FROM " + tableName + " WHERE username=:username")
                        .bind("username", username)
                        .mapTo(Integer.class).first());
        return a == 1;
    }

    public void updateToken(int id, String token) {
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("UPDATE  " + tableName + " SET token =:token WHERE id =:id")
                        .bind("token", token)
                        .bind("id", id)
                        .execute());
    }

    public boolean checkId(int id) {
        int a = JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT COUNT(*) FROM " + tableName + " WHERE id=:id")
                        .bind("id", id)
                        .mapTo(Integer.class).first());
        return a == 1;
    }

    public void update(int id, String username, String name, String address, String phone, String email, int level) {
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("UPDATE " + tableName + " SET username=:username,name=:name,address=:address,phone=:phone,email=:email,level=:level WHERE id=:id")
                        .bind("username", username)
                        .bind("name", name)
                        .bind("address", address)
                        .bind("phone", phone)
                        .bind("email", email)
                        .bind("level", level)
                        .bind("id", id)
                        .execute());

    }

    public void update(int id, String password) {
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("UPDATE " + tableName + " SET password=:password WHERE id=:id")
                        .bind("password", password)
                        .bind("id", id)
                        .execute());

    }


    public Map<String, Object> login(String username, String password) {
        if (JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT COUNT(*) FROM " + tableName + " WHERE username =:username and password =:password")
                        .bind("username", username)
                        .bind("password", password)
                        .mapTo(Integer.class).first()) != 1) {
            return null;
        } else {
            return JDBIConnector.get().withHandle(h ->
                    h.createQuery("SELECT * FROM " + tableName + " WHERE username =:username and password=:password")
                            .bind("username", username)
                            .bind("password", password)
                            .mapToMap()
                            .first());
        }
    }

    public Map<String, Object> login(String token) {
        if (!checkValid(token)) {
            return null;
        }
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT * FROM " + tableName + " WHERE token =:token")
                        .bind("token", token)
                        .mapToMap()
                        .first());

    }

    public Map<String, Object> loginSocial(String email) {
        if (!checkEmail(email)) {
            return null;
        }
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT * FROM " + tableName + " WHERE email =:email")
                        .bind("email", email)
                        .mapToMap()
                        .first());

    }

    public boolean checkValid(String username, String password) {
        int result = JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT COUNT(*) FROM " + tableName + " WHERE username =:username and password =:password")
                        .bind("username", username)
                        .bind("password", password)
                        .mapTo(Integer.class).first());
        return result == 1;
    }

    public boolean checkEmail(String email) {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT COUNT(*) FROM " + tableName + " WHERE email =:email ")
                        .bind("email", email)
                        .mapTo(Integer.class).first()) == 1;
    }

    public boolean checkPassword(int id, String password) {
        int result = JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT COUNT(*) FROM " + tableName + " WHERE id =:id AND password =:password")
                        .bind("id", id)
                        .bind("password", password)
                        .mapTo(Integer.class).first());
        return result == 1;
    }

    public boolean checkPassword(String email, String password) {
        int result = JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT COUNT(*) FROM " + tableName + " WHERE email =:email AND password =:password")
                        .bind("email", email)
                        .bind("password", password)
                        .mapTo(Integer.class).first());
        return result == 1;
    }

    public boolean checkValid(String token) {
        int result = JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT COUNT(*) FROM " + tableName + " WHERE token =:token")
                        .bind("token", token)
                        .mapTo(Integer.class).first());
        return result == 1;
    }

    public List<Map<String, Object>> paging(int index) {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("select * from " + tableName +
                        " order by id DESC " +
                        " LIMIT ? , 10;").bind(0, (index - 1) * 10).mapToMap().list()
        );
    }

    public int getTotal() {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("select count(id) from " + tableName).mapTo(Integer.class).first());
    }

    public int getCountForgotPassword(String email, Date date) {
        List counts = JDBIConnector.get().withHandle(h ->
                h.createQuery("select count from " + "forgot_pass_count " + " where email = :email and date = :date")
                        .bind("email", email)
                        .bind("date", date)
                        .mapTo(Integer.class).list());
        if(counts.isEmpty()){
            return 0;
        } else {
            return (int) counts.get(0);
        }
    }

    public void updateCountForgotPassword(String email, Date date, int count) {
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("UPDATE " + "forgot_pass_count " + " SET count= :count where email = :email and date = :date")
                        .bind("count", count)
                        .bind("email", email)
                        .bind("date", date)
                        .execute());
    }

    public void insertCountForgotPassword(String email, Date date) {
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("INSERT INTO " + "forgot_pass_count " + "(email,date,count) VALUES (:email, :date, :count)")
                        .bind("email", email)
                        .bind("date", date)
                        .bind("count", 1)
                        .execute());
    }

    public static void main(String[] args) {
//        System.out.println(new UserDAO().getAll());
//        Calendar cal = Calendar.getInstance(TimeZone.getTimeZone("UTC"));
//        java.util.Date date = cal.getTime();
//        System.out.println(new UserDAO().getCountForgotPassword("tinhle2772002@gmail.com", new java.sql.Date(date.getTime())));



    }


    public int getUserNew() {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery(" SELECT MAX(id) from " + tableName  ).mapTo(Integer.class).first());
    }
}
