package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import entity.User;
import entity.Video;
import dao.UserDAO;
import dao.VideoDAO;
import impl.UserDAOImpl;
import impl.VideoDAOImpl;

/**
 * Servlet implementation class UserManagementServlet
 */
@WebServlet({ "/admin/userManagement/*","/admin/userManagement" })
public class userManagementServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO;

    public userManagementServlet() {
        super();
        userDAO = new UserDAOImpl(); // Initialize DAO
    }

    /**
     * Handles GET requests for user listing and fetching a specific user for editing.
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	String action = "";
    	String userId = "";
    	
    	UserDAO userDAO = new UserDAOImpl();
    	List<User> list = new ArrayList<>(); // Create a list to hold users
    	list = userDAO.findAll(); // Fetch all users
    	
    	User user = list.get(0);
		request.setAttribute("user", user);
    	
    	String pathInfo = request.getPathInfo();
    	if(pathInfo!=null) {
    	String[] pathParts = pathInfo.split("/");
    	System.out.print("pathInfo: "+pathInfo +" pathLength: "+pathParts.length);
    	if(pathParts.length==3) {
    		action = pathParts[1]; // e.g., create, update, delete
        	userId = pathParts[2]; // Retrieve the user ID from the path
        	if(action.equals("delete") && userId!=""){
        		userDAO.deleteById(userId);
        	}
        	if(action.equals("edit") && userId!="") {
        		 user = userDAO.findById(userId);
        		request.setAttribute("user", user);
        	}
    	}else {
    		 user = list.get(0);
    		request.setAttribute("user", user);
    	}
    	}
    	
    	// Initialize a default User object
    	request.setAttribute("list", list); // Set the user list as a request attribute
    	System.out.print("\nLog| List.length: "+list.size());
    	// Set the page attribute and forward to the layout
    	
    	
        System.out.print("\n doGet is loading... Action: "+action+" | UserId: "+userId+"\n");
        
    	
    	request.setAttribute("page", "admin/userManagement.jsp");
    	request.getRequestDispatcher("/views/adminPageLayout.jsp").forward(request, response);

    }

    /**
     * Handles POST requests for creating, updating, and deleting users.
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pathInfo = request.getPathInfo();
        System.out.print("\n doPost is loading... PathInfo: "+pathInfo);
        if (pathInfo == null || pathInfo.equals("/")) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action.");
            return;
        }

        String[] pathParts = pathInfo.split("/");
        String action = pathParts[1]; // e.g., create, update, delete

        // Read parameters
        String userId = request.getParameter("username");
        System.out.print("UserId: "+userId);
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");

        try {
            if ("create".equals(action)) {
                // Handle user creation
            	User user = new User(username, password, email, fullname,false);
                userDAO.create(user);
                response.sendRedirect(request.getContextPath() + "/admin/userManagement");
            } else if ("save".equals(action)) {
                // Handle user update
                if (userId == null) {
                    throw new IllegalArgumentException("User ID is required for update.");
                }
                User us = new User();
                us = userDAO.findById(userId);
                User user = new User(userId, password, email, fullname,us.getAdmin());
                userDAO.update(user);
                response.sendRedirect(request.getContextPath() + "/admin/userManagement");
            } else if ("delete".equals(action)) {
                // Handle user deletion
                if (userId == null) {
                    throw new IllegalArgumentException("User ID is required for deletion.");
                }
                userDAO.deleteById(userId);
                response.sendRedirect(request.getContextPath() + "/admin/userManagement");
            } else {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Unknown action: " + action);
            }
        } catch (Exception e) {
            throw new ServletException("Error processing user management action.", e);
        }
    }
}
