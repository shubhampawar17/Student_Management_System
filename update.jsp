<%@ page import="java.sql.*" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title> Student Management System </title>
    <link rel="stylesheet" href="style.css" />
</head>

<body>
    <center>
        <form onsubmit="return confirmUpdate();">
            <div class="header">
                <br><br> <h1>Update Students</h1>
            </div>

		<div class="form-container"><br>
            <div class="updatejsp">
                <label for="rollno"><b>Roll No:</b></label>
                <input type="number" name="rollno" placeholder=" Roll No" required min="1">
            </div>
            <br>

            <div class="updatejsp">
                <label for="username"><b>Name:</b></label>
                <input type="text" name="username" placeholder=" User Name" pattern="^[A-Za-z]{2,}$"
                    title="Please enter min 2 Alphabets, no special chars and numbers to be inserted." required
                    onchange="this.value = this.value.trim()">
            </div>
            <br>

            <div class="updatejsp">
                <label for="marks"><b>Marks:</b></label>
                <input type="number" name="marks" placeholder=" Marks" required min="0" max="100">
            </div>
            <br>

            <div class="updatejsp">
                <button type="submit" class="open-button" name="btn">Update</button><br><br>
                <a href="sms.jsp"><button type="button" class="open-button">Back</button></a>
            </div>
        </form>
	<%
		if(request.getParameter("btn") != null)
		{
			try{
				DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
				String url = "jdbc:mysql://localhost:3306/SMS";
				Connection con = DriverManager.getConnection(url, "root", "shubhu@46");
	
				int rollno = Integer.parseInt(request.getParameter("rollno"));
	                    	String checkRollnoSql = "SELECT * FROM students WHERE rollno=?";
        	            	PreparedStatement checkRollnoPst = con.prepareStatement(checkRollnoSql);
                	    	checkRollnoPst.setInt(1, rollno);
                    		ResultSet rs = checkRollnoPst.executeQuery();
				if (!rs.next()) {
	%>
				<script>
 					window.onload = function() {
                            		alert("Roll No does not exists. Please try again.");
					};
				</script>
	<%
				}else{
					String updatesql = "update students set rollno=?, username=? where marks=?";
					PreparedStatement updatepst = con.prepareStatement(updatesql);

					String username = request.getParameter("username");
					double marks = Double.parseDouble(request.getParameter("marks"));

					updatepst.setInt(1, rollno);
					updatepst.setString(2, username);
					updatepst.setDouble(3,marks);
					int r = updatepst.executeUpdate();
	%>
				<script>
 					window.onload = function() {
                            		alert("Record Updated");
					};
				</script>
	<%
				}
				con.close();
			}catch(SQLException e){
				out.println("issues "+e);
			}
		}
	%>
	<script>
        	function confirmUpdate() {
                	return confirm("Are you sure you want to Update this record?");
            	}
       	</script>
	</div>	
    </center>
</body>
</html>

