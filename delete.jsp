<%@ page import="java.sql.*" %>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <title> Student Management System </title>
    <link rel="stylesheet" href="style.css" />
</head>

<body>
    <center>
        <form onsubmit="return confirmDelete();">
            <div class="header">
                <br><br> <h1>Delete Student</h1>
            </div>
	<div class="form-container">
            <div class="deletejsp"><br>
                <label for="rollno"><b>Roll No: </b></label>
                <input type="number" name="rollno" placeholder=" Roll No" required>
            </div>
            <br>

            <div class="deletejsp">
                <button type="submit" class="open-button" name="btn">Delete</button><br><br>
                <a href="sms.jsp"><button type="button" class="open-button">Back</button></a>
            </div>
        </form>
        <%  
            if (request.getParameter("btn") != null) {
                try {
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
                            alert("Roll No does not exist. Please try again.");
                        </script>
        <%  
                    } else {
                        String deletesql =  "delete from students where rollno=?";
                        PreparedStatement deletepst = con.prepareStatement(deletesql);

                        deletepst.setInt(1, rollno);
                        int r = deletepst.executeUpdate();
        %>
                        <script>
                            alert("Record Deleted");
                        </script>
        <%  
                    }
                    con.close();
                } catch (SQLException e) {
                    out.println("issues "+e);
                }
            }
        %>
        <script>
            function confirmDelete() {
                return confirm("Are you sure you want to delete this record?");
            }
        </script>
	</div>
    </center>
</body>
</html>

