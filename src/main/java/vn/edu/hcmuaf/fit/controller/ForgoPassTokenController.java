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
import java.sql.Timestamp;

@WebServlet(name = "ForgoPassTokenController", value = "/ForgoPassTokenController")
public class ForgoPassTokenController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Timestamp current = new Timestamp(System.currentTimeMillis());
        String tokenCode = (String) request.getParameter("token");

        TokenFPService service = new TokenFPService();
        UserService userService = new UserService();

        Token token = null;
        try {
            token = service.getByToken(tokenCode);
        } catch (SQLException e) {
            token = null;
            throw new RuntimeException(e);
        }
        if(token != null){
            if(service.checkTimeToken(current, token.getSend_at())){
                User user = userService.getById(token.getUser_id());
                request.setAttribute("token", token);
                request.setAttribute("user", user);
                request.getRequestDispatcher("/resetPassword.jsp").forward(request,response);
            } else {
                response.sendRedirect("ErrorLink.html");
            }
        } else {
            response.sendRedirect("ErrorLink.html");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
