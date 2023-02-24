package vn.edu.hcmuaf.fit.bean;

import java.io.Serializable;
import java.sql.Timestamp;

public class Token implements Serializable {

    private int id;

    private String token;

    private int user_id;

    private Timestamp send_at;

    public Token(int id, String token, int user_id, Timestamp send_at) {
        this.id = id;
        this.token = token;
        this.user_id = user_id;
        this.send_at = send_at;
    }

    public Token() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public Timestamp getSend_at() {
        return send_at;
    }

    public void setSend_at(Timestamp send_at) {
        this.send_at = send_at;
    }

    @Override
    public String toString() {
        return "Token{" +
                "id=" + id +
                ", token='" + token + '\'' +
                ", user_id=" + user_id +
                ", send_at=" + send_at +
                '}';
    }
}
