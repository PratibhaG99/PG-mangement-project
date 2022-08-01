package pg;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import pg.Dbconfig;

@WebServlet("/Register")
@MultipartConfig
public class RegisterServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uname=req.getParameter("uname");
		String email=req.getParameter("email");
		String phone=req.getParameter("phone");
		String upwd=req.getParameter("upwd");
		Part id=req.getPart("id");
		String path=getServletContext().getRealPath("/id/");
		
		id.write(path+id.getSubmittedFileName());
		
		HttpSession session=req.getSession();
		try {
			Connection c=Dbconfig.connect(); 
			String sql="insert into user values (?,?,?,?,?)";
			PreparedStatement ps=c.prepareStatement(sql);
			ps.setString(1,uname);
			ps.setString(2,email);
			ps.setString(3,phone);
			ps.setString(4, "id/"+id.getSubmittedFileName());
			ps.setString(5,upwd);
			ps.executeUpdate();
			c.close();
			session.setAttribute("msg", "User Registered Successfully!!!");
			resp.sendRedirect("Register.jsp");
		}
		catch(Exception ex) {
			resp.getWriter().println("Error: "+ex.getMessage());
		}
	}
}
