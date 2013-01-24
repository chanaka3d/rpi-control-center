<%@ page import="com.wso2.raspberrypi.RaspberryPiException" %>
<%@ page import="com.wso2.raspberrypi.Util" %>
<%
    try {
        Util.clearAllRaspberryPis();
        response.sendRedirect("index.jsp");
    } catch (RaspberryPiException e) {
%>
<p>
    <%= e.getMessage()%>
</p>

<p>
    <a href="index.jsp">Return</a>
</p>
<%
    }
%>