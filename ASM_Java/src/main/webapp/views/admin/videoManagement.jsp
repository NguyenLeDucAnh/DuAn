<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
        }

        .tabs {
            display: flex;
            margin-bottom: 20px;
        }

        .tab {
            padding: 10px 20px;
            border: 1px solid #FF8C69;
            cursor: pointer;
            background: white;
        }

        .tab.active {
            background: #ff7f50;
            color: white;
        }

        .form-container {
            border: 1px solid #FF8C69;
            padding: 20px;
            margin-bottom: 20px;
        }

        .poster-container {
            width: 200px;
            height: 200px;
            border: 1px solid #FF8C69;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #f8f8f8;
        }

        .form-grid {
            display: grid;
            grid-template-columns: 200px 1fr;
            gap: 20px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            color: #333;
            font-weight: bold;
        }

        input[type="text"],
        input[type="number"],
        textarea {
            width: 100%;
            padding: 8px;
            border: 1px solid #FF8C69;
            border-radius: 4px;
        }

        .radio-group {
            display: flex;
            gap: 20px;
            margin-top: 10px;
        }

        .radio-label {
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .button-group {
            display: flex;
            gap: 10px;
            justify-content: flex-end;
            margin-top: 20px;
        }

        .btn {
            padding: 8px 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            color: white;
        }

        .btn-create { background-color: #4CAF50; }
        .btn-update { background-color: #2196F3; }
        .btn-delete { background-color: #f44336; }
        .btn-reset { background-color: #9e9e9e; }
        .btn-nav { background-color: #9e9e9e; }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #f8f8f8;
        }

        .pagination {
            display: flex;
            justify-content: flex-end;
            gap: 5px;
            margin-top: 10px;
        }

        .video-count {
            float: left;
            margin-top: 15px;
        }

        .edit-link {
            color: blue;
            text-decoration: none;
        }

        textarea {
            resize: vertical;
            min-height: 100px;
        }
    </style>
</head>
<body>
   <div class="container">
    <!-- Tabs -->
    <div class="tabs">
        <div class="tab active" data-tab="form-section">VIDEO EDITION</div>
        <div class="tab" data-tab="table-section">VIDEO LIST</div>
    </div>

    <!-- Form Section -->
    <div id="form-section" class="section active">
        <form action="${pageContext.request.contextPath}/admin/videoManagement/save" method="post">
            <div class="form-container">
                <div class="form-grid">
                    <div class="left-column">
                        <div class="poster-container">
                            <img src="https://img.youtube.com/vi/${video.id}/mqdefault.jpg" style="width:195px;padding:0px">
                        </div>
                    </div>
                    <div class="right-column">
                        <div class="form-group">
                            <label>YOUTUBE ID</label>
                            <input type="text" name="youtube_id" id="youtube_id" value="${video.id}">
                        </div>
                        <div class="form-group">
                            <label>VIDEO TITLE</label>
                            <input type="text" name="title" id="title" value="${video.title}">
                        </div>
                        <div class="form-group">
                            <label>VIEW COUNT</label>
                            <input type="text" name="views" id="views" value="${video.views}" disabled>
                        </div>
                        <div class="form-group">
                            <div class="radio-group">
                                <label class="radio-label">
                                    <input type="radio" name="status" value="active" checked> ACTIVE
                                </label>
                                <label class="radio-label">
                                    <input type="radio" name="status" value="inactive"> INACTIVE
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label>DESCRIPTION</label>
                    <textarea name="description">${video.description}</textarea>
                </div>
                <div class="button-group">
                <button type="submit" class="btn btn-create" formaction="${pageContext.request.contextPath}/admin/videoManagement/create/new">Create</button>
                <button type="submit" class="btn btn-update" formaction="${pageContext.request.contextPath}/admin/videoManagement/update/${video.id}">Update</button>
                <button type="submit" class="btn btn-delete" formaction="${pageContext.request.contextPath}/admin/videoManagement/delete/${video.id}">Delete</button>
                <button type="button" class="btn btn-reset" onclick="resetForm()">Reset</button>
            </div>
            </div>
        </form>
    </div>

    <!-- Table Section -->
    <div id="table-section" class="section">
        <table>
            <thead>
                <tr>
                    <th>Youtube Id</th>
                    <th>Video Title</th>
                    <th>View Count</th>
                    <th>Status</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="item" items="${list}">
                    <tr>
                        <td>${item.id}</td>
                        <td>${item.title}</td>
                        <td>${item.views}</td>
                        <td>${item.active}</td>
                        <td><a href="${pageContext.request.contextPath}/admin/videoManagement/${item.id}" class="edit-link">Edit</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <div class="video-count">
            <c:if test="${not empty list}">
                ${fn:length(list)} Videos
            </c:if>
        </div>
        <div class="pagination">
            <button class="btn btn-nav">|<</button>
            <button class="btn btn-nav"><<</button>
            <button class="btn btn-nav">>></button>
            <button class="btn btn-nav">>|</button>
        </div>
    </div>
</div>

<script>
    // Tab functionality
    const tabs = document.querySelectorAll('.tab');
    const sections = document.querySelectorAll('.section');

    tabs.forEach(tab => {
        tab.addEventListener('click', () => {
            // Remove 'active' class from all tabs and sections
            tabs.forEach(t => t.classList.remove('active'));
            sections.forEach(s => s.classList.remove('active'));

            // Add 'active' to the clicked tab and the corresponding section
            tab.classList.add('active');
            const targetSection = document.getElementById(tab.getAttribute('data-tab'));
            targetSection.classList.add('active');
        });
    });

    // Form reset functionality
    function resetForm() {
        document.querySelector('form').reset();
    }
</script>

<style>
    .section {
        display: none;
    }

    .section.active {
        display: block;
    }

    .tab.active {
        background: #ff7f50;
        color: white;
    }
</style>


</html>