package pg;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/OwnerLog")
public class OwnerLogServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String ownerid=req.getParameter("ownerid");
		String pwd=req.getParameter("pwd");
		HttpSession session=req.getSession();
		try {
			Connection c=Dbconfig.connect(); 
			String sql="select * from owner where ownerid=? and pwd=?";
			PreparedStatement ps=c.prepareStatement(sql);
			ps.setString(1,ownerid);
			ps.setString(2,pwd);
			ResultSet r=ps.executeQuery();
			if(r.next()){
				session.setAttribute("ownerid",ownerid);
				session.setAttribute("oname", r.getString("oname"));
				c.close();
			    resp.sendRedirect("Owner.jsp");
			}
			else {
				session.setAttribute("msg", "Invalid Username or Password");
				resp.sendRedirect("LogOwner.jsp");
			}
		}
		catch(Exception ex) {
			resp.getWriter().println("Error: "+ex.getMessage());
		}
	}
}
