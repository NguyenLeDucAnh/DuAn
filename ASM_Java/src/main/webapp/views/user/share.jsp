<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Send Video</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 20px;
      box-sizing: border-box;
    }

    .send-video-container {
      border: 1px solid #ccc;
      width: 400px;
      margin: 0 auto;
      padding: 10px;
      border-radius: 5px;
    }

    .send-video-header {
      background-color: #e8f5e9;
      font-weight: bold;
      padding: 10px;
      border-bottom: 1px solid #ccc;
    }

    .send-video-form {
      padding: 10px;
    }

    .send-video-form label {
      font-weight: bold;
      display: block;
      margin-bottom: 5px;
    }

    .send-video-form input[type="email"] {
      width: calc(100% - 20px);
      padding: 8px;
      margin-bottom: 10px;
      border: 1px solid #ccc;
      border-radius: 4px;
      font-size: 14px;
    }

    .send-button {
      background-color: #fb8c00;
      color: #fff;
      font-weight: bold;
      padding: 10px 20px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }

    .send-button:hover {
      background-color: #e57300;
    }
  </style>
</head>
<body>
  <div class="send-video-container">
    <div class="send-video-header">SEND VIDEO TO YOUR FRIEND</div>
    <form class="send-video-form">
      <label for="friend-email">YOUR FRIEND'S EMAIL?</label>
      <input type="email" id="friend-email" name="friend-email" placeholder="Enter email" required>
      <button type="submit" class="send-button">Send</button>
    </form>
  </div>
</body>
</html>
