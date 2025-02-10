<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Favorite Videos</title>
  <style>
/* General Styles */
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f4f4f4;
}

/* Container for the favorites */
.favorites-container {
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
    justify-content: center;
    padding: 20px;
}

/* Styling each video card */
.video-card {
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    width: 240px;
    text-align: center;
    padding: 15px;
    transition: transform 0.3s, box-shadow 0.3s;
}

/* Hover effect for video card */
.video-card:hover {
    transform: translateY(-10px);
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
}

/* Poster section */
.poster {
    background-color: #eaeaea;
    border-radius: 5px;
    overflow: hidden;
    height: 120px;
    display: flex;
    align-items: center;
    justify-content: center;
}

.poster img {
    max-width: 100%;
    max-height: 100%;
}

/* Video title styling */
.video-title {
    font-size: 16px;
    font-weight: bold;
    margin-top: 10px;
    color: #333;
    padding: 5px;
    background-color: #e8f5e9;
    border-radius: 4px;
    text-align: center;
}

/* Action buttons container */
.actions {
    margin-top: 15px;
    display: flex;
    flex-direction: column;
    gap: 10px;
}

/* Styling for the unlike button */
.unlike {
    background-color: #e74c3c;
    color: white;
    border: none;
    padding: 10px;
    font-weight: bold;
    border-radius: 4px;
    cursor: pointer;
    transition: background-color 0.3s;
}

.unlike:hover {
    background-color: #c0392b;
}

/* Styling for the share button */
.share {
    background-color: #3498db;
    color: white;
    border: none;
    padding: 10px;
    font-weight: bold;
    border-radius: 4px;
    cursor: pointer;
    transition: background-color 0.3s;
}

.share:hover {
    background-color: #2980b9;
}
</style>

</head>
<body>
  <div class="favorites-container">
    <c:forEach var="video" items="${userfavos}">
      <div class="video-card">
        <div class="poster">
                        <a href="${pageContext.request.contextPath}/video/watch/${video.id}" style="color:black;text-decoration:none">
          <img src="https://img.youtube.com/vi/${video.poster}/mqdefault.jpg" style="width:178px;height:120px;padding:0px">
          </a>
        </div>
        <div class="video-title">
			<a href="${pageContext.request.contextPath}/video/watch/${video.id}" style="color:black;text-decoration:none">
        		${video.title}
       	 	</a>
        </div>
        <div class="actions">
          <form action="video/unlike" method="POST">
            <input type="hidden" name="videoId" value="${video.id}" />
            <button class="unlike" type="submit">Unlike</button>
          </form>
          <button class="share">Share</button>
        </div>
      </div>
    </c:forEach>
  </div>
</body>
</html>
