<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Videos</title>
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
            background-color: #f9f9f9;
        }

        /* Header */
        header {
            background-color: #4CAF50;
            color: white;
            padding: 1rem;
            text-align: center;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }

        header h1 {
            font-size: 2rem;
            font-weight: bold;
        }

        /* Navigation */
        nav {
            background-color: #333;
            display: flex;
            justify-content: space-around;
            align-items: center;
            padding: 1rem;
        }

        nav a {
            color: #fff;
            text-decoration: none;
            font-size: 1rem;
            padding: 0.5rem 1rem;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        nav a:hover {
            background-color: #4CAF50;
        }

        /* Dropdown Menu */
        .dropdown {
            position: relative;
        }

        .dropdown a {
            cursor: pointer;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            top: 120%;
            left: 0;
            background-color: white;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
            border-radius: 5px;
            overflow: hidden;
            min-width: 200px;
        }

        .dropdown-content a {
            color: #333;
            padding: 10px;
            text-decoration: none;
            display: block;
            transition: background-color 0.3s;
        }

        .dropdown-content a:hover {
            background-color: #f1f1f1;
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }

        /* Main Content */
        .content {
            flex: 1;
            padding: 2rem;
            background-color: #f4f4f4;
        }

        /* Footer */
        footer {
            background-color: #4CAF50;
            color: white;
            text-align: center;
            padding: 1rem;
            box-shadow: 0px -4px 8px rgba(0, 0, 0, 0.1);
        }

        footer h1 {
            font-size: 1.2rem;
            font-weight: 500;
        }
    </style>
</head>
<body>

    <header>
        <h1>Video Management</h1>
    </header>

    <nav>
        <a href="${pageContext.request.contextPath}/home">Online Entertainment</a>
        <a href="${pageContext.request.contextPath}/user/favorites">My Favorites</a>
        <div class="dropdown">
            <a>My Account (${username})</a>
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
        <h1>© 2024 Online Entertainment</h1>
    </footer>

</body>
</html>
