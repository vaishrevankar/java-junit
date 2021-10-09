<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<style>
form {
    border: 3px solid #f1f1f1;
}

input[type=text],input[type=password] {
    width: 25%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
    text-align:center;
}
button {
    background-color:#6a5acd ;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: 1px;
    cursor: pointer;
    width: 10%;
    text-align:center;
    font-weight:bold;
}

button:hover {
    opacity: 0.8;
}

.container {
    padding: 16px;
}

span.psw {
    float: right;
    padding-top: 16px;
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
    span.psw {
       display: block;
       float: none;
    }
}
</style>
</head>
<body>
	<h1 style="text-align:center;color:#6a5acd">DevOps Capstone</h1>
	<form action="Login" method="post">
	  <div class="container" style="text-align:center">
	    <label><b>Email:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></label>
	    <input type="text" placeholder="Enter Email" name="email" required><br></br>
	
	    <label><b>Password: </b></label>
	    <input type="password" placeholder="Enter Password" name="password" required><br></br>
	        
	    &nbsp;<button type="submit">Login</button>
	  </div>
	
	  <div class="container" style="background-color:#f1f1f1">
	    <span class="psw"><a href="forgotpassword.jsp">Forgot password?</a>&nbsp; &nbsp; <a href="register.jsp" id="register">New User ?</a> </span>
	  </div>
</form>
</body>
</html>