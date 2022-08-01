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

import pg.Dbconfig;

@WebServlet("/Changepwd")
public class ChangepwdServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pwd=req.getParameter("pwd");
		String npwd=req.getParameter("npwd");
		//String cpwd=req.getParameter("cpwd");
		HttpSession session=req.getSession();
		String ownerid= session.getAttribute("ownerid").toString();
		try {
			Connection con=Dbconfig.connect();
			String sql="select * from owner where ownerid=? and pwd=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1,ownerid);
			ps.setString(2,pwd);
			ResultSet r=ps.executeQuery();
			if(r.next()) {
				String sql1="update owner set pwd=? where ownerid=?";
				ps=con.prepareStatement(sql1);
				ps.setString(1,npwd);
				ps.setString(2,ownerid);
				ps.executeUpdate();
				session.setAttribute("msg", "Password Changed Successfully!!");
				resp.sendRedirect("ChangePwd.jsp");
			}
			else {			
				session.setAttribute("msg", "Current Password do not match!!");
				resp.sendRedirect("ChangePwd.jsp");
			}
		}
		catch(Exception ex) {
			System.out.println("Error: "+ex.getMessage());
		}
	}
}
