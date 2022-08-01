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

@WebServlet("/BookPg")
public class BookPgServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cdate=req.getParameter("cdate");
		HttpSession session=req.getSession();
		String uname=session.getAttribute("uname").toString();
		String rent="NULL";
		String pgbooked=session.getAttribute("pgbooked").toString();
		String ownerid="0";
		try {
			Connection con=Dbconfig.connect();
			String sql="select * from pg where pgname=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1,pgbooked);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				ownerid=rs.getString("ownerid");
			}
			String sql2="insert into booking values (?,?,?,?,?)";
			PreparedStatement ps2=con.prepareStatement(sql2);
			ps2.setString(1,uname);
			ps2.setString(2,ownerid);
			ps2.setString(3,pgbooked);
			ps2.setString(4,cdate);
			ps2.setString(5,rent);
			ps2.executeUpdate();
			con.close();
			session.setAttribute("msg", "Congradulations!! Your Booking is Confirmed");
			resp.sendRedirect("UserView.jsp");
		}
		catch(Exception ex) {
			System.out.println("Error: "+ex.getMessage());
		}
	}
	
}
