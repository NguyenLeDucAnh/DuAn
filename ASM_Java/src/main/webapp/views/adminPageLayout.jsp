<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        /* General Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Roboto', sans-serif;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            background-color: #f8f9fa;
        }

        /* Header */
        header {
            background-color: #4CAF50;
            color: #fff;
            padding: 1rem 2rem;
            text-align: center;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }

        header h1 {
            font-size: 2rem;
            font-weight: 700;
        }

        /* Navigation */
        nav {
            background-color: #333;
            display: flex;
            justify-content: center;
            gap: 1.5rem;
            padding: 0.8rem 2rem;
        }

        nav a {
            color: #fff;
            text-decoration: none;
            padding: 0.5rem 1rem;
            font-size: 1rem;
            font-weight: 500;
            transition: background-color 0.3s, transform 0.2s;
        }

        nav a:hover {
            background-color: #4CAF50;
            border-radius: 4px;
            transform: scale(1.05);
        }

        /* Dropdown */
        .dropdown {
            position: relative;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            top: 100%;
            right: 0;
            background-color: #fff;
            border: 1px solid #ddd;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
            border-radius: 5px;
            min-width: 200px;
            z-index: 1;
        }

        .dropdown-content a {
            color: #333;
            padding: 10px 15px;
            text-decoration: none;
            display: block;
            font-size: 0.95rem;
            border-bottom: 1px solid #eee;
            transition: background-color 0.3s;
        }

        .dropdown-content a:last-child {
            border-bottom: none;
        }

        .dropdown-content a:hover {
            background-color: #f4f4f4;
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }

        /* Main Content */
        .content {
            flex: 1;
            padding: 2rem;
            display: grid;
            gap: 2rem;
        }

        .content .card {
            background-color: #fff;
            padding: 1rem;
            border-radius: 8px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s;
        }

        .content .card:hover {
            transform: translateY(-5px);
        }

        /* Footer */
        footer {
            background-color: #4CAF50;
            color: #fff;
            text-align: center;
            padding: 1rem;
            margin-top: auto;
        }

        footer h1 {
            font-size: 1.2rem;
        }
    </style>
</head>
<body>
    <header>
        <h1>Admin Dashboard</h1>
    </header>
    <nav>
        <a href="${pageContext.request.contextPath}/admin/home">Online Entertainment</a>
        <a href="${pageContext.request.contextPath}/admin/favorites">My Favorites</a>
        <a href="${pageContext.request.contextPath}/admin/videoManagement">Video Manager</a>
        <a href="${pageContext.request.contextPath}/admin/userManagement">User Manager</a>
        <a href="${pageContext.request.contextPath}/admin/report">Report</a>
        <div class="dropdown">
            <a href="#">My Account (${username})</a>
            <div class="dropdown-content">
                <a href="${pageContext.request.contextPath}/user/login">Login</a>
                <a href="${pageContext.request.contextPath}/user/forgotPassword">Forgot Password</a>
                <a href="${pageContext.request.contextPath}/register">Registration</a>
                <a href="${pageContext.request.contextPath}/user/logoff">Logoff</a>
                <a href="${pageContext.request.contextPath}/user/changePassword">Change Password</a>
                <a href="${pageContext.request.contextPath}/user/updateAccount">Edit Profile</a>
            </div>
        </div>
    </nav>
    <div class="content">
        <jsp:include page="${page}"></jsp:include>
    </div>
    <footer>
        <h1>Footer Content</h1>
    </footer>
</body>
</html>
