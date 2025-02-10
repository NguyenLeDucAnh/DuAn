package servlets;

import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utils.XJPA;

import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import entity.Favorite;
import dao.FavoriteDAO;
import impl.FavoriteDAOImpl;

import entity.Video;
import dao.VideoDAO;
import impl.VideoDAOImpl;

import entity.User;
import dao.UserDAO;
import impl.UserDAOImpl;

/**
 * Servlet implementation class likeServlet
 */
@WebServlet("/video/like")
public class likeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Simulate a database of likes for demonstration purposes

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String videoId = request.getParameter("videoId");
        HttpSession sess = request.getSession();
        String role = (String)sess.getAttribute("role");
        String userId = (String)sess.getAttribute("user");
        String videoPost = (String)request.getAttribute("videoPost");
        
        System.out.print("==================="+videoPost);
        
        if(userId==null) {
        	response.sendRedirect("ASM_Java/home");
        	return;
        }
        System.out.print("\nUser: "+sess.getAttribute("user") + " like Video: "+videoId+"\n");
        Favorite fav = new Favorite();
        FavoriteDAO fdao = new FavoriteDAOImpl();
        User us = new User();
        UserDAO udao = new UserDAOImpl();
        us = udao.findById(userId);
        Video vid = new Video();
        EntityManager em = XJPA.getEntityManager();
        us = em.find(User.class, userId); // Reattach the User entity
        vid = em.find(Video.class, videoId); // Reattach the Video entity

        
        fav.setUser(us);
        fav.setVideo(vid);
        LocalDateTime now = LocalDateTime.now();
        Timestamp timestamp = Timestamp.valueOf(now);
        fav.setLikeDate(timestamp);
        
        fdao.create(fav);
        if(videoPost!=null) {
            request.getRequestDispatcher("/video/watch/videoPost").forward(request, response);
        }else if(role.equals("admin")) {
            request.getRequestDispatcher("/admin/home").forward(request, response);

        }else 
        	response.sendRedirect("/ASM_Java/home");
    	}
}
