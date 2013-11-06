package controller.user_management;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.text.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.FileData.FileData;

public class Storage extends HttpServlet {
    
    private String username;
    
    public void setUsername(String value){
        username=value;
    }
    
    public List<FileData> hoho() {
        String Driver = "com.mysql.jdbc.Driver";
        String db = "jdbc:mysql://localhost/eterped";
        List<FileData> ret = new ArrayList<>();
        FileData temp;
        
        try {
            Class.forName(Driver);

            Connection conn = DriverManager.getConnection(db, "root", "");

            Statement stmt = conn.createStatement();
            String sql = "SELECT DataId, ParentId, Name, Src, OwnerId FROM data a JOIN users b ON a.OwnerId = b.UserId WHERE UserName = '" + username  + "'";
            ResultSet rs = stmt.executeQuery(sql);
            
            while (rs.next()) {
                int DataId = rs.getInt("DataId");
                int ParentId = rs.getInt("ParentId");
                String Name = rs.getString("Name");
                String Src = rs.getString("Src");
                int OwnerId = rs.getInt("OwnerId");
                temp=new FileData();
                temp.setDataID(DataId);
                temp.setParentID(ParentId);
                temp.setName(Name);
                temp.setSrc(Src);
                temp.setOwnerID(OwnerId);
                
                ret.add(temp);
            }
            
            stmt.close();
            
        } catch (Exception e) {
                //out.println(e);
        }
        
        return ret;

    }
	
}