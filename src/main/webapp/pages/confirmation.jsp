<html>
<head><title>Confirmation</title></head>
<body>
<h2>Registration Successful!</h2>
<p>Thank you, <b><%= ((com.eventmgmt.model.User)request.getAttribute("user")).getName() %></b></p>
<p>You have successfully registered for the event: <b><%= request.getAttribute("eventName") %></b></p>
<a href="../index.jsp">Back to Home</a>
</body>
</html>
