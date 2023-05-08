package vn.edu.hcmuaf.fit.services;

import org.apache.commons.lang3.RandomStringUtils;
import vn.edu.hcmuaf.fit.bean.Blog;
import vn.edu.hcmuaf.fit.bean.Token;
import vn.edu.hcmuaf.fit.bean.User;
import vn.edu.hcmuaf.fit.dao.UserDAO;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Properties;


public class UserService {
    UserDAO dao = new UserDAO();

    public User getById(int id) {
        Map<String, Object> map = dao.getById(id);

        return map != null ? convertMapToUser(map) : null;
    }

    public void insert(User user, String password) {
        dao.insert(user.getUsername(), hashPassword(password), user.getName(), user.getAddress(), user.getPhone(), user.getEmail(), user.getLevel());
    }

    public String hashPassword(String password) {
        try {
            MessageDigest sha256 = null;
            sha256 = MessageDigest.getInstance("SHA-256");
            byte[] hash = sha256.digest(password.getBytes());
            BigInteger number = new BigInteger(1, hash);
            return number.toString(16);
        } catch (NoSuchAlgorithmException e) {
            return null;
        }
    }


    public User login(String email, String password) {
        Map<String, Object> map = dao.login(email, hashPassword(password));
        return map != null ? convertMapToUser(map) : null;
    }

    public User login(String token) {
        Map<String, Object> map = dao.login(token);
        return map != null ? convertMapToUser(map) : null;
    }
    public User loginSocial(String email) {
        Map<String, Object> map = dao.loginSocial(email);
        return map != null ? convertMapToUser(map) : null;
    }
    public void update(User user) {
        dao.update(user.getId(), user.getUsername(), user.getName(), user.getAddress(), user.getPhone(), user.getEmail(), user.getLevel());

    }
    public void updatePassword(User user, String password){
        dao.update(user.getId(), hashPassword(password));
    }
    public void updatePassword(int id, String password){
        dao.update(id, hashPassword(password));
    }
    public boolean checkUsername(User user) {
        return dao.checkUsername(user.getUsername());
    }


    public boolean checkEmail(String email) {
        return dao.checkEmail(email);
    }

    public User getByEmail(String email) {
        Map<String, Object> map = dao.getByEmail(email);
        return map != null ? convertMapToUser(map) : null;
    }

    public static boolean sendMail(String to, String subject, String text) {
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("thaha8788@gmail.com", "vcfkhctyluiorzpw");
            }
        });
        try {
            Message message = new MimeMessage(session);
            message.setHeader("Content-Type", "text/plain; charset=UTF-8");
            message.setFrom(new InternetAddress("thaha8788@gmail.com"));
            message.setReplyTo(InternetAddress.parse("thaha8788@gmail.com", false));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject(subject);
            message.setText(text);
            Transport.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public boolean passwordRecovery( String email) {
        User user = getByEmail(email);
        if (user != null ) {
            Token token = generateToken(user);
            String link = "http://localhost:8080/forgotpassword?token=" + token.getToken();
            String text = "Xin chào " + user.getName() + ",\n" +
                    "\n" +
                    "Ai đó đã yêu cầu mật khẩu mới cho tài khoản của bạn  được liên kết với Email: " + user.getEmail() + " .\n" +
                    "\n" +
                    "Mật khẩu mới của bạn: " + link +
                    "\n" +
                    "The HaHaTi team" +
                    "\n" +
                    "http://localhost:8080/login";
            return sendMail(email, "Password recovery", text);

        } else {  return false;        }


    }

    public Token generateToken(User user) {
        TokenFPService service = new TokenFPService();
        return service.generateToken(user);
    }

    public boolean checkPassword(int id, String password) {
        return dao.checkPassword(id, hashPassword(password));
    }
    public boolean checkPassword(String email, String password) {
        return dao.checkPassword(email, hashPassword(password));
    }

    public boolean checkAdmin(User user) {
        return user.getLevel() == 1;
    }

    public User convertMapToUser(Map<String, Object> map) {
        User user = new User();
        user.setId((int) map.get("id"));
        user.setUsername((String) map.get("username"));
        user.setName((String) map.get("name"));
        user.setEmail((String) map.get("email"));
        user.setPhone((String) map.get("phone"));
        user.setAddress((String) map.get("address"));
        user.setLevel((Integer) map.get("level"));
        user.setToken((String) map.get("token"));
        return user;
    }

    public void updateToken(User user) {
        String token = new TokenService().generateNewToken();
        user.setToken(token);
        dao.updateToken(user.getId(), token);
    }
    public int getTotal() {
        return dao.getTotal();
    }
    public List<User> getPaging(int index) {
        List<User> list = new ArrayList<>();
        for (Map<String, Object> map : dao.paging(index)) {
            list.add(convertMapToUser(map));
        }
        return list;
    }

    public void delete(int id) {
        dao.delete(id);
    }

    public static void main(String[] args) {
        System.out.println(new UserService().checkEmail("manhha584224@gmail.com"));
    }
}
