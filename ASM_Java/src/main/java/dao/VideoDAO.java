package dao;

import java.util.List;
import entity.Video;

public interface VideoDAO {
    List<Video> findAll();
    Video findById(String id);
    void create(Video video);
    void update(Video video);
    void deleteById(String id);
	List<Video> findFavoritesByUserId(String string);
	List<Video> getTop5MostLikedVideos();
}

