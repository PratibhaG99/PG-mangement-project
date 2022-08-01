package pg;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/Leave")
public class LeavePgServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession();
		String uname=session.getAttribute("uname").toString();
		try {
			Connection c=Dbconfig.connect(); 
			String sql="delete from booking where uname=?";
			PreparedStatement ps=c.prepareStatement(sql);
			ps.setString(1,uname);
			ps.executeUpdate();
			session.setAttribute("msg", "You are no longer part of PG!!");
			resp.sendRedirect("UserView.jsp");
		}
		catch(Exception ex) {
			resp.getWriter().println("Error: "+ex.getMessage());
		}
	}
}
