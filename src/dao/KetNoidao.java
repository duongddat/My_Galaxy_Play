package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class KetNoidao {
	public Connection cn;
	public void ketnoi() throws Exception {
		//B1: Xac dinh hqtcsdl
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		System.out.print("Da xac dinh duoc he quan tri csdl\n");
		String url = "jdbc:sqlserver://DESKTOP-KK4FG1C\\SQLEXPRESS:1433;databaseName=MyGalaxy;user=sa;password=duongvandat;";
		cn = DriverManager.getConnection(url);
		System.out.println("Da ket noi den csdl MyGalaxy cua bai mj");
	}
}
