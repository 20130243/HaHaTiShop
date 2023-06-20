package vn.edu.hcmuaf.fit.bean;

public class ProductCost {
    int id;
    int product_id;
    String size;
    float price;

    public ProductCost() {
    }

    public ProductCost(int id, int product_id, String size, float price) {
        this.id = id;
        this.product_id = product_id;
        this.size = size;
        this.price = price;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "ProductCost{" +
                "id=" + id +
                ", product_id=" + product_id +
                ", size='" + size + '\'' +
                ", price=" + price +
                '}';
    }
}
