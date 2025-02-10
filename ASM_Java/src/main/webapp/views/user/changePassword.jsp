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

        .change-password-container {
            max-width: 600px;
            margin: 20px auto;
            padding: 20px;
            height: 280px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .change-password-header {
            background-color: #f8f8f8;
            padding: 10px;
            margin: -20px -20px 20px -20px;
            border-bottom: 1px solid #ddd;
        }

        .change-password-header h2 {
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
            margin-bottom: 8px;
            color: #333;
            font-weight: bold;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
        }

        input[type="text"]:focus,
        input[type="password"]:focus {
            outline: none;
            border-color: #ff7f50;
            box-shadow: 0 0 5px rgba(255, 127, 80, 0.2);
        }

        .btn-change {
            background-color: #ff7f50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            float: right;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s ease;
        }

        .btn-change:hover {
            background-color: #ff6b3d;
        }
    </style>
</head>
<body>
    <div class="change-password-container">
        <div class="change-password-header">
            <h2>CHANGE PASSWORD</h2>
        </div>
        <form action="/ASM_Java/changePassword" method="POST">

            <div class="form-grid">
                <div class="form-group">
                    <label for="username">USERNAME?</label>
                    <input type="text" id="username" name="username" required>
                </div>
                <div class="form-group">
                    <label for="current-password">CURRENT PASSWORD?</label>
                    <input type="password" id="current-password" name="current-password" required>
                </div>
                <div class="form-group">
                    <label for="new-password">NEW PASSWORD?</label>
                    <input type="password" id="new-password" name="password" required>
                </div>
                <div class="form-group">
                    <label for="confirm-password">CONFIRM NEW PASSWORD?</label>
                    <input type="password" id="confirm-password" name="confirm-password" required>
                </div>
            </div>
            <button type="submit" class="btn-change">Change</button>
        </form>
    </div>
</body>
</html>
