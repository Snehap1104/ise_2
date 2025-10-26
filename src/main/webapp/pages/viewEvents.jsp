<%@ page import="java.util.List"%>
<%@ page import="com.eventmgmt.model.Event"%>
<html>
<head><title>View Events</title></head>
<body>
<h2>All Events</h2>
<%
    List<Event> events = (List<Event>) request.getAttribute("events");
    if(events != null && !events.isEmpty()){
        for(Event e : events){
%>
    <p>
        <b><%= e.getName() %></b> | <%= e.getDate() %> <br>
        <%= e.getDescription() %> <br>
        <a href="registerEvent.jsp?event=<%= e.getName() %>">Register</a>
    </p>
<%
        }
    } else {
%>
<p>No events available.</p>
<%
    }
%>
<a href="../index.jsp">Back to Home</a>
</body>
</html>
