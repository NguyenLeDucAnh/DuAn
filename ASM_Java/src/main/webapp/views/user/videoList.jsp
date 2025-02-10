<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Video Grid</title>
    <style>

        /* Grid container */
        .video-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            margin-bottom: 20px;
        }

        /* Individual video card */
        .video-card {
            border: 1px solid #ddd;
            border-radius: 8px;
            overflow: hidden;
            background-color: #ffffff;
            text-align: center;
        }

        .poster {
            border: 1px solid #e0903f;
            margin: 10px;
            padding: 30px 0;
            font-size: 1.2rem;
            color: #333;
            background-color: #fff;
        }

        .title {
            font-weight: bold;
            color: #333;
            background-color: #d9e8d3;
            padding: 10px;
            text-transform: uppercase;
            font-size: 1rem;
        }

        .actions {
            display: flex;
            justify-content: center;
            gap: 10px;
            padding: 10px;
            background-color: #f4f4f4;
        }

        .button {
    padding: 5px 15px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 0.9rem;
    font-weight: bold;
    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.2); /* Adds a shadow */
    transition: transform 0.2s ease; /* Smooth effect on hover */
}

.button:hover {
    transform: translateY(-2px); /* Lifts button slightly on hover */
}

.like-button {
    background-color: #8bc34a;
    color: white;
}

.share-button {
    background-color: #ff7043;
    color: white;
}

        /* Pagination controls */
        .pagination {
            display: flex;
            gap: 5px;
            margin-top: 10px;
        }

        .pagination button {
            background-color: #aaa;
            border: none;
            padding: 5px 10px;
            border-radius: 4px;
            cursor: pointer;
            color: #fff;
            font-weight: bold;
        }

        .pagination button:hover {
            background-color: #888;
        }
    </style>
</head>
	<div class="video-grid">
        <!-- Video Card 1 -->
		<c:forEach var="video" items="${vids}">
    <c:if test="${video.active}">
        <div class="video-card">
            <div class="poster" style="padding:0px">
                <a href="${pageContext.request.contextPath}/video/watch/${video.id}" style="color:black;text-decoration:none">
                    <img src="https://img.youtube.com/vi/${video.id}/mqdefault.jpg" style="width:450px;height:230px;padding:0px">
                </a>
            </div>
            <div class="title">
                <a href="${pageContext.request.contextPath}/video/watch/${video.id}" style="color:black;text-decoration:none">
                    ${video.title}
                </a>
            </div>
            <p>Views: ${video.views}</p>
            <div class="actions">
            
                  <form action="${pageContext.request.contextPath}/video/like" method="post">
			        <input type="hidden" name="videoId" value="${video.id}" />
			        <button class="button like-button" type="submit">Like</button>
    			</form>
                <button class="button share-button">Share</button>
            </div>
        </div>
    </c:if>
</c:forEach>
 
	</div>

    <!-- Pagination Controls -->
    <div class="pagination">
        <button>&lt;|</button>
        <button>&lt;&lt;</button>
        <button>&gt;&gt;</button>
        <button>|&gt;</button>
    </div>

</html>
