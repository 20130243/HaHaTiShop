package vn.edu.hcmuaf.fit.controller.User;

import vn.edu.hcmuaf.fit.bean.Token;
import vn.edu.hcmuaf.fit.bean.User;
import vn.edu.hcmuaf.fit.services.TokenFPService;
import vn.edu.hcmuaf.fit.services.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "ResetPasswordController", value = "/resetPassword")
public class ResetPasswordController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserService userService = new UserService();
        TokenFPService tokenFPService = new TokenFPService();
        HttpSession session = request.getSession();

        String newPassword = (String) request.getParameter("password-new");
        String confirmPassword = (String) request.getParameter("password-new-confirm");

        String userId = request.getParameter("user");
        String tokenId = request.getParameter("token");
        try {
            User user = userService.getById(Integer.parseInt(userId));
            Token token = tokenFPService.getById(Integer.parseInt(tokenId));
            if (user != null && token != null && newPassword != null && confirmPassword != null && newPassword.equals(confirmPassword)) {
                userService.updatePassword(user, newPassword);
                tokenFPService.delete(token.getId());
                session.setAttribute("user", user);
                response.sendRedirect("account");
            } else {
                request.setAttribute("erorr_changePassword", "Mật khẩu mới không khớp");
                request.getRequestDispatcher("resetPassword").forward(request, response);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
