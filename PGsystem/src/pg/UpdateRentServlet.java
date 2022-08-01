package pg;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Rent")
public class UpdateRentServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession();
		String uname=req.getParameter("uname");
		String rent=req.getParameter("rent");
		try {
			Connection con=Dbconfig.connect();
			String sql="update booking set rent_pay=? where uname=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, rent);
			ps.setString(2, uname);
			ps.executeUpdate();
			session.setAttribute("msg", "Rent Status Updated succesfully!!");
			resp.sendRedirect("Bookings.jsp");
		}
		catch(Exception ex) {
			System.out.println("Error: "+ex.getMessage());
		}
	}
}
