<%@ page import="com.wso2.raspberrypi.Util" %>
<%@ page import="com.wso2.raspberrypi.RaspberryPi" %><%
    String mac = request.getParameter("mac");
    String blink = request.getParameter("blink");
    RaspberryPi raspberryPi = Util.getRaspberryPi(mac);
    raspberryPi.setBlink(Boolean.valueOf(blink));

    Util.updateRaspberryPi(raspberryPi);
    response.sendRedirect("index.jsp");
%>