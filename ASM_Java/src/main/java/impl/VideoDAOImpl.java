package impl;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;
import jakarta.transaction.Transactional;

import java.util.List;

import dao.VideoDAO;
import entity.User;
import entity.Video;
import utils.XJPA;

public class VideoDAOImpl implements VideoDAO {

    @PersistenceContext
    private EntityManagerFactory factory;
    private EntityManager em;

    public VideoDAOImpl() {
    	 em = XJPA.getEntityManager();
    }

    @Override
    public List<Video> findAll() {
        String jpql = "SELECT v FROM Video v";
        return em.createQuery(jpql, Video.class).getResultList();
    }

    @Override
    public Video findById(String id) {
        return em.find(Video.class, id);
    }

    @Override
    @Transactional
    public void create(Video video) {
        EntityTransaction transaction = null;
        try {
            transaction = em.getTransaction(); // Lấy transaction
            transaction.begin(); // Bắt đầu transaction
            em.persist(video); // Lưu đối tượng vào cơ sở dữ liệu
            transaction.commit(); // Commit transaction
        } catch (Exception e) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback(); // Rollback nếu có lỗi
            }
            e.printStackTrace();
        }
    }


    @Override
    @Transactional
    public void update(Video video) {
        //em.merge(video);
    	
    	EntityTransaction transaction = null;
        try {
            transaction = em.getTransaction(); // Lấy transaction
            transaction.begin(); // Bắt đầu transaction
            em.merge(video); // Lưu đối tượng vào cơ sở dữ liệu
            transaction.commit(); // Commit transaction
        } catch (Exception e) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback(); // Rollback nếu có lỗi
            }
            e.printStackTrace();
        }
    	
    }

    @Override
    @Transactional
    public void deleteById(String id) {
        EntityTransaction transaction = null;
        try {
            transaction = em.getTransaction(); // Start a transaction
            transaction.begin();
            Video video = em.find(Video.class, id); // Find the entity
            if (video != null) {
                em.remove(video); // Remove the entity
            }
            transaction.commit(); // Commit transaction
        } catch (Exception e) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback(); // Rollback transaction if an error occurs
            }
            e.printStackTrace();
        }
    }

    
    public List<Video> findFavoritesByUserId(String userId) {
        String jpql = "SELECT f.video FROM Favorite f WHERE f.user.id = :userId";
        TypedQuery<Video> query = em.createQuery(jpql, Video.class);
        query.setParameter("userId", userId);

        return query.getResultList();
    }
    
    public List<Video> getTop5MostLikedVideos() {
        String jpql = "SELECT v FROM Video v JOIN v.favorites f GROUP BY v ORDER BY COUNT(f.id) DESC";
        TypedQuery<Video> query = em.createQuery(jpql, Video.class);
        query.setMaxResults(5); // Limit to 5 results
        return query.getResultList();
    }
}
