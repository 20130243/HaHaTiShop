package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

public class TokenDAO extends RD{

    private static final String tableName = "forgot_pass";

    @Override
    public List<Map<String, Object>> getAll() throws SQLException {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT * FROM " + tableName)
                        .mapToMap()
                        .list()
        );
    }

    @Override
    public Map<String, Object> getById(int id) throws SQLException {
        return checkId(id) ? JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT * FROM " + tableName + " WHERE id=:id")
                        .bind("id", id)
                        .mapToMap()
                        .first()
        ) : null;
    }

    public Map<String, Object> getByToken(String token) {
        return !checkToken(token) ?  JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT * FROM " + tableName + " WHERE token=:token")
                        .bind("token", token)
                        .mapToMap()
                        .first()
        ) : null;

    }

    public boolean checkToken(String token) {
        int a = JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT COUNT(*) FROM " + tableName + " WHERE token=:token")
                        .bind("token", token)
                        .mapTo(Integer.class).first());
        return a < 1;
    }

    public boolean checkId(int id) {
        int a = JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT COUNT(*) FROM " + tableName + " WHERE id=:id")
                        .bind("id", id)
                        .mapTo(Integer.class).first());
        return a == 1;
    }

    @Override
    public void delete(int id) {
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("DELETE FROM " + tableName + " WHERE id=:id")
                        .bind("id", id)
                        .execute()
        );
    }

    public void insert(String token, int user_id, Timestamp send_at) {
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("INSERT INTO " + tableName + "(token,user_id,send_at) VALUES(:token,:user_id,:send_at)")
                        .bind("token", token)
                        .bind("user_id", user_id)
                        .bind("send_at", send_at)
                        .execute()
        );
    }

    public void update(int id, String token, int user_id, Timestamp send_at) {
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("UPDATE " + tableName + " SET token=:token,user_id=:user_id,send_at=:send_at  WHERE id=:id ")
                        .bind("token", token)
                        .bind("user_id", user_id)
                        .bind("send_at", send_at)
                        .bind("id", id)
                        .execute()
        );
    }

}
