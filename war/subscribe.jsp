<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="webappblog.WebAppBlogEntry"%>
<%@ page import="webappblog.Subscribe"%>
<%@ page import="webappblog.Email"%>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="com.googlecode.objectify.*" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="favicon.ico">

    <title>Blog</title>

    <!-- Bootstrap core CSS -->
    <link href="dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="newpost.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

    <div class="blog-masthead">
      <div class="container">
        <nav class="blog-nav">
          <a class="blog-nav-item" href="blog.jsp">Home</a>
          <a class="blog-nav-item" href="/email">Send Email</a>
          <%
          UserService userService = UserServiceFactory.getUserService();
          User user = userService.getCurrentUser();
          if (user == null){ %>
          <a class="blog-nav-item" href="<%= userService.createLoginURL(request.getRequestURI()) %>">Sign In</a>
          <% }
          else {
          %>
           <a class="blog-nav-item" href="newpost.jsp">New post</a>
           <a class="blog-nav-item" href="<%= userService.createLogoutURL(request.getRequestURI()) %>"> Sign out </a>
           <% } %>
        </nav>
      </div>
    </div>

    <div class="container">

      <div class="blog-header">
        <h1 class="blog-title">Subscribe</h1>
      </div>
      <!------------Form Start---------->

<div id='form'>
<div class="row">
<div class="col-md-12">

<form>

	<div id="comment-name" class="form-row">
		<input type = "text" placeholder = "First Name (required)" name = "firstname"  id = "title" required autofocus>
		<input type = "text" placeholder = "Last Name (required)" name = "lastname"  id = "title" required autofocus>
		<input type = "text" placeholder = "Email Address (required)" name = "emailAddress"  id = "title" required autofocus>
	</div>
	<div>
	<a href=""><input type="submit" onclick="confirm('You are now subscribed');" name="dsubmit" id="commentSubmit" value="Subscribe"></a>
	<a href="blog.jsp"><input type="" name="" id="commentSubmit" value="Cancel"></a>
	</div>
	</form>
	<%
	String firstName = request.getParameter("firstname");
	String lastName = request.getParameter("lastname");
	String emailAddress = request.getParameter("emailAddress");
	if(firstName == null || lastName == null || emailAddress == null){}
	else {
		Subscribe subscriber = new Subscribe(firstName, lastName, emailAddress);
		if(Email.listofsubscribers.contains(subscriber)){}
		else {
			Email.listofsubscribers.add(subscriber);
		}
	}
%>
</div>
</div>
</div>
</div>

 <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="dist/js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
