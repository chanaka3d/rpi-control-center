<%@page import="com.wso2.raspberrypi.RaspberryPi" %>
<%@page import="com.wso2.raspberrypi.Util" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.List" %>


<%
    String refresh = request.getParameter("refresh");
    boolean autoRefresh = false;
    if ("on".equalsIgnoreCase(refresh)) {
        autoRefresh = true;
    }
%>
<html>
<head>
    <title>Connected Raspberry Pis</title>
    <%
        if (autoRefresh) {
    %>
    <META HTTP-EQUIV="Refresh" CONTENT="30; URL=index.jsp">
    <%
        }
    %>
    <script type="text/javascript">
        function reservePi(owner, mac){
           location.href = 'reservepi.jsp?owner=' + owner + "&mac=" + mac;
        }
    </script>
</head>
<body>
<h2>Connected Raspberry Pis</h2>
<hr/>
<p>
    <a href="controlpanel.jsp">Control Panel</a>
    &nbsp;&nbsp;|&nbsp;&nbsp;
    <a href="clearall.jsp">Clear All</a>
    &nbsp;&nbsp;|&nbsp;&nbsp;
    Auto Refresh:
    <%
        if (autoRefresh) {
    %>
    <a href="index.jsp?refresh=off">on</a>
    <%
    } else {
    %>
    <a href="index.jsp?refresh=on">off</a>
    <%
        }
    %>
</p>

<table border="1">
    <tr>
        <th>&nbsp;</th>
        <th>MAC Address</th>
        <th>IP Address</th>
        <th>Last Updated</th>
        <th>Owner</th>
        <th>Blink</th>
        <th>Reboot</th>
    </tr>
    <%
        List<RaspberryPi> raspberryPis = Util.getRaspberryPis();
        SimpleDateFormat sdf = new SimpleDateFormat("dd MMM yyyy HH:mm:ss zzz");
        int i = 0;
        for (RaspberryPi pi : raspberryPis) {
            String mac = pi.getMacAddress();
            String ip = pi.getIpAddress();
            long lastUpdated = pi.getLastUpdated();
            i++;

    %>
    <tr>
        <td><%= i%></td>
        <td><%= mac %>
        </td>
        <td><%= ip %>
        </td>
        <td><%= sdf.format(new Date(lastUpdated))%>
        </td>
        <td>
            <%
                if(pi.getReservedFor() == null || pi.getReservedFor().isEmpty()){
            %>
            <input type="text" size="20" name="reservedFor" id="mac<%= mac%>"/>
            <a href="#" onclick="reservePi(document.getElementById('mac<%= mac%>').value, '<%= mac%>')">Reserve</a>
            <%
                } else {
            %>
            <input type="text" size="20" name="reservedFor" id="mac<%= mac%>" value="<%= pi.getReservedFor()%>" disabled="true"/>
            <a href="releasepi.jsp?mac=<%= mac%>">Release</a>
            <%
                }
            %>
        </td>
        <td>
            <%
                if(pi.isBlink()){
            %>
            <a href="blink.jsp?mac=<%= mac%>&blink=false"><font color="green">On</font></a>
            <%
                } else {
            %>
            <a href="blink.jsp?mac=<%= mac%>&blink=true"><font color="red">Off</font></a>
            <%
                }
            %>
        </td>
        <td>
            <%
                if(pi.isReboot()){
            %>
            <a href="reboot.jsp?mac=<%= mac%>&reboot=false"><font color="orange">Rebooting...</font></a>
            <%
                } else {
            %>
            <a href="reboot.jsp?mac=<%= mac%>&reboot=true">Reboot</a>
            <%
                }
            %>
        </td>
    </tr>
    <%
        }
    %>
</table>
</body>
</html>

