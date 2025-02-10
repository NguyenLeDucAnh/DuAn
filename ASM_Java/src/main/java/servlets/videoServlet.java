package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import entity.Video;
import dao.VideoDAO;
import impl.VideoDAOImpl;

import entity.Favorite;
import dao.FavoriteDAO;
import impl.FavoriteDAOImpl;

/**
 * Servlet implementation class videoServlet
 */
@WebServlet({"/video/watch/*"})
public class videoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public videoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 String videoId = request.getPathInfo(); // e.g., /9_JV3fyPv64
	        if (videoId != null && videoId.startsWith("/")) {
	            videoId = videoId.substring(1); // Remove leading "/"
	        }
		 System.out.print(videoId);
	        VideoDAO videoDAO = new VideoDAOImpl();
	        Video video = videoDAO.findById(videoId);
	        video.setViews(video.getViews()+1);
	        videoDAO.update(video);
	        List<Video> top5 = new ArrayList<>();
	        top5 = videoDAO.getTop5MostLikedVideos();
	        if (video != null) {
	            // Pass video details to the JSP
	            request.setAttribute("video", video);
	            request.setAttribute("top5", top5);
	            request.setAttribute("page", "user/video.jsp");
	            request.getRequestDispatcher("/views/userPageLayout.jsp").forward(request, response);
	        } else {
	            // Handle video not found
	            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Video not found.");
	        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		FavoriteDAO fdao = new FavoriteDAOImpl();
		
		String videoId = request.getPathInfo(); // e.g., /9_JV3fyPv64
        if (videoId != null && videoId.startsWith("/")) {
            videoId = videoId.substring(1); // Remove leading "/"
        }
        
		doGet(request, response);
	}

}
