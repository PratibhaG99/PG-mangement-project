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

@WebServlet("/SavePg")
@MultipartConfig
public class SavePgServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pgname=req.getParameter("pgname");
		String type=req.getParameter("type");
		String state=req.getParameter("state");
		String address=req.getParameter("address");	
		String rent=req.getParameter("rent");
		Part pgimg=req.getPart("pic");
		String path=getServletContext().getRealPath("/pgimg/");
		pgimg.write(path+pgimg.getSubmittedFileName());
		
		String electricity=req.getParameter("electricity");
		String furnished=req.getParameter("furnished");
		String parking=req.getParameter("parking");
		String ac=req.getParameter("ac");
		String balcony=req.getParameter("balcony");
		String laundary=req.getParameter("laundary");
		String security=req.getParameter("security"); 
		
		String breakfast=req.getParameter("breakfast");
		String lunch=req.getParameter("lunch");
		String dinner=req.getParameter("dinner");
		
		String ownerid=req.getParameter("ownerid");
		HttpSession session=req.getSession();
		
		resp.getWriter().println(lunch);
		
		try {
			Connection c=Dbconfig.connect(); 
			String sql1="insert into meal values (?,?,?,?,?)";
			PreparedStatement ps1=c.prepareStatement(sql1);
			ps1.setString(1, breakfast);
			ps1.setString(2, lunch);
			ps1.setString(3, dinner);
			ps1.setString(4, ownerid);
			ps1.setString(5, pgname);
			ps1.executeUpdate();
		
			String sql2="insert into facilities values (?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps2=c.prepareStatement(sql2);
			ps2.setString(1, electricity);
			ps2.setString(2, parking);
			ps2.setString(3, ac);
			ps2.setString(4, balcony);
			ps2.setString(5, furnished);
			ps2.setString(6, laundary);
			ps2.setString(7, security);
			ps2.setString(8, ownerid);
			ps2.setString(9, pgname);
			ps2.executeUpdate();
			
			String sql3="insert into pg values (?,?,?,?,?,?,?)";
			PreparedStatement ps3=c.prepareStatement(sql3);
			ps3.setString(1, pgname);
			ps3.setString(2, type);
			ps3.setString(3, state);
			ps3.setString(4, address);
			ps3.setString(5, rent);
			ps3.setString(6, "pgimg/"+pgimg.getSubmittedFileName());
			ps3.setString(7, ownerid);
			ps3.executeUpdate(); 
			session.setAttribute("msg", "PG added successfully!!");      
			c.close();
			resp.sendRedirect("AddPG.jsp");
		}
		catch(Exception e) {
			resp.getWriter().println("Error: "+e.getMessage());
		}
	}
}
