package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import bean.khachHangbean;

public class khachHangdao {
	public khachHangbean checkUn(String username) throws Exception {
		khachHangbean kh = null;
		
		//B1: Kết nối vào csdl
		KetNoidao kn = new KetNoidao();
		kn.ketnoi();
		//B2: Tạo câu lệnh sql
		String sql = "SELECT * FROM KhachHang WHERE username = ?";
		//B3: Tạo câu lệnh
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, username);
		//B4: Thực hiện câu lệnh
		ResultSet rs = cmd.executeQuery();
		
		//B5: Duyệt rs de luu vao ds
		while(rs.next()) {
			long makh = rs.getLong("makh");
			String tenkh = rs.getString("tenkh");
			String diachi = rs.getString("diachi");
			String sdt = rs.getString("sdt");
			String email = rs.getString("email");
			String username1 = rs.getString("username");
			String pass = rs.getString("pass");
			kh = new khachHangbean(makh, tenkh, diachi, sdt, email, username1, pass);
		}
		//B6: Đóng rs va kết nôi
		rs.close();
		kn.cn.close();
		return kh;
	}
	
	public khachHangbean khdn(String username, String pass) throws Exception {
		khachHangbean kh = null;
		
		//B1: Kết nối vào csdl
		KetNoidao kn = new KetNoidao();
		kn.ketnoi();
		//B2: Tạo câu lệnh sql
		String sql = "SELECT * FROM KhachHang WHERE username = ? AND pass = ?";
		//B3: Tạo câu lệnh
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, username);
		cmd.setString(2, pass);
		//B4: Thực hiện câu lệnh
		ResultSet rs = cmd.executeQuery();
		
		//B5: Duyệt rs de luu vao ds
		while(rs.next()) {
			long makh = rs.getLong("makh");
			String tenkh = rs.getString("tenkh");
			String diachi = rs.getString("diachi");
			String sdt = rs.getString("sdt");
			String email = rs.getString("email");
			String username1 = rs.getString("username");
			String pass1 = rs.getString("pass");
			kh = new khachHangbean(makh, tenkh, diachi, sdt, email, username1, pass1);
		}
		//B6: Đóng rs va kết nôi
		rs.close();
		kn.cn.close();
		return kh;
	}
	
	public int dkKhachHang(String tenkh, String diachi, String sdt, String email, String username, String pass) throws Exception {
		//B1: Kết nối vào csdl
		KetNoidao kn = new KetNoidao();
		kn.ketnoi();
		//B2: Tạo câu lệnh sql
		String sql = "insert into khachhang(tenkh, diachi, sdt, email, username, pass) values (?,?,?,?,?,?)";
		//B3: Tạo câu lệnh
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, tenkh);
		cmd.setString(2, diachi);
		cmd.setString(3, sdt);
		cmd.setString(4, email);
		cmd.setString(5, username);
		cmd.setString(6, pass);
		
		//B4: Thực hiện câu lệnh
		int kq = cmd.executeUpdate();
				
		//B5: Đóng rs va kết nôi
		cmd.close();
		kn.cn.close();
				
		return kq;
	}
	
	public int Sua(long makh, String tenkh, String diachi, String sdt, String email) throws Exception {
		//B1: Kết nối vào csdl
		KetNoidao kn = new KetNoidao();
		kn.ketnoi();
		//B2: Tạo câu lệnh sql
		String sql = "update KhachHang set tenkh = ?, diachi = ?, sdt = ?, email = ? where makh = ?";
		//B3: Tạo câu lệnh
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, tenkh);
		cmd.setString(2, diachi);
		cmd.setString(3, sdt);
		cmd.setString(4, email);
		cmd.setLong(5, makh);
		
		//B4: Thực hiện câu lệnh
		int kq = cmd.executeUpdate();
		
		//B5: Đóng rs va kết nôi
		cmd.close();
		kn.cn.close();
		
		return kq;
	}
	
	public int doiMK(long makh, String pass) throws Exception {
		//B1: Kết nối vào csdl
		KetNoidao kn = new KetNoidao();
		kn.ketnoi();
		//B2: Tạo câu lệnh sql
		String sql = "update KhachHang set pass = ? where makh = ?";
		//B3: Tạo câu lệnh
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, pass);
		cmd.setLong(2, makh);
		
		//B4: Thực hiện câu lệnh
		int kq = cmd.executeUpdate();
		
		//B5: Đóng rs va kết nôi
		cmd.close();
		kn.cn.close();
		
		return kq;
	}
	
	public long countKH() throws Exception {		
		//B1: Kết nối vào CSDL
		KetNoidao kn = new KetNoidao();
		kn.ketnoi();
		//B2: Tạo câu lệnh SQL
		String sql = "SELECT count(*) FROM KhachHang";
		//B3: Tạo câu lệnh
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		//B4: Thực hiện câu lệnh
		ResultSet rs = cmd.executeQuery();
		//B5: Duyệt rs để lưu vào ds
		long count = 0;
		while(rs.next()) {
			count = rs.getLong(1);
		}
		//B6: Đóng rs và kết nối
		rs.close();
		kn.cn.close();
		return count;
	}
}
