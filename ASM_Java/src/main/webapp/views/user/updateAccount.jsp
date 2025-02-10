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

        .edit-profile-container {
            max-width: 600px;
            margin: 20px auto;
            padding: 20px;
            height: 380px;
            border: 1px solid #ddd;
            border-radius: 4px;
            padding-top: 30px;
            padding-bottom: 40px;
        }

        .edit-profile-header {
            background-color: #f8f8f8;
            padding: 15px;
            margin: -30px -20px 30px -20px;
            border-bottom: 1px solid #ddd;
        }

        .edit-profile-header h2 {
            margin: 0;
            color: #333;
            font-size: 20px;
        }

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 25px;
            margin-bottom: 30px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 10px;
            color: #333;
            font-weight: bold;
        }

        input[type="text"],
        input[type="password"],
        input[type="email"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #FF8C69;
            border-radius: 4px;
            font-size: 14px;
            height: 40px;
            background-color: #fff;
        }

        input[type="text"]:focus,
        input[type="password"]:focus,
        input[type="email"]:focus {
            outline: none;
            border-color: #ff7f50;
            box-shadow: 0 0 5px rgba(255, 127, 80, 0.2);
        }

        .btn-update {
            background-color: #ff7f50;
            color: white;
            padding: 12px 24px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            float: right;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s ease;
        }

        .btn-update:hover {
            background-color: #ff6b3d;
        }
    </style>
</head>
<body>
    <div class="edit-profile-container">
        <div class="edit-profile-header">
            <h2>EDIT PROFILE</h2>
        </div>
        <form action="edit" method="post">
            <div class="form-grid">
                <div class="form-group">
                    <label for="username">USERNAME</label>
                    <input type="text" id="username" name="username" value="${user.id}" disabled>
                </div>
                <div class="form-group">
                    <label for="password">PASSWORD</label>
                    <input type="password" id="password" name="password" value="${user.password}" required>
                </div>
                <div class="form-group">
                    <label for="fullname">FULLNAME</label>
                    <input type="text" id="fullname" name="fullname" value="${user.fullname}" required>
                </div>
                <div class="form-group">
                    <label for="email">EMAIL ADDRESS</label>
                    <input type="email" id="email" name="email" value="${user.email}" required>
                </div>
                <div class="status">${status}</div>
            </div>
            <button type="submit" class="btn-update">Update</button>
        </form>
    </div>
</body>
</html>