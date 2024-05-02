<%@ page import="java.sql.*" %>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <title> Student Management System </title>
    <link rel="stylesheet" href="style.css" />
</head>

<body>
    <center>
		<br><br><div class="header">
			<h1>View Student</h1>
		</div>
		<div class="container">
            <table class="table">
                <tr>
                    <th>Roll No</th>
                    <th>Name</th>
                    <th>Marks</th>
                </tr>
                <%  
                try{
                    DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
                    String url = "jdbc:mysql://localhost:3306/SMS";
                    Connection con = DriverManager.getConnection(url, "root", "shubhu@46");
                    String sql = "select * from students";
                    PreparedStatement pst = con.prepareStatement(sql);
                    ResultSet rs = pst.executeQuery();

                    while(rs.next()){
                %>
                <tr>
                    <td><%= rs.getInt(1) %></td>
                    <td><%= rs.getString(2) %></td>
                    <td><%= rs.getDouble(3) %></td>
                </tr>
                <%  
                    }
                    con.close();
                }catch(SQLException e){
                    out.println("issue "+e);
                }
                %>
            </table>
            <br><br>
            <a href="sms.jsp"><button type="button" class="open-button">Back</button></a>
        </div>
    </center>
</body>

</html>
