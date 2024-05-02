<%@ page import="java.sql.*" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title> Student Management System </title>
    <link rel="stylesheet" href="style.css" />
</head>

<body>
    <center>
		
		<div class="header">
			<br><br><h1>STUDENT MANAGEMENT SYSTEM</h1>
		</div>
		
		<div class="container">
		<div class="form-container">
			<p class="sign-in-text">Sign in to continue</p><br>
			<form method="post">
					<div class="form-group">
               			 <input type="username" name="username" placeholder=" Username" pattern="^[A-Za-z]{2,}$" title="Please enter min 2 Alphabets, no special chars and numbers to be inserted." required onchange="this.value = this.value.trim()">
               			 <br><br>
               			 <input type="password" name="password" placeholder=" Password" required onchange="this.value = this.value.trim()">
               			 <br><br>
               			 <input type="password" name="repeat" placeholder="Repeat Password" required onchange="this.value = this.value.trim()">
               			 <br><br>
						 <div class="form-group">
							<input type="submit" name="btn" value="Sign Up" />
						 </div>
					</div>	 
					<div class="signin-link">
                    	<p>Already have an account?<a href="index.jsp">Sign In</a></p>
              	  	</div>
            </form>
	<%
	if(request.getParameter("btn") != null) {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String repeat = request.getParameter("repeat");
		if(password.equals(repeat)) {
			try {
				DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
				String url = "jdbc:mysql://localhost:3306/SMS";
				Connection con = DriverManager.getConnection(url,"root","shubhu@46");
				String sql = "insert into login (username, password) values (?, ?)";
				PreparedStatement pst = con.prepareStatement(sql);
				pst.setString(1, username);
				pst.setString(2, password);
				pst.executeUpdate();
				con.close();
%>
				<script>
					window.onload = function() {
						alert("Signup Successful");
						window.location.replace("index.jsp");
					};
				</script>
<%
			} catch(Exception e) {
				out.println("issue "+e);
			}
		} else {
%>
			<script>
				window.onload = function() {
					alert("Passwords do not match, Please try again.");
				};
			</script>
<%
		}
	}
%>

		</div>
		</div>
	</center>
</body>
</html>
