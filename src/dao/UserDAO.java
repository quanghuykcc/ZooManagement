package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import lib.ConnectDbLib;

public class UserDAO {
	Connection con;
	ConnectDbLib ConLib = new ConnectDbLib();
	PreparedStatement pst;
	ResultSet rs;
	
	public boolean checkUserLogin(String username,String password){
		boolean result=false;
		try{
			con = ConLib.getConnectMySQL();
			String sql = "SELECT * FROM user WHERE username LIKE ? AND password LIKE ? LIMIT 1";
			pst = con.prepareStatement(sql);
			pst.setString(1, username);
			pst.setString(2, password);
			rs = pst.executeQuery();
			if(rs.next()){
				result = true;
			}
		}catch(Exception e){
			System.out.println("Lỗi cmnr");
		}finally {
			try{
				con.close();
				pst.close();
				ConLib.closeConnect();
			}catch(Exception e){
				
			}
		}
		
		return result;
	}
}
