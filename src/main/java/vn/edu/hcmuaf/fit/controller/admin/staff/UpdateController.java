package vn.edu.hcmuaf.fit.controller.admin.staff;

import com.google.gson.Gson;
import vn.edu.hcmuaf.fit.bean.Admin;
import vn.edu.hcmuaf.fit.services.AdminService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "Staff update", value = "/admin/staff/update")
public class UpdateController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        try {
            Admin admin = (new AdminService()).getById(id);
            request.setAttribute("object", admin);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        if (!response.isCommitted())  request.getRequestDispatcher("update.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
            int id = Integer.parseInt(request.getParameter("id").trim());
            String name = request.getParameter("name");
            String username = request.getParameter("username");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone").trim();
            int level = Integer.parseInt(request.getParameter("level").trim());
            AdminService adminService = new AdminService();
            List<String> errorMessages = new ArrayList<>();
            Admin admin = adminService.getById(id);
            if (!username.equals(admin.getUsername())) {
                admin.setUsername(username);
                if (!adminService.checkUsername(username)) {
                    errorMessages.add("1");
                }
            }
            if (!email.equals(admin.getEmail())) {
                admin.setEmail(email);
                if (!adminService.checkEmail(email)) {
                    errorMessages.add("2");
                }
            }
            if (!phone.equals(admin.getPhone())) {
                admin.setPhone(phone);
                if (!adminService.checkPhone(phone)) {
                    errorMessages.add("3");
                }
            }
            admin.setLevel(level);
            if (!errorMessages.isEmpty()) {
                Gson gson = new Gson();
                String json = gson.toJson(errorMessages);
                response.getWriter().write(json);
            } else {
                adminService.update(admin);
                HttpSession session = request.getSession();
                adminService.logAccount(admin.getId(), request.getRemoteAddr(),((Admin) session.getAttribute("admin")).getId(),level);
                response.getWriter().write("1");
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
