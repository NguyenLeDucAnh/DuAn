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

        .registration-container {
            max-width: 600px;
            margin: 20px auto;
            padding: 20px;
            height: 330px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .registration-header {
            background-color: #f8f8f8;
            padding: 10px;
            margin: -20px -20px 20px -20px;
            border-bottom: 1px solid #ddd;
        }

        .registration-header h2 {
            margin: 0;
            color: #333;
            font-size: 20px;
        }

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
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
        input[type="password"],
        input[type="email"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
        }

        input[type="text"]:focus,
        input[type="password"]:focus,
        input[type="email"]:focus {
            outline: none;
            border-color: #ff7f50;
            box-shadow: 0 0 5px rgba(255, 127, 80, 0.2);
        }

        .btn-signup {
            background-color: #ff7f50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            float: right;
            margin-top: 22px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s ease;
        }

        .btn-signup:hover {
            background-color: #ff6b3d;
        }
    </style>
</head>
<body>
    <div class="registration-container">
        <div class="registration-header">
            <h2>REGISTRATION</h2>
        </div>
        <!-- Aligning the form with the registerServlet -->
        <form action="/ASM_Java/registerServlet" method="post">
            <div class="form-grid">
                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" required>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" required>
                </div>
                <div class="form-group">
                    <label for="confirmPassword">Confirm Password</label>
                    <input type="password" id="confirmPassword" name="confirmPassword" required>
                </div>
                <div class="form-group">
                    <label for="email">Email Address</label>
                    <input type="email" id="email" name="email" required>
                </div>
                <div class="form-group">
                    <label for="fullname">Full Name</label>
                    <input type="text" id="fullname" name="fullname" required>
                </div>
                <div class="form-group">
                	<button type="submit" class="btn-signup">Sign Up</button>
                </div>
            </div>
            
        </form>
    </div>
</body>
</html>
