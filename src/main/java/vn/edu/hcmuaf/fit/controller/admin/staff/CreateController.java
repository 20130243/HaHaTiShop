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

@WebServlet(name = "Staff create", value = "/admin/staff/create")
public class CreateController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (!response.isCommitted())  request.getRequestDispatcher("create.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
            String name = request.getParameter("name");
            String username = request.getParameter("username");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone").trim();
            int level = Integer.parseInt(request.getParameter("level").trim());
            Admin admin = new Admin(0, username, name, email, phone, level, null);
            AdminService adminService = new AdminService();
            List<String> errorMessages = new ArrayList<>();
            if (!adminService.checkUsername(username)) {
                errorMessages.add("1");
            }
            if (!adminService.checkEmail(email)) {
                errorMessages.add("2");
            }
            if (!adminService.checkPhone(phone)) {
                errorMessages.add("3");
            }

            if (!errorMessages.isEmpty()) {
                Gson gson = new Gson();
                String json = gson.toJson(errorMessages);
                response.getWriter().write(json);
            } else {
                adminService.insert(admin, "123");
                HttpSession session = request.getSession();
                  admin = (Admin) session.getAttribute("admin");
                adminService.logAccount(adminService.getAdminNew(), request.getRemoteAddr(),admin.getId(),level);
                response.getWriter().write("1");
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
