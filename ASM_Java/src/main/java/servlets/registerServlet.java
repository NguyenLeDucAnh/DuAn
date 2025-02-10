package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import impl.UserDAOImpl;
import entity.User;
import dao.UserDAO;

/**
 * Servlet implementation class registerServlet
 */
@WebServlet({"/register"})
public class registerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public registerServlet() {
        super();
        // Default constructor
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Forward to registration page
        request.setAttribute("page", "user/register.jsp");
        request.getRequestDispatcher("/views/userPageLayout.jsp").forward(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	System.out.print("registerServlet is Posting.......");
    	String username = request.getParameter("username");
    	String fullname = request.getParameter("fullname");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String confirmPassword = request.getParameter("confirmPassword");

        if (username == null || username.trim().isEmpty()) {
            request.setAttribute("error", "Username cannot be empty");
            request.setAttribute("page", "user/register.jsp");
            request.getRequestDispatcher("/views/userPageLayout.jsp").forward(request, response);
            return;
        }

        if (password == null || password.trim().isEmpty()) {
            request.setAttribute("error", "Password cannot be empty");
            request.setAttribute("page", "user/register.jsp");
            request.getRequestDispatcher("/views/userPageLayout.jsp").forward(request, response);
            return;
        }

        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "Passwords do not match");
            request.setAttribute("page", "user/register.jsp");
            request.getRequestDispatcher("/views/userPageLayout.jsp").forward(request, response);
            return;
        }

        UserDAO dao = new UserDAOImpl();
        User existingUser = dao.findById(username);
        if (existingUser != null) {
            request.setAttribute("error", "Username already exists");
            request.setAttribute("page", "user/register.jsp");
            request.getRequestDispatcher("/views/userPageLayout.jsp").forward(request, response);
            return;
        }

        // Create and save the new user
        User newUser = new User();
        newUser.setId(username);
        newUser.setPassword(password);
        newUser.setAdmin(false); // Default role for new users
        newUser.setEmail(email);
        newUser.setFullname(fullname);
        dao.create(newUser);

        // Redirect to login page after successful registration
        request.setAttribute("success", "Registration successful! Please log in.");
        response.sendRedirect("/ASM_Java/user/login");
    }
}
