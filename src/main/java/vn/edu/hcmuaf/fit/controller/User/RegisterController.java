package vn.edu.hcmuaf.fit.controller.User;

import vn.edu.hcmuaf.fit.bean.User;
import vn.edu.hcmuaf.fit.services.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "Register", value = "/register")
public class RegisterController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("./login-register.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        UserService userService = new UserService();
        String username = request.getParameter("username");
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");

        User user = new User(0, username, name, "", phone, email, 0, "");
        if (!userService.checkUsername(user)) {
            // tạo tài khoản mới
            userService.insert(user, password);
            // đăng nhập
            user = userService.login(username, password);
            // ghi vào log

            userService.logUser(user.getId(), "user", user.getId(), 0);

            HttpSession session = request.getSession(true);
            session.setAttribute("user", user);
            session.setMaxInactiveInterval(24 * 60 * 60);
            response.getWriter().write("2");
        } else {
            request.setAttribute("error_register", "Tên đăng nhập đã được sử dụng");
            response.getWriter().write("1");
        }

    }
}
