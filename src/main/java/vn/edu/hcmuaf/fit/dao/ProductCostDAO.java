package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.List;
import java.util.Map;

public class ProductCostDAO extends RD {

    private static final String tableName = "product_cost";

    @Override
    public List<Map<String, Object>> getAll() {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT * FROM " + tableName)
                        .mapToMap()
                        .list()
        );
    }

    @Override
    public Map<String, Object> getById(int id) {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT * FROM " + tableName + " WHERE id =:id")
                        .bind("id", id)
                        .mapToMap()
                        .first()
        );
    }

    public List<Map<String, Object>> getByProductId(int id) {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT * FROM " + tableName + " WHERE product_id =:product_id")
                        .bind("product_id", id)
                        .mapToMap()
                        .list()
        );
    }

    public void insert(int product_id, String size, float price) {
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("INSERT INTO " + tableName + "(product_id,size,price) VALUES(:product_id,:size,:price)")
                        .bind("size", size)
                        .bind("price", price)
                        .bind("product_id", product_id)
                        .execute()
        );
    }

    public void update(int id, String name, float price) {
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("UPDATE " + tableName + " SET name=:name,price=:price WHERE id=:id")
                        .bind("name", name)
                        .bind("price", price)
                        .bind("id", id)
                        .execute());
    }

    public void updateByProductId(int product_id, String name, float price) {
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("UPDATE " + tableName + " SET price=:price WHERE product_id=:product_id AND name=:name")
                        .bind("name", name)
                        .bind("price", price)
                        .bind("product_id", product_id)
                        .execute());
    }



    public void deleteByProductId(int product_id) {
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("DELETE FROM " + tableName + " WHERE product_id=:product_id")
                        .bind("product_id", product_id)
                        .execute());
    }

    @Override
    public void delete(int id) {
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("DELETE FROM " + tableName + " WHERE id=:id")
                        .bind("id", id)
                        .execute()
        );
    }

    public static void main(String[] args) {
        System.out.println(new ProductCostDAO().getAll());
    }

}
