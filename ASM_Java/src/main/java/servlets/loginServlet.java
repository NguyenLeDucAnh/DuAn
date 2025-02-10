package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import impl.UserDAOImpl;
import entity.User;
import dao.UserDAO;

/**
 * Servlet implementation class loginServlet
 */
@WebServlet({"/user/login"})
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setAttribute("page", "user/login.jsp");
        request.getRequestDispatcher("/views/userPageLayout.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.print("loginServlet Posting...\n");
		String username = request.getParameter("username");
		 String password = request.getParameter("password");
		 UserDAO dao = new UserDAOImpl();
		 User user = dao.findById(username);
		 if (user == null) {
	            request.setAttribute("error", "Sai username");
	    		request.setAttribute("page", "user/login.jsp");
	            request.getRequestDispatcher("/views/userPageLayout.jsp").forward(request, response);

	            return;
	        }
		 if (!user.getPassword().equals(password)) {
	            request.setAttribute("error", "Sai password");
	    		request.setAttribute("page", "user/login.jsp");
	            request.getRequestDispatcher("/views/userPageLayout.jsp").forward(request, response);

	            return;
	        }
		 HttpSession session = request.getSession();
	        session.setAttribute("user", user.getId());
	        String role = "user";
	        if(user.getAdmin()) {
	        	role = "admin";
	        }
	        session.setAttribute("role", role);
	        if(user.getAdmin()==true) {
		        response.sendRedirect("/ASM_Java/adminServlet");
	        }else
	        	response.sendRedirect("/ASM_Java/UserServlet");
            //request.getRequestDispatcher("/UserServlet").forward(request, response);

		//doGet(request, response);
	}

}
