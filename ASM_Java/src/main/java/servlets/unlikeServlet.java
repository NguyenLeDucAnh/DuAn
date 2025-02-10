package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import entity.Favorite;
import dao.FavoriteDAO;
import impl.FavoriteDAOImpl;

/**
 * Servlet implementation class unlikeServlet
 */
@WebServlet({"/user/video/unlike", "/admin/video/unlike"})
public class unlikeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String videoId = request.getParameter("videoId");
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("user");

        if (userId == null || videoId == null) {
            response.sendRedirect("/login"); // Redirect to login if no user or video
            return;
        }

        // Log for debugging
        System.out.println("User: " + userId + " unliked Video: " + videoId);

        FavoriteDAO fdao = new FavoriteDAOImpl();
        try {
            // Call the DAO to remove the favorite
            fdao.deleteByUserIdAndVideoId(userId, videoId);

            // Redirect to the correct page after "unliking" based on the context
            // If the user is accessing through the admin section, redirect to admin favorites
            String redirectUrl = request.getRequestURI().contains("/admin") ? "/ASM_Java/admin/favorites" : "/ASM_Java/user/favorites";
            response.sendRedirect(redirectUrl);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error removing favorite");
        }
    }
}
