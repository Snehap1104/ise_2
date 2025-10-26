<html>
<head><title>Register Event</title></head>
<body>
<h2>Register for Event</h2>
<form action="../RegistrationController" method="post">
    Name: <input type="text" name="name" required><br>
    Email: <input type="email" name="email" required><br>
    Event: <input type="text" name="event" value="<%= request.getParameter("event") %>" readonly><br>
    <input type="submit" value="Register">
</form>
<a href="../index.jsp">Back to Home</a>
</body>
</html>
