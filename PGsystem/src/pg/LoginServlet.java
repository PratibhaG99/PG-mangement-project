package pg;

import java.io.IOException;
import java.sql.*;
import pg.Dbconfig;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/Login")
public class LoginServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email=req.getParameter("email");
		String upwd=req.getParameter("upwd");
		HttpSession session=req.getSession();
		try {
			Connection c=Dbconfig.connect(); 
			String sql="select * from user where email=? and upwd=?";
			PreparedStatement ps=c.prepareStatement(sql);
			ps.setString(1,email);
			ps.setString(2,upwd);
			ResultSet r=ps.executeQuery();
			if(r.next()){
				session.setAttribute("email", email);
				session.setAttribute("uname", r.getString("uname"));
				c.close();
			    resp.sendRedirect("ViewPG.jsp");
			}
			else {
				session.setAttribute("msg", "Invalid Username or Password");
				resp.sendRedirect("Login.jsp");
			}
		}
		catch(Exception ex) {
			resp.getWriter().println("Error: "+ex.getMessage());
		}
	}
}
