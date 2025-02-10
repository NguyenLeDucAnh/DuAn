package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import dao.UserDAO;
import dao.VideoDAO;
import entity.User;
import entity.Video;
import impl.UserDAOImpl;
import impl.VideoDAOImpl;

/**
 * Servlet implementation class adminServlet
 */
@WebServlet({"/admin","/admin/home","/admin/videoManager","/admin/userManager","/admin/report","/admin/favorites"})

public class adminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uri = request.getRequestURI();
		HttpSession sess = request.getSession();
        if(uri.contains("/home")) {
        	
            request.setAttribute("page", "user/videoList.jsp");
            List<Video> vids = new ArrayList();
            VideoDAO vidDAO = new VideoDAOImpl();
            vids = vidDAO.findAll();
            request.setAttribute("vids", vids);
            
        } else if(uri.contains("/favorites")) {
        	if(sess.getAttribute("user")==null) {
        		System.out.print("\nUser is not login\n");
        		response.sendRedirect("/ASM_Java/user/login");
            	return;
        	}else {
            	
        	}
            request.setAttribute("page", "user/favorites.jsp");
            List<Video> favos = new ArrayList();
            VideoDAO favodao = new VideoDAOImpl();
            favos = favodao.findFavoritesByUserId(sess.getAttribute("user").toString());
            request.setAttribute("userfavos", favos);
            
        } else if(uri.contains("/favorites")) {
        	if(sess.getAttribute("user")==null) {
        		System.out.print("\nUser is not login\n");
        		response.sendRedirect("/ASM_Java/user/login");
            	return;
        	}else {
            	
        	}
            request.setAttribute("page", "user/favorites.jsp");
            List<Video> favos = new ArrayList();
            VideoDAO favodao = new VideoDAOImpl();
            favos = favodao.findFavoritesByUserId(sess.getAttribute("user").toString());
            request.setAttribute("userfavos", favos);
            
        } else if(uri.contains("admin/videoManager")) {
            request.setAttribute("page", "admin/videoManagement.jsp");
            request.getRequestDispatcher("/admin/videoManagement/");
        } else if(uri.contains("admin/userManager")) {
        	request.setAttribute("page", "admin/userManagement.jsp");
        } else if(uri.contains("admin/reportManager")) {
            request.setAttribute("page", "admin/reportManager.jsp");
        } else {

        }

		if(request.getSession() != null) {
		        	
		        	String us = (String)sess.getAttribute("user");
		        	if(us == null) {
		        		System.out.print("Web loading...! [user is NULL]");
		        	}else {
			        	System.out.print(us);
			        	UserDAO userdao = new UserDAOImpl();
			        	User user = userdao.findById(us);
			        	String username = user.getFullname();
			        	request.setAttribute("username", username);
			        	System.out.print(sess.getAttribute("user")+" is logged\n");
		        	}
		        }
        
        request.getRequestDispatcher("/views/adminPageLayout.jsp").forward(request, response);
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
