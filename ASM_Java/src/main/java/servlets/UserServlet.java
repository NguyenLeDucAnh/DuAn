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

import entity.Video;
import dao.VideoDAO;
import impl.VideoDAOImpl;

import entity.User;
import dao.UserDAO;
import impl.UserDAOImpl;



/**
 * Servlet implementation class UserServlet
 */
@WebServlet({"/home","/user/favorites",
	"/user/forgotPassword",
	"/user/register","/user/changePassword",
	"/user/updateAccount"})
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uri = request.getRequestURI();
		HttpSession sess = request.getSession();
        if(uri.contains("/home")) {
        	
            request.setAttribute("page", "user/videoList.jsp");
            List<Video> vids = new ArrayList();
            VideoDAO vidDAO = new VideoDAOImpl();
            vids = vidDAO.findAll();
            /*for(Video vid:vids) {
            	vid.setPoster(URLExtractor.getVideoId(vid.getPoster()));
            	System.out.print(vid.getPoster()+"\n");
            }*/
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
            
        } else if(uri.contains("/login")) {
            request.setAttribute("page", "user/login.jsp");
        } else if(uri.contains("/logoff")) {
            request.setAttribute("page", "user/login.jsp");
        } else if(uri.contains("/forgotPassword")) {
            request.setAttribute("page", "user/forgotPassword.jsp");
        } else if(uri.contains("/register")) {
            request.setAttribute("page", "user/register.jsp");
        } else if(uri.contains("/changePassword")) {
            request.setAttribute("page", "user/changePassword.jsp");
        } else if(uri.contains("/updateAccount")) {
            request.getRequestDispatcher("/user/edit").forward(request, response);

        	
        	return;
            //request.setAttribute("page", "user/updateAccount.jsp");
        }else {
        	request.setAttribute("page", "user/videoList.jsp");
            List<Video> vids = new ArrayList();
            VideoDAO vidDAO = new VideoDAOImpl();
            vids = vidDAO.findAll();
            
            request.setAttribute("vids", vids);
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
        request.getRequestDispatcher("/views/userPageLayout.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
	}

}
