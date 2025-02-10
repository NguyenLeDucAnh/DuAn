package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONObject;

import entity.Video;
import dao.VideoDAO;
import impl.VideoDAOImpl;

/**
 * Servlet implementation class videoManagementServlet
 */
@WebServlet({"/admin/videoManagement/*"})
public class videoManagementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public videoManagementServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String videoId = request.getPathInfo();
		VideoDAO videoDAO = new VideoDAOImpl();
		List<Video> list = new ArrayList<>();
		list = videoDAO.findAll();
		Video video = new Video();
		request.setAttribute("list", list);
		if(videoId!=null) {
		if (videoId != null && videoId.startsWith("/")) {
            videoId = videoId.substring(1); // Remove leading "/"
            System.out.print(videoId + "is edit");
            video = videoDAO.findById(videoId);
            request.setAttribute("video", video);
        }
		
			
		}
		request.setAttribute("page", "admin/videoManagement.jsp");
        request.getRequestDispatcher("/views/adminPageLayout.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		 String[] pathInfo = request.getPathInfo().split("/");
		  String videoId = "";
		  String action = "";
		  /*if(pathInfo.length==3) {
			  action = pathInfo[1];
		  }else  */action = pathInfo[1];
		  System.out.print("\n1/2/3 : "+pathInfo[0]+"/"+pathInfo[1]+"/"+pathInfo[2]+"\n");
		  
		  String youtubeId = request.getParameter("youtube_id"); // Get the youtube ID
         String title = request.getParameter("title");
         String description = request.getParameter("description");
         String status = request.getParameter("status");
         
         String viewsParam = request.getParameter("views"); // Retrieves the "views" parameter as a string
         Integer views = null; // Initialize the Integer variable
         System.out.print("Views check: "+ viewsParam);
         if (viewsParam != null && !viewsParam.isEmpty()) {
             try {
                 views = Integer.parseInt(viewsParam); // Parse the string to an integer
             } catch (NumberFormatException e) {
                 System.err.println("Invalid views parameter: " + viewsParam);
                 views = 0; // Default value or handle appropriately
             }
         } else {
             views = 0; // Default value if the parameter is missing or empty
         }

         // Use the 'views' variable as needed
         System.out.println("Views: " + views);

         
         boolean stat = false;
         if ("active".equals(status)) {
             stat=true;
         }
		  VideoDAO vdao = new VideoDAOImpl();
	        
	            
	            // Example logic based on the selected status
	            
	            if ("create".equals(action)) {
	                // Handle video creation
	            	Video vid = new Video();
	            	vid.setPoster(youtubeId);
	            	vid.setId(youtubeId);
	            	vid.setTitle(title);
	            	vid.setActive(stat);
	            	vid.setViews(0);
	            	vid.setDescription(description);
	            	
	            	vdao.create(vid);
	            	System.out.println("Video created successfully in DAO.");
	            }
	            if ("update".equals(action)) {
	            	videoId = pathInfo[2];
	                System.out.print("update button is clicked"+videoId);
	            	Video vid = new Video();
	            	Video vid1 = new Video();
	            	VideoDAO dao1 = new VideoDAOImpl();
	            	vid1 = dao1.findById(youtubeId);
	            	
	            	vid.setPoster(youtubeId);
	            	vid.setId(youtubeId);
	            	vid.setTitle(title);
	            	vid.setActive(stat);
	            	vid.setViews(vid1.getViews());
	            	vid.setDescription(description);
	            	
	            	vdao.update(vid);
	            	System.out.println("Video updated successfully.");

	            } else if ("delete".equals(action)) {
	            	videoId = pathInfo[2];

	                System.out.print("delete button is clicked"+videoId);
	            	
	            	vdao.deleteById(youtubeId);
	            	System.out.println("Video deleted successfully.");
	            }
	            doGet(request,response);
	 }

}
