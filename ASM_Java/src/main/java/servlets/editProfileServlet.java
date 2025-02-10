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

/**
 * Servlet implementation class editProfile
 */
@WebServlet({"/user/edit","/updateAccount"})
public class editProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public editProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.print("editProfileServlet is Getting...!");
		HttpSession sess = request.getSession();
		String us = (String)sess.getAttribute("user");
    	UserDAO userdao = new UserDAOImpl();
    	User user = new User();
    	if(us!=null) {
    		user = userdao.findById(us);
    		request.setAttribute("user", user); 
    	}
        request.getRequestDispatcher("/views/user/updateAccount.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.print("editProfileServlet is Getting...!");
		HttpSession sess = request.getSession();
		String us = (String)sess.getAttribute("user");
		String role = (String)sess.getAttribute("role");
		User users = new User();
		UserDAO userdaoo = new UserDAOImpl();
		if(us!=null) {
    		users = userdaoo.findById(us);
    		
    	}
		System.out.print("\neditProfileServlet is Posting...!\n");
		String username = request.getParameter("username");
        String password = request.getParameter("password");
        String fullname = request.getParameter("fullname");
        System.out.print(fullname);
        String email = request.getParameter("email");
        
        UserDAO userdao = new UserDAOImpl();
        if(password!=null && fullname!=null && email !=null) {
        	User user = new User();
        	user.setId(us);
        	user.setPassword(password);
        	user.setFullname(fullname);
        	user.setEmail(email);
        	user.setAdmin(users.getAdmin());
        	
        	System.out.println("ID: " + user.getId());
        	System.out.println("Password: " + user.getPassword());
        	System.out.println("Fullname: " + user.getFullname());
        	System.out.println("Email: " + user.getEmail());
        	System.out.println("Admin: " + user.getAdmin());

        	userdao.update(user);
        	request.setAttribute("status", "Cập nhật thông tin thành công!");
        }else {
        	request.setAttribute("status", "Điền đầy đủ thông tin!!!");
        }
        request.setAttribute("page", "user/login.jsp");
        if(role.equals("user")) {
        	request.getRequestDispatcher("/views/userPageLayout.jsp").forward(request, response);
        } else {
        	request.getRequestDispatcher("/views/adminPageLayout.jsp").forward(request, response);
        }
        
	}

}
