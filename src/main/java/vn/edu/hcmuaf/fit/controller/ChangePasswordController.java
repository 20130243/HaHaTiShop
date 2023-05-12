package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.bean.User;
import vn.edu.hcmuaf.fit.services.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "changePassword", value = "/changePassword")
public class ChangePasswordController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        UserService userService = new UserService();
        if (user != null) {
            String oldPassword = userService.hashPassword((String) request.getParameter("password-old"));
            String newPassword = request.getParameter("password-new");
            String comfirmPassword = request.getParameter("password-new-confirm");

            boolean checkOldPassword = userService.checkPassword(oldPassword, user.getEmail());
            boolean checkComfirmPassword = newPassword.equals(comfirmPassword);
            if (oldPassword != null && newPassword != null && comfirmPassword != null
                    && checkOldPassword
                    && checkComfirmPassword) {
                userService.update(user);
                userService.logChangePassword(user.getId(),"User", user.getId(), request.getRemoteAddr());
                session.setAttribute("user", user);
                response.sendRedirect("account");
            } else {
                request.setAttribute("erorr_changePassword", "Mật khẩu cũ không đúng hoặc mật khẩu mới không khớp");
                request.getRequestDispatcher("changePassword").forward(request, response);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
