package dao;

import java.util.List;
import entity.Favorite;

public interface FavoriteDAO {
    List<Favorite> findAll();
    Favorite findById(int id);
    void create(Favorite favorite);
    void update(Favorite favorite);
    void deleteById(int id);
	List<Favorite> findByUserId(int id);
	void deleteByUserIdAndVideoId(String userId, String videoId);
}
