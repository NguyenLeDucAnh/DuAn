package impl;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;
import utils.XJPA;

import java.util.List;

import dao.ShareDAO;
import entity.Share;

public class ShareDAOImpl implements ShareDAO {

    @PersistenceContext
    private EntityManagerFactory factory;
    private EntityManager em;

    public ShareDAOImpl() {
    	 em = XJPA.getEntityManager();
    }
    @Override
    public List<Share> findAll() {
        String jpql = "SELECT s FROM Share s";
        return em.createQuery(jpql, Share.class).getResultList();
    }

    @Override
    public Share findById(Long id) {
        return em.find(Share.class, id);
    }

    @Override
    @Transactional
    public void create(Share share) {
        em.persist(share);
    }

    @Override
    @Transactional
    public void update(Share share) {
        em.merge(share);
    }

    @Override
    @Transactional
    public void deleteById(Long id) {
        Share share = findById(id);
        if (share != null) {
            em.remove(share);
        }
    }
}

