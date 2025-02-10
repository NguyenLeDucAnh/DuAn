<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Management</title>
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
        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }
        label {
            display: block;
            margin-bottom: 8px;
            color: #333;
            font-weight: bold;
        }
        input[type="text"],
        input[type="password"],
        input[type="email"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #FF8C69;
            border-radius: 4px;
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
        .user-count {
            float: left;
            margin-top: 15px;
            color: #666;
        }
        .edit-link {
            color: blue;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Tabs -->
        <div class="tabs">
            <div class="tab active" onclick="showTab('user-edition')">User Edition</div>
            <div class="tab" onclick="showTab('user-list')">User List</div>
        </div>

        <!-- User Edition Form -->
        <div id="user-edition" class="tab-content" style="display: block;">
            <form action="${pageContext.request.contextPath}/admin/userManagement/save" method="post">
                <div class="form-container">
                    <div class="form-grid">
                        <div>
                            <label>Username</label>
                            
                            <input type="text" name="username" value="${user.id}">
                            
                        </div>
                        <div>
                            <label>Password</label>
                            <input type="password" name="password" value="${user.password}">
                        </div>
                        <div>
                            <label>Fullname</label>
                            <input type="text" name="fullname" value="${user.fullname}">
                        </div>
                        <div>
                            <label>Email Address</label>
                            <input type="email" name="email" value="${user.email}">
                        </div>
                    </div>
                    <div class="button-group">
                        <button type="submit" class="btn btn-create">Save</button>
                        <button type="button" class="btn btn-update" onclick="resetForm()">Reset</button>
                    </div>
                </div>
            </form>
        </div>

        <!-- User List -->
        <div id="user-list" class="tab-content" style="display: none;">
            <table>
                <thead>
                    <tr>
                        <th>Username</th>
                        <th>Password</th>
                        <th>Fullname</th>
                        <th>Email</th>
                        <th>Role</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="list" items="${list}">
                        <tr>
                            <td>${list.id}</td>
                            <td>${list.password}</td>
                            <td>${list.fullname}</td>
                            <td>${list.email}</td>
                            <td>${list.admin}</td>
                            <td>
                                <p><a href="${pageContext.request.contextPath}/admin/userManagement/edit/${list.id}" class="edit-link">Edit</a>
                                 | 
                                <a href="${pageContext.request.contextPath}/admin/userManagement/delete/${list.id}" class="edit-link">Delete</a></p>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <div class="user-count">
                Total Users: <c:out value="${fn:length(list)}" />
            </div>
        </div>
    </div>

    <script>
        function showTab(tabId) {
            document.querySelectorAll('.tab-content').forEach(tab => tab.style.display = 'none');
            document.querySelectorAll('.tab').forEach(tab => tab.classList.remove('active'));
            document.getElementById(tabId).style.display = 'block';
            document.querySelector(`.tab[onclick="showTab('${tabId}')"]`).classList.add('active');
        }
        
        function resetForm() {
            const form = document.querySelector('#user-edition form');
            form.reset(); // Resets form to default values.

            // Optional: Manually set default values if they're dynamically populated.
            form.username.value = "";
            form.password.value = "";
            form.fullname.value = "";
            form.email.value = "";
        }

        
    </script>
</body>
</html>
