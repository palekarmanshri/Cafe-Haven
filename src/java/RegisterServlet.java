
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/RegForm")
public class RegisterServlet extends HttpServlet{
    private static final String DB_URL = "jdbc:mysql://localhost:3306/cafe";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        PrintWriter out =response.getWriter();
        String myname = request.getParameter("name");
        String myemail = request.getParameter("email");
        String mypass= request.getParameter("passw");
        String mygender = request.getParameter("gender");
        String mycity= request.getParameter("city");
        try{
          Class.forName("com.mysql.cj.jdbc.Driver");
          Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
          PreparedStatement ps = connection.prepareStatement("Insert into user values(?,?,?,?,?)");
          ps.setString(1,myname);
          ps.setString(2,myemail);
          ps.setString(3,mypass);
          ps.setString(4,mygender);
          ps.setString(5,mycity);
          int count=ps.executeUpdate();
          if(count>0){
            response.setContentType("text/html");
            out.println("<script>");
            out.println("alert('Successfully Registered');"); 
            out.println("window.location.href = 'LOGIN.jsp';"); 
            out.println("</script>");
            RequestDispatcher rd= request.getRequestDispatcher("/Register.jsp");
            rd.include(request,response);
          }
          else{
            response.setContentType("text/html");
            out.println("<script>");
            out.println("alert('User Not Registered');");
            out.println("window.location.href = 'index.html';"); 
            out.println("</script>");
            RequestDispatcher rd= request.getRequestDispatcher("/Register.jsp");
            rd.include(request,response);    
          }
        }
        catch(Exception e){
            e.printStackTrace();
            response.setContentType("text/html");
            out.println("<h3 style='color:red'> Exception Occured:"+e.getMessage()+" </h3>");
            RequestDispatcher rd= request.getRequestDispatcher("/Register.jsp");
            rd.include(request,response);
        }
    }
    
}
