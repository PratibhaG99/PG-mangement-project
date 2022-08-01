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

@WebServlet("/PgDetails")
public class ViewPGServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession();
			String pgname=req.getParameter("x");
			try {
			Connection con=Dbconfig.connect();
			String sql="select * from pg where pgname=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1,pgname);
			ResultSet rs=ps.executeQuery();
			if(rs.next()){
				session.setAttribute("pgname", pgname);
				resp.sendRedirect("ViewDetails.jsp");
			}
		}
		catch(Exception ex) {
			System.out.println("Error: "+ex.getMessage());
		}
	}
}
