package vn.edu.hcmuaf.fit.bean;

import java.io.Serializable;

public class Image implements Serializable {
    int id;
    String name;
    String url;
    int product_id;
    int status;

    public Image() {
    }

    public Image(int id, String name, String url, int product_id, int status) {
        this.id = id;
        this.name = name;
        this.url = url;
        this.product_id = product_id;
        this.status = status;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Image{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", url='" + url + '\'' +
                ", product_id=" + product_id +
                ", status=" + status +
                '}';
    }
}
