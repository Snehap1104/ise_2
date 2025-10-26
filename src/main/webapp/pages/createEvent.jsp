<html>
<head><title>Create Event</title></head>
<body>
<h2>Create a New Event</h2>
<form action="../EventController" method="post">
    Name: <input type="text" name="name" required><br>
    Date: <input type="date" name="date" required><br>
    Description: <textarea name="description" required></textarea><br>
    <input type="submit" value="Create Event">
</form>
<a href="../index.jsp">Back to Home</a>
</body>
</html>
