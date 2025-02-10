<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
    <style>
        /* styles.css */
body {
  font-family: Arial, sans-serif;
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

.container {
  display: flex;
  padding: 20px;
}

.main-video {
  flex: 3;
  border: 1px solid #ccc;
  padding: 10px;
  margin-right: 20px;
}

.video {
  height: 500px;
  background-color: #f9f9f9;
  border: 1px solid #ccc;
  display: flex;
  align-items: center;
  justify-content: center;
  font-weight: bold;
  font-size: 18px;
}

.video-info {
  margin-top: 10px;
}

.video-title {
  background-color: #e8f5e9;
  padding: 5px;
  font-weight: bold;
}

.description {
  margin: 10px 0;
}

.actions {
  display: flex;
  gap: 10px;
}

.like, .share {
  padding: 8px 16px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-weight: bold;
  color: #fff;
}

.like {
  background-color: #4285f4;
}

.share {
  background-color: #fb8c00;
}

.sidebar {
  flex: 1;
}

.video-item {
  display: flex;
  align-items: center;
  margin-bottom: 10px;
  border: 1px solid #ccc;
  padding: 5px;
}

.poster {
  flex: 1;
  height: 60px;
  background-color: #e0f7fa;
  display: flex;
  align-items: center;
  justify-content: center;
  font-weight: bold;
}

.title {
  flex: 2;
  padding-left: 10px;
  font-weight: bold;
  text-decoration: underline;
}

    </style>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Video Layout</title>
  <link rel="stylesheet" href="styles.css">
</head>
<body>
  <div class="container">
    <div class="main-video">
      <div class="video">
      	<iframe 
        width="1078" 
        height="500" 
        src="https://www.youtube.com/embed/${video.id}" 
        title="YouTube video player" 
        frameborder="0" 
        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
        allowfullscreen>
    </iframe>
      </div>
      <div class="video-info">
        <h3 class="video-title">${video.title}</h3>
        <p class="description">${video.description}</p>
        <p class="views">Views: ${video.views}</p>
        <div class="actions">
          <form action="${pageContext.request.contextPath}/video/like" method="post">
			        <input type="hidden" name="videoId" value="${video.id}" />
			        <input type="hidden" name="videoPost" value="${video.id}" />
			        <button class="like" type="submit">Like</button>
    			</form>
          <button class="share">Share</button>
          <button class="like" style="background-color: red">Report</button>
        </div>
      </div>
    </div>
    <div class="sidebar">
      <c:forEach var="video" items="${top5}">
      <c:if test="${video.active}">
    <div class="video-item">
        <div class="poster"><img src="https://img.youtube.com/vi/${video.id}/mqdefault.jpg" style="width:90px;height:60px;padding:0px"></div>
        <div class="title"><a href="${pageContext.request.contextPath}/video/watch/${video.poster}" style="color:black;text-decoration:none">${video.title}</a></div>
    </div>
    </c:if>
</c:forEach>
    </div>
  </div>
</body>
</html>
