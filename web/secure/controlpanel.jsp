<%@ page import="com.wso2.raspberrypi.Util" %>
<%--
  Created by IntelliJ IDEA.
  User: azeez
  Date: 1/23/13
  Time: 2:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Le styles -->
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="css/local.css" rel="stylesheet">


    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <title>Raspberry Pi Cluster - Control Panel</title>
</head>
<body class="back-bg">


<!-- NAVBAR
================================================== -->
<div class="navbar-wrapper">
  <!-- Wrap the .navbar in .container to center it within the absolutely positioned parent. -->
  <div class="container">

    <div class="navbar navbar-inverse">
      <div class="navbar-inner">
        <!-- Responsive Navbar Part 1: Button for triggering responsive navbar (not covered in tutorial). Include responsive CSS to utilize. -->
        <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </a>
        <a class="brand" href="#"></a>
        <!-- Responsive Navbar Part 2: Place all navbar contents you want collapsed withing .navbar-collapse.collapse. -->
        <div class="nav-collapse collapse pull-right">
          <ul class="nav">
            <li><a href="index.jsp">Home</a></li>
            <li class="active"><a href="controlpanel.jsp">Cluster Operations</a></li>

          </ul>
        </div><!--/.nav-collapse -->
      </div><!-- /.navbar-inner -->
    </div><!-- /.navbar -->

  </div> <!-- /.container -->
</div><!-- /.navbar-wrapper -->



<div class="container content-section">
    <div class="row">
        <div class="span12">
            <div class="heading-back">
                <div class="container">
                    <div class="row">
                        <div class="span8"><h1>Raspberry Pi Cluster - Control Panel</h1></div>
                    </div>
                </div>


            </div>
            <div class="white-back">
            <%
                String lbIP = Util.getValue("elb.pi.wso2.com");
                String appserverClusterState = Util.getValue("appserver.cluster.state");
            %>
                <form name="as-cluster-state-frm" action="updatekv.jsp" class="form-horizontal">
                         <div class="control-group">
                            <label class="control-label" for="loadBalancer">Load Balancer (elb.pi.wso2.com) IP Address:</label>
                            <div class="controls">
                                <input type="hidden" name="key" value="elb.pi.wso2.com"/>
                                <input type="text" name="value" value="<%= lbIP%>" id="loadBalancer" />
                            </div>
                         </div>
                         <div class="control-group">
                            <div class="controls">
                              <input type="submit" class="btn btn-primary" value="Update"/>
                            </div>
                          </div>
                    </form>
                <hr />

                <form name="as-cluster-state-frm" action="updatekv.jsp" class="form-horizontal">
                        <div class="control-group">
                            <label class="control-label" for="clusterState">App Server Cluster State:</label>
                            <div class="controls">
                                <input type="hidden" name="key" value="appserver.cluster.state"/>
                                <select name="value" id="clusterState">
                                    <%
                                        if("on".equalsIgnoreCase(appserverClusterState)){
                                    %>
                                    <option value="on" selected="true">Powered On</option>
                                    <option value="off">Powered Off</option>
                                    <%
                                        } else {
                                    %>
                                    <option value="on">Powered On</option>
                                    <option value="off" selected="true">Powered Off</option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                        </div>

                    <div class="control-group">
                        <div class="controls">
                            <input type="submit" value="Update" class="btn btn-primary" />
                        </div>
                      </div>


                    </form>



            </div>

        </div>
    </div>
</div>



<div class="container marketing">
  <!-- FOOTER -->
  <footer>
    <p class="pull-right"><a href="#">Back to top</a></p>
    <p>&copy; 2012 WSO2</p>
  </footer>

</div><!-- /.container -->


</body>
</html>