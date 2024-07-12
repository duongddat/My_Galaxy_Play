package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import bean.adminbean;

public class admindao {
	public adminbean login(String username, String pass) throws Exception {
		adminbean ad = null;
		
		//B1: Kết nối vào csdl
		KetNoidao kn = new KetNoidao();
		kn.ketnoi();
		//B2: Tạo câu lệnh sql
		String sql = "SELECT * FROM Admin WHERE username = ? AND password = ?";
		//B3: Tạo câu lệnh
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, username);
		cmd.setString(2, pass);
		//B4: Thực hiện câu lệnh
		ResultSet rs = cmd.executeQuery();
		
		//B5: Duyệt rs de luu vao ds
		while(rs.next()) {
			String username1 = rs.getString("username");
			String pass1 = rs.getString("password");
			Boolean quyen = rs.getBoolean("quyen");
			ad = (new adminbean(username1, pass1, quyen));
		}
		//B6: Đóng rs va kết nôi
		rs.close();
		kn.cn.close();
		return ad;
	}
}
