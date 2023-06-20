package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.bean.Category;
import vn.edu.hcmuaf.fit.bean.Product;
import vn.edu.hcmuaf.fit.db.JDBIConnector;
import vn.edu.hcmuaf.fit.services.CategoryService;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class ProductDAO extends RD {
    private static final String tableName = "products";

    @Override
    public List<Map<String, Object>> getAll() {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT * FROM " + tableName + "   ORDER BY id DESC")
                        .mapToMap()
                        .list()
        );
    }

    @Override
    public Map<String, Object> getById(int id) {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT * FROM " + tableName + " WHERE id=? ORDER BY id")
                        .bind(0, id)
                        .mapToMap()
                        .first());
    }

    public static void insert(String name, int categoryID, int status)  {
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("INSERT INTO " + tableName + "(name,category_id,status) VALUES(:name,:category_id ,:status)")
                        .bind("name", name)
                        .bind("category_id", categoryID)
                        .bind("status", status)
                        .execute()
        );
    }

    public static void update(int id, String name, int categoryID, int status) {
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("UPDATE " + tableName + " SET name=:name,category_id=:category_id ,status=:status WHERE id=:id")
                        .bind("name", name)
                        .bind("category_id", categoryID)
                        .bind("status", status)
                        .bind("id", id)
                        .execute()
        );
    }


    @Override
    public void delete(int id) {
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("DELETE FROM " + tableName + " WHERE id=:id")
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

    public int getTotalProduct() {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("select count(*) from " + tableName + "").mapTo(Integer.class).first()
        );
    }

    public List<Map<String, Object>> pagingProduct(int index) {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("select * from " + tableName + " where status != 3\n" +
                        "order by id DESC \n" +
                        "LIMIT ? , 12;").bind(0, (index - 1) * 12).mapToMap().list()
        );
    }

    public List<Map<String, Object>> pagingProductAdmin(int index) {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("select * from " + tableName + " \n" +
                        "order by id DESC \n" +
                        "LIMIT ? , 12;").bind(0, (index - 1) * 12).mapToMap().list()
        );
    }


    public List<Map<String, Object>> getProductByCategory(int id_category) {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("select * from " + tableName + "\n" +
                                "where " + tableName + ".category_id = ?;").bind(0, id_category)
                        .mapToMap()
                        .list()
        );
    }

    public List<Map<String, Object>> getProductNew() {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("select * from " + tableName + "\n" +
                                "ORDER BY " + tableName + ".id DESC LIMIT 8;")
                        .mapToMap()
                        .list()
        );
    }

    public Map<String, Object> findFirst() {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT * FROM " + tableName + " ORDER BY id DESC LIMIT 1")
                        .mapToMap().first());
    }

    public List<Map<String, Object>> getProductSale() {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT * FROM " + tableName + " WHERE status = 1  ")
                        .mapToMap()
                        .list()
        );
    }

    public boolean checkInventoryProduct(int proid) {
        boolean result = false;
       List<Map<String, Object>> list =  JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT * FROM " + tableName + " WHERE `id` =   "+proid)
                        .mapToMap()
                        .list()
        );
       if (list.size()==1){
           Map<String, Object> p = list.get(0);
           Category category = new CategoryService().getById((int)p.get("category_id"));

           if ((int)p.get("status") >= 2){
               result=true;
           }
           else if (category.getStatus() >=1) {
               result=true;
           }
       }
        return result;
       
    }

    public List<Map<String, Object>> getSearchProducts(String search, String category) {
        String checkCategory;
        if (category != "") {
            checkCategory = " and category_id = " + category;
        } else {
            checkCategory = "";
        }
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT * FROM " + tableName + " WHERE `name` LIKE ?" + checkCategory)
                        .bind(0, "%"+ search +"%")
                        .mapToMap()
                        .list());
    }

    public static void main(String[] args) {

        boolean b = new ProductDAO().checkInventoryProduct(127);
        System.out.println(b);
    }

}
