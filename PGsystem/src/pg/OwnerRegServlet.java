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

@WebServlet("/OwnerReg")
@MultipartConfig
public class OwnerRegServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String ownerid=req.getParameter("ownerid");
		String oname=req.getParameter("oname");
		String email=req.getParameter("email");
		String pwd=req.getParameter("pwd");
		HttpSession session=req.getSession();
		try {
			Connection c=Dbconfig.connect(); 
			String sql="insert into owner values (?,?,?,?)";
			PreparedStatement ps=c.prepareStatement(sql);
			ps.setString(1,ownerid);
			ps.setString(2,oname);
			ps.setString(3,email);
			ps.setString(4,pwd);
			ps.executeUpdate();
			c.close();
			session.setAttribute("msg", "Owner Registered Successfully!!!");
			resp.sendRedirect("LogOwner.jsp");
		}
		catch(Exception ex) {
			resp.getWriter().println("Error: "+ex.getMessage());
		}
	}
}
