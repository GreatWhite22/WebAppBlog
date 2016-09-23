<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="webappblog.WebAppBlogEntry"%>
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
    <link href="blog.css" rel="stylesheet">

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
          <a class="blog-nav-item active" href="#">Home</a>
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
        <h1 class="blog-title">Connor and Steven's Blog</h1>
        <p class="lead blog-description">EE 461L</p>
      </div>

      <div class="row">

        <div class="col-sm-8 blog-main">
        <%   
        ObjectifyService.register(webappblog.WebAppBlogEntry.class);
        List<WebAppBlogEntry> entries = ObjectifyService.ofy().load().type(WebAppBlogEntry.class).list();
        Collections.sort(entries, Collections.reverseOrder());
        
        if(entries.isEmpty()){
%>
          <div class="blog-post">
            <h2 class="blog-post-title"> 
            There are no blog entries at the moment. Sign in to post an entry.
            </h2>
           </div>
<% }
		else{
			for(int posts = 0; posts < entries.size() && posts < 5; posts++){
				WebAppBlogEntry entry = entries.get(posts);
				User poster = entry.getUser();
				String title = entry.getTitle();
				String content = entry.getContent();
				Date date = entry.getDate(); %>
				
				<div class="blog-post">
					<h2 class="blog-post-title">
						<%= title %>
					</h2>
					<p class="blog-post-meta"><%= date %> by <%= poster %> </p>
					<p> <%= content %> </p>
				</div>
	<% 		}
	    }
	%>
        </div><!-- /.blog-main -->

        <div class="col-sm-3 col-sm-offset-1 blog-sidebar">
          <div class="sidebar-module sidebar-module-inset">
            <h4>About</h4>
            <p>This is the blog for Connor Lewis and Steven Cisneros </p>
          </div>
           <div class="sidebar-module">
            <h4>Keep Updated</h4>
            <ol class="list-unstyled">
              <li><a href="subscribe.jsp">Subscribe</a></li>
            </ol>
        	<h4>Or Not</h4>
            <ol class="list-unstyled">
              <li><a href="unsubscribe.jsp">Unsubscribe</a></li>
            </ol>
          </div>
          
        </div><!-- /.blog-sidebar -->

      </div><!-- /.row -->

    </div><!-- /.container -->
    <div class="blog-footer">
    	<p><a href="viewall.jsp") %>View All Posts </a></p>
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
