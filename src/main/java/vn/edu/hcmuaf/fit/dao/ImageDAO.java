package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public class ImageDAO extends RD {
    private static final String tableName = "product_image";

    @Override
    public List<Map<String, Object>> getAll() throws SQLException {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT * FROM " + tableName + "   ORDER BY id DESC")
                        .mapToMap()
                        .list()
        );
    }

    @Override
    public Map<String, Object> getById(int id) throws SQLException {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT * FROM " + tableName + " WHERE id=? ORDER BY id")
                        .bind(0, id)
                        .mapToMap()
                        .first());
    }

    public List<Map<String, Object>> getByProductId(int id) {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT * FROM " + tableName + " WHERE product_id=? ORDER BY id")
                        .bind(0, id)
                        .mapToMap().list());
    }

    @Override
    public void delete(int id) {
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("DELETE FROM " + tableName + " WHERE id=:id")
                        .bind("id", id)
                        .execute()
        );
    }

    public void deleteByProductId(int product_id) {
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("DELETE FROM " + tableName + " WHERE product_id=:product_id")
                        .bind("product_id", product_id)
                        .execute()
        );
    }

    public static void insert(String name, String url, int product_id, int status) {
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("INSERT INTO " + tableName + "(name,url,product_id,status) VALUES(:name,:url,:product_id,:status)")
                        .bind("name", name)
                        .bind("url", url)
                        .bind("product_id", product_id)
                        .bind("status", status)
                        .execute()
        );
    }

    public static void update(int id, String name, String url, int product_id, int status) {
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("UPDATE " + tableName + " SET name=:name,category_id=:category_id,image=:image,status=:status WHERE id=:id")
                        .bind("name", name)
                        .bind("url", url)
                        .bind("product_id", product_id)
                        .bind("status", status)
                        .bind("id", id)
                        .execute()
        );
    }

    public void updateStatus(int id, int status) {
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("UPDATE " + tableName + " SET status=:status WHERE id=:id")
                        .bind("id", id)
                        .bind("status", status)
                        .execute()
        );
    }

    public void resetThumbnail(int product_id) {
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("UPDATE " + tableName + " SET status=0 WHERE product_id=:product_id")
                        .bind("product_id", product_id)
                        .execute()
        );
    }

    public static void main(String[] args) throws SQLException {
        System.out.println(new ImageDAO().getById(120));
    }
}
