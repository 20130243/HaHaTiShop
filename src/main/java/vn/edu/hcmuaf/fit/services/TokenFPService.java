package vn.edu.hcmuaf.fit.services;

import org.apache.commons.lang3.RandomStringUtils;
import vn.edu.hcmuaf.fit.bean.Token;
import vn.edu.hcmuaf.fit.bean.User;
import vn.edu.hcmuaf.fit.dao.TokenDAO;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Map;

public class TokenFPService {

    TokenDAO dao = new TokenDAO();

    public Token getById(int id) throws SQLException {
        Map<String, Object> map = dao.getById(id);

        return map != null ? convertMapToUser(map) : null;
    }

    public String generateToken(){
        return RandomStringUtils.randomAlphanumeric(45);
    }

    public Token generateToken(User user) {
        Token token = new Token();
        token.setToken(generateToken());
        token.setUser_id(user.getId());
        token.setSend_at(new Timestamp(System.currentTimeMillis()));

        dao.insert(token.getToken(), token.getUser_id(), token.getSend_at());

        return token;
    }

    public Token convertMapToUser(Map<String, Object> map) {
        Token token = new Token();
        token.setId((int) map.get("id"));
        token.setToken((String) map.get("token"));
        token.setUser_id((int) map.get("user_id"));
        token.setSend_at((Timestamp) map.get("send_at"));
        return token;
    }

    public static void main(String[] args) {
        TokenFPService service = new TokenFPService();
        System.out.println(service.generateToken());
    }

}
