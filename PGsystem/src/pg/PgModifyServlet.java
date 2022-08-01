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

@WebServlet("/PgOperation")
public class PgModifyServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession();
		String pgname=req.getParameter("pgname");
		try {
			Connection con=Dbconfig.connect();
			PreparedStatement ps=null;
			PreparedStatement ps1=null;
			PreparedStatement ps3=null;
			String x=req.getParameter("delete");
			if(x!=null) {
					String sql="select * from booking where pgname=?";
					PreparedStatement ps2=con.prepareStatement(sql);
					ps2.setString(1, pgname);
					ResultSet r2=ps2.executeQuery();
					if(r2.next()){
						session.setAttribute("msg", "You can't delete this PG, it is booked!!");
						resp.sendRedirect("ManagePg.jsp");
					}
					else {
						ps=con.prepareStatement("delete from pg where pgname=?");
						ps.setString(1, pgname);
						ps.executeUpdate();
						ps1=con.prepareStatement("delete from meal where pgname=?");
						ps1.setString(1, pgname);
						ps1.executeUpdate();
						ps3=con.prepareStatement("delete from facilities where pgname=?");
						ps3.setString(1, pgname);
						ps3.executeUpdate();
						session.setAttribute("msg", "PG Deleted!!");
						resp.sendRedirect("ManagePg.jsp");
					}
			}
			else {
				session.setAttribute("pgname", pgname);
				resp.sendRedirect("Update.jsp");
			}
		}
		catch(Exception ex) {
			System.out.println("Error: "+ex.getMessage());
		}
	}
}
