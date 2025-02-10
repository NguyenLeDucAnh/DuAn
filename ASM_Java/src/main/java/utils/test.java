package utils;

import entity.Video;
import impl.VideoDAOImpl;

public class test {
	public static void main() {
		Video vid = new Video();
		VideoDAOImpl dao = new VideoDAOImpl();
		vid = dao.findById("v1");
		System.out.print(vid.getTitle());
	}
}
