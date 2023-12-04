package vn.edu.hcmuaf.fit.services;

import com.google.gson.Gson;
import org.apache.commons.lang3.RandomStringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.slf4j.MDC;
import vn.edu.hcmuaf.fit.bean.Admin;
import vn.edu.hcmuaf.fit.bean.User;
import vn.edu.hcmuaf.fit.dao.AdminDAO;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class AdminService {
    AdminDAO dao = new AdminDAO();
    private static Logger LOGGER = null;

    public Admin getById(int id) {
        Map<String, Object> map = dao.getById(id);

        return map != null ? convertMaptoAdmin(map) : null;
    }

    public void insert(Admin admin, String password) {
        dao.insert(admin.getUsername(), hashPassword(password), admin.getName(), admin.getPhone(), admin.getEmail(), admin.getLevel());
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


    public Admin login(String username, String password) {
        Map<String, Object> map = dao.login(username, password);
        Admin admin = convertMaptoAdmin(map);
        if (admin != null) {
            return admin.available() ? admin : null;
        } else {
            return null;
        }

    }

    public Admin login(String token) {
        Map<String, Object> map = dao.login(token);
        Admin admin = convertMaptoAdmin(map);
        if (admin != null) {
            return admin.available() ? admin : null;
        } else {
            return null;
        }
    }


    public boolean checkUsername(Admin admin) {
        return dao.checkUsername(admin.getUsername());
    }

    public boolean checkUsername(String username) {
        return dao.checkUsername(username);
    }

    public Admin getByUsername(String username) {
        Map<String, Object> map = dao.getByUserName(username);
        return map != null ? convertMaptoAdmin(map) : null;
    }


    public String ramdomPassword() {
        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        String pwd = RandomStringUtils.random(8, characters);
        return pwd;
    }

    public boolean checkAdmin(User user) {
        return user.getLevel() == 1;
    }

    public Admin convertMaptoAdmin(Map<String, Object> map) {
        if (map != null) {
            Admin admin = new Admin();
            admin.setId((int) map.get("id"));
            admin.setUsername((String) map.get("username"));
            admin.setName((String) map.get("name"));
            admin.setEmail((String) map.get("email"));
            admin.setPhone((String) map.get("phone"));
            admin.setLevel((Integer) map.get("level"));
            admin.setToken((String) map.get("token"));
            return admin;
        } else return null;
    }

    public void updateToken(Admin admin) {
        String token = new TokenService().generateNewToken();
        admin.setToken(token);
        dao.updateToken(admin.getId(), token);
    }

    public void delete(int id) {
        dao.delete(id);
    }

    public void update(Admin admin) {
        dao.update(admin.getId(), admin.getUsername(), admin.getName(), admin.getEmail(), admin.getPhone(), admin.getLevel());
    }


    public int getTotal() {
        return dao.getTotal();
    }
    public int getAdminNew() {
        return dao.getAdminNew();
    }

    public List<Admin> getPaging(int index) {
        List<Admin> list = new ArrayList<>();
        for (Map<String, Object> map : dao.paging(index)) {
            list.add(convertMaptoAdmin(map));
        }
        return list;
    }

    public static void main(String[] args) {
        System.out.println(new AdminService().checkUsername(new Admin(0, "admin", "ha", null, null, 0, "")));
        new AdminService().insert(new Admin(0, "admin", "ha", null, null, 0, ""), "123");
    }

    public boolean checkEmail(String email) {
        return dao.checkEmail(email);
    }

    public boolean checkPhone(String phone) {
        return dao.checkPhone(phone);
    }


    public void logLogin(int adminId, String location, String method) {
        LOGGER = LoggerFactory.getLogger("User");
        if (LOGGER.isDebugEnabled()) {
            MDC.put("admin", new Gson().toJson(getById(adminId)));
            MDC.put("location", location);
            MDC.put("method", method);

            LOGGER.info("Admin login " + method);

            MDC.remove("admin");
            MDC.remove("location");
            MDC.remove("status");
        }
    }

    public void logAccount(int adminId, String location, int approver, int status) {
        LOGGER = LoggerFactory.getLogger("User");
        if (LOGGER.isDebugEnabled()) {
            MDC.put("admin", new Gson().toJson(getById(adminId)));
            MDC.put("location", location);
            MDC.put("approver", String.valueOf(approver));
            MDC.put("status", String.valueOf(status));

            switch (status) {
                case 0: {
                    LOGGER.info("Staff account created");
                    break;
                }
                case 1: {
                    LOGGER.info("Manager account created");
                    break;
                }
                case 2: {
                    LOGGER.info("Admin account created");
                    break;
                }
                case -1: {
                    LOGGER.warn("Account banned");
                    break;
                }
                default: {
                    break;
                }
            }

            MDC.remove("admin");
            MDC.remove("location");
            MDC.remove("approver");
            MDC.remove("status");
        }
    }
}
