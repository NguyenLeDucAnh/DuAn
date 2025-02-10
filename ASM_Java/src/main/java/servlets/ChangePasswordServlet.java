package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import dao.UserDAO;
import entity.User;
import impl.UserDAOImpl;

@WebServlet("/changePassword")
public class ChangePasswordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ChangePasswordServlet() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("user");

        if (username == null) {
            response.sendRedirect("login.jsp"); // Redirect to login if not logged in
            return;
        }

        String currentPassword = request.getParameter("current-password");
        String newPassword = request.getParameter("password");
        String confirmPassword = request.getParameter("confirm-password");

        // Input validation
        if (currentPassword == null || newPassword == null || confirmPassword == null ||
            currentPassword.isEmpty() || newPassword.isEmpty() || confirmPassword.isEmpty()) {
            request.setAttribute("status", "All fields are required.");
            request.getRequestDispatcher("/views/user/changePassword.jsp").forward(request, response);
            return;
        }

        if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("status", "New password and confirmation do not match.");
            request.getRequestDispatcher("/views/user/changePassword.jsp").forward(request, response);
            return;
        }

        UserDAO userDAO = new UserDAOImpl();
        User user = userDAO.findById(username);

        if (user == null) {
            request.setAttribute("status", "User not found.");
            request.getRequestDispatcher("/views/user/changePassword.jsp").forward(request, response);
            return;
        }

        // Check if the current password matches
        if (!user.getPassword().equals(currentPassword)) {
            request.setAttribute("status", "Current password is incorrect.");
            request.getRequestDispatcher("/views/user/changePassword.jsp").forward(request, response);
            return;
        }

        // Update the password
        user.setPassword(newPassword);
        userDAO.update(user);

        
        if(user.getAdmin()==true) {
	        response.sendRedirect("/ASM_Java/adminServlet");
        }else
        	response.sendRedirect("/ASM_Java/UserServlet");    }
}
