package vn.edu.hcmuaf.fit.bean;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;

public class Order implements Serializable {
    int id;
    int user_id;
    String name;
    String phone;
    String address;
    Timestamp time;
    String note;

    private Coupon coupon;
    List<Item> listItems;
    float total;
    int status;

    public Order(int id, int user_id, String name, String phone, String address, Timestamp time, String note, Coupon coupon, List<Item> listItems, float total, int status) {
        this.id = id;
        this.user_id = user_id;
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.time = time;
        this.note = note;
        this.coupon = coupon;
        this.listItems = listItems;
        this.total = total;
        this.status = status;
    }

    public Order() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

//    public void setTotal() {
//        if(this.cart != null) {
//            this.total = this.cart.getTotalMoney();
//        }
//        this.total = 0;
//
//    }

    public void setTotal() {
        if(this.listItems.size() > 0) {
            for (Item item : this.listItems) {
                this.total += item.getPrice();
            }
        } else {
             this.total = 0;
        }
    }

//    public Cart getCart() {
//        return cart;
//    }
//
//    public void setCart(Cart cart) {
//        this.cart = cart;
//    }

    public void setListItems(List<Item> listItems) {
        this.listItems = listItems;
    }

    public List<Item> getListItems() {
        return listItems;
    }

    public Coupon getCoupon() {
        return coupon;
    }

    public void setCoupon(Coupon coupon) {
        this.coupon = coupon;
    }


    @Override
    public String toString() {
        return "Order{" + "id="+id+
                ", user_id=" + user_id +
                ", name='" + name + '\'' +
                ", phone='" + phone + '\'' +
                ", address='" + address + '\'' +
                ", time=" + time +
                ", note='" + note + '\'' +

                ", total=" + total +
                ", status=" + status +
                '}';
    }
}
