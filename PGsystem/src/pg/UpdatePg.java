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

@WebServlet("/Update")
public class UpdatePg extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pgname=req.getParameter("pgname");
		String type=req.getParameter("type");
		String state=req.getParameter("state");
		String address=req.getParameter("address");	
		String rent=req.getParameter("rent");
		HttpSession session=req.getSession();
		
		try {
			Connection c=Dbconfig.connect(); 
			String sql3="update pg set type=?,state=?,address=?,rent=? where pgname=?";
			PreparedStatement ps3=c.prepareStatement(sql3);
			ps3.setString(1, type);
			ps3.setString(2, state);
			ps3.setString(3, address);
			ps3.setString(4, rent);
			ps3.setString(5, pgname);
			ps3.executeUpdate(); 
			c.close();
			session.setAttribute("msg","PG Details Updated Successfully!!");
			resp.sendRedirect("ManagePg.jsp");
		}
		catch(Exception e) {
			resp.getWriter().println("Error: "+e.getMessage());
		}
	}
}
