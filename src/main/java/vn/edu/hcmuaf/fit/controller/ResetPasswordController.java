package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.bean.Token;
import vn.edu.hcmuaf.fit.bean.User;
import vn.edu.hcmuaf.fit.services.TokenFPService;
import vn.edu.hcmuaf.fit.services.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
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

        String userId =  request.getParameter("user");
        String tokenId = request.getParameter("token");

        Token token = null;
        User user = null;
        try {
            user = userService.getById(Integer.parseInt(userId));
            token = tokenFPService.getById(Integer.parseInt(tokenId));
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        if(user != null && token != null && newPassword != null && confirmPassword != null && newPassword.equals(confirmPassword)) {

            user.setPassword(userService.hashPassword(newPassword));
            userService.update(user);
            tokenFPService.delete(token.getId());
            session.setAttribute("user", user);
            response.sendRedirect("account");

//            System.out.println("user " + userId);
//            System.out.println("token " + tokenId);
//            System.out.println("npw " + newPassword);
//            System.out.println("cpw " + confirmPassword);
        } else {
            request.setAttribute("erorr_changePassword", "Mật khẩu mới không khớp");
            request.getRequestDispatcher("resetPassword").forward(request, response);
        }
    }
}
