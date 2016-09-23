package webappblog;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;
import java.io.IOException;
import java.util.Date;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.googlecode.objectify.ObjectifyService;
import static com.googlecode.objectify.ObjectifyService.ofy;

public class WebAppBlogServlet extends HttpServlet
{
	
    public void doPost(HttpServletRequest req, HttpServletResponse resp)
                throws IOException 
    {

        UserService userService = UserServiceFactory.getUserService();
        User user = userService.getCurrentUser();

        String content = req.getParameter("post");
        String title = req.getParameter("dtitle");
        Date date = new Date();
        

    
      
        WebAppBlogEntry greeting=new WebAppBlogEntry(user, content, title);
        ofy().save().entity(greeting).now();

        resp.sendRedirect("/blog.jsp");

    }

}