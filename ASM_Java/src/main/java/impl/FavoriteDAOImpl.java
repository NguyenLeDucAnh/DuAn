package impl;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

import java.util.List;

import dao.FavoriteDAO;
import entity.Favorite;
import entity.Video;
import utils.XJPA;

public class FavoriteDAOImpl implements FavoriteDAO {

    @PersistenceContext
    private EntityManagerFactory factory;
    private EntityManager em;

    public FavoriteDAOImpl() {
        em = XJPA.getEntityManager();
    }

    @Override
    public List<Favorite> findAll() {
        String jpql = "SELECT f FROM Favorite f";
        return em.createQuery(jpql, Favorite.class).getResultList();
    }

    @Override
    public Favorite findById(int id) {
        return em.find(Favorite.class, id);
    }

    @Override
    public void create(Favorite favorite) {
        EntityTransaction transaction = null;
        try {
            transaction = em.getTransaction();
            transaction.begin();

            // Check if the favorite already exists
            String jpql = "SELECT f FROM Favorite f WHERE f.user.id = :userId AND f.video.id = :videoId";
            List<Favorite> existingFavorites = em.createQuery(jpql, Favorite.class)
                                                 .setParameter("userId", favorite.getUser().getId())
                                                 .setParameter("videoId", favorite.getVideo().getId())
                                                 .getResultList();

            if (existingFavorites.isEmpty()) {
                em.persist(favorite);  // Persist only if not already liked
            } else {
                // Optionally, update an existing Favorite (e.g., change like date)
                Favorite existingFavorite = existingFavorites.get(0);
                existingFavorite.setLikeDate(favorite.getLikeDate()); // Example: Update the like date
                em.merge(existingFavorite);  // Merge to update the existing record
            }

            em.flush();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }


    @Override
    public void update(Favorite favorite) {
        EntityTransaction transaction = em.getTransaction();
        try {
            transaction.begin();
            em.merge(favorite);
            transaction.commit();
        } catch (Exception e) {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            throw e;
        }
    }

    @Override
    public List<Favorite> findByUserId(int userId) {
        String jpql = "SELECT f FROM Favorite f WHERE f.user.id = :userId";
        return em.createQuery(jpql, Favorite.class)
                 .setParameter("userId", userId)
                 .getResultList();
    }

    @Override
    @Transactional
    public void deleteByUserIdAndVideoId(String userId, String videoId) {
        EntityTransaction transaction = em.getTransaction();
        try {
            transaction.begin();
            
            // Construct JPQL query to remove the favorite
            String jpql = "DELETE FROM Favorite f WHERE f.user.id = :userId AND f.video.id = :videoId";
            em.createQuery(jpql)
              .setParameter("userId", userId)
              .setParameter("videoId", videoId)
              .executeUpdate();
              
            transaction.commit();
        } catch (Exception e) {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            throw e;
        }
    }


    @Override
    public void deleteById(int id) {
        EntityTransaction transaction = em.getTransaction();
        try {
            transaction.begin();
            Favorite favorite = findById(id);
            if (favorite != null) {
                em.remove(favorite);
            }
            transaction.commit();
        } catch (Exception e) {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            throw e;
        }
    }
}
