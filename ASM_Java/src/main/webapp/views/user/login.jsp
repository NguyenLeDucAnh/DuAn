<!DOCTYPE html>
<html>
<head>
  <title>Form Đăng Nhập</title>
  <style>
    .login-form {
  width: 300px;
  margin: 0 auto;
  padding: 20px;
  background-color: #F0F0F0;
  border: 1px solid #ccc;
  border-radius: 5px;
}

.form-group {
  margin-bottom: 15px;
}

label {
  display: block;
  margin-bottom: 5px;
}

input[type="text"],
input[type="password"] {
  width: 100%;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 3px;
}

button {
  background-color: #4CAF50;
  color: white;
  padding: 10px 20px;
  border: none;
  border-radius: 3px;
  cursor: pointer;
}

button:hover {
  background-color: #3e8e41;
}
  </style>
<body>
  <div class="login-form">
    <h2>LOGIN</h2>
    <form action="login" method="post">
      <div class="form-group">
        <label for="username">USERNAME?</label>
        <input type="text" id="username" name="username" required>
      </div>
      <div class="form-group">
        <label for="password">PASSWORD?</label>
        <input type="password" id="password" name="password" required>
      </div>
      <div class="form-group">
        <input type="checkbox" id="remember">
        <label for="remember">REMEMBER ME?</label>
      </div>
      <button type="submit">Login</button>
      <h2>${error}</h2>
    </form>
  </div>
</body>
</html>