
<%@ page import="java.sql.*" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title> Student Management System </title>
    <link rel="stylesheet" href="style.css" />
</head>

<body>
	<div class="header">
		<br><br><h1>STUDENT MANAGEMENT SYSTEM</h1>
	</div>
	
	
	<div class="container">
		<div class="form-container">
			<p class="sign-in-text">Sign in to continue</p><br>
			<form method="post">
            	<div class="form-group">
                	<input type="username" name="username" placeholder="Username" required /><br><br>
            	</div>
          
				<div class="form-group">
                	<input type="password" name="password" placeholder="Password" required /><br>
           	 	</div>
           
				<div class="form-group">
            	    <input type="submit" name="btn" value="Login" />
            	</div>
          
				<div class="signin-link">
    	        	   <p>Don't have an account? <a href="signup.jsp">Sign Up</a></p>
   					</div>
    	    	</form>
		<%
			if(request.getParameter("btn") != null)
			{
				String username = request.getParameter("username");
				String password = request.getParameter("password");
				try{
					DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
					String url = "jdbc:mysql://localhost:3306/SMS";
					Connection con = DriverManager.getConnection(url,"root","shubhu@46");
					String sql = "select * from login where username=? and password=?";
					PreparedStatement pst = con.prepareStatement(sql);
					pst.setString(1, username);
					pst.setString(2, password);
					ResultSet rs = pst.executeQuery();
					if(rs.next()){
						session.setAttribute("username", username);
						response.sendRedirect("sms.jsp");
					}else{
		%>
					<script>
 						window.onload = function() {
    	                        		alert("Invalid login");
						};
					</script>
		<%			
				}
					con.close();
				}catch(SQLException e){
					out.println("issue "+e);
				}
			}
		%>
		</div>
		</div>
</body>
</html>
