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

        .forgot-password-container {
            max-width: 500px;
            margin: 20px auto;
            padding: 20px;
            height: 290px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .forgot-password-header {
            background-color: #f8f8f8;
            padding: 10px;
            margin: -20px -20px 20px -20px;
            border-bottom: 1px solid #ddd;
        }

        .forgot-password-header h2 {
            margin: 0;
            color: #333;
            font-size: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #333;
            font-weight: bold;
        }

        input[type="text"],
        input[type="email"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
        }

        input[type="text"]:focus,
        input[type="email"]:focus {
            outline: none;
            border-color: #ff7f50;
            box-shadow: 0 0 5px rgba(255, 127, 80, 0.2);
        }

        .btn-retrieve {
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

        .btn-retrieve:hover {
            background-color: #ff6b3d;
        }
    </style>
</head>
<body>
    <div class="forgot-password-container">
        <div class="forgot-password-header">
            <h2>FORGOT PASSWORD</h2>
        </div>
        <form>
            <div class="form-group">
                <label for="username">USERNAME?</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="email">EMAIL?</label>
                <input type="email" id="email" name="email" required>
            </div>
            <button type="submit" class="btn-retrieve">Retrieve</button>
        </form>
    </div>
</body>
</html>