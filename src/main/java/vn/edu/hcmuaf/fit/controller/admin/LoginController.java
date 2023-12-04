package vn.edu.hcmuaf.fit.controller.admin;

import vn.edu.hcmuaf.fit.bean.Admin;
import vn.edu.hcmuaf.fit.services.AdminService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.Timer;
import java.util.TimerTask;

@WebServlet(name = "Admin login", value = "/admin-login")
public class LoginController extends HttpServlet {

    private int loginAttempts = 0;
    private static final int MAX_LOGIN_ATTEMPTS = 15;
    private static final int LOCK_TINE_IN_MINUTES = 3;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.getRequestDispatcher("admin/login.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        AdminService adminService = new AdminService();
        String username = request.getParameter("username");
        String password = adminService.hashPassword(request.getParameter("password"));

        Admin admin = adminService.login(username, password);
        if (!(loginAttempts >= MAX_LOGIN_ATTEMPTS)) {
            if (admin == null) {
                loginAttempts++;
                if (loginAttempts >= MAX_LOGIN_ATTEMPTS) {
                    response.getWriter().write(LOCK_TINE_IN_MINUTES + " ");
                    TimerTask task = new TimerTask() {
                        public void run() {
                            loginAttempts = 0;
                        }
                    };
                    Timer timer = new Timer();
                    timer.schedule(task, LOCK_TINE_IN_MINUTES * 60 * 1000);
                } else {  // user or pass sai
                    response.getWriter().write("1");
                }
            } else {
                adminService.updateToken(admin);
                String save = request.getParameter("save");
                Cookie cAdminToken = new Cookie("tokenAdminID", admin.getToken());
                if (save != null) {
                    cAdminToken.setMaxAge(60 * 60 * 24 * 7); // 7 days
                    response.addCookie(cAdminToken);
                } else {
                    cAdminToken.setMaxAge(0);
                    cAdminToken.setValue("");
                    cAdminToken.setPath("/");
                    response.addCookie(cAdminToken);
                }
                HttpSession session = request.getSession(true);

                new AdminService().logLogin(admin.getId(),request.getRemoteAddr(),"LOGIN_WEB");
                session.setAttribute("admin", admin);
                response.getWriter().write("2");
            }
        }
    }
}
