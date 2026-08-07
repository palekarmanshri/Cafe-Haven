import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/LoginForm")
public class LoginServlet extends HttpServlet{
    private static final String DB_URL = "jdbc:mysql://localhost:3306/cafe";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        response.setContentType("text/html");
        PrintWriter out =response.getWriter();
        String myname = request.getParameter("name");
        String mypass= request.getParameter("passw");
        try{
          Class.forName("com.mysql.cj.jdbc.Driver");
          Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
          PreparedStatement ps = connection.prepareStatement("Select * from user where name=? and password=?");
          ps.setString(1,myname);
          ps.setString(2,mypass);
          ResultSet rs =ps.executeQuery();
          if(rs.next()){
            out.println("<script>");
        out.println("alert('Successfully Login');"); 
        out.println("window.location.href = 'cafemenu.jsp';"); 
        out.println("</script>");
            RequestDispatcher rd= request.getRequestDispatcher("/cafemenu.jsp");
            rd.include(request,response);
          }
          else{   
            out.println("<script>");
        out.println("alert('Name and Password didn't matched.');"); 
        out.println("window.location.href = 'index.html';"); 
        out.println("</script>");
            RequestDispatcher rd= request.getRequestDispatcher("/LOGIN.jsp");
            rd.include(request,response);   
          }
        }
        catch(Exception e){
            e.printStackTrace();
            response.setContentType("text/html");
            out.println("<h3 style='color:red'> Exception Occured:"+e.getMessage()+" </h3>");
            RequestDispatcher rd= request.getRequestDispatcher("/login.jsp");
            rd.include(request,response);
        }
    }
    
}
