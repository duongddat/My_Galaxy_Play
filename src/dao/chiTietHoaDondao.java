package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import bean.xacNhanCTbean;


public class chiTietHoaDondao {
	public int Them(String maphim, long thue, long mahd) throws Exception {
		//B1: Kết nối vào csdl
		KetNoidao kn = new KetNoidao();
		kn.ketnoi();
		//B2: Tạo câu lệnh sql
		String sql = "insert into ChiTietHoaDon(maphim, thue, mahd, damua) values (?, ?, ?, ?)";
		//B3: Tạo câu lệnh
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, maphim);
		cmd.setLong(2, thue);
		cmd.setLong(3, mahd);
		cmd.setBoolean(4, false);
		
		//B4: Thực hiện câu lệnh
		int kq = cmd.executeUpdate();
		
		//B5: Đóng rs va kết nôi
		cmd.close();
		kn.cn.close();
		
		return kq;
	}
	
	public int CapNhat(long machd) throws Exception {
		//B1: Kết nối vào csdl
		KetNoidao kn = new KetNoidao();
		kn.ketnoi();
		//B2: Tạo câu lệnh sql
		String sql = "update ChiTietHoaDon set damua = 1 where machd = ?";
		//B3: Tạo câu lệnh
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setLong(1, machd);
				
		//B4: Thực hiện câu lệnh
		int kq = cmd.executeUpdate();
				
		//B5: Đóng rs va kết nôi
		cmd.close();
		kn.cn.close();
				
		return kq;
	}
	
	public int CapNhatTheoHD(long mahd) throws Exception {
		//B1: Kết nối vào csdl
		KetNoidao kn = new KetNoidao();
		kn.ketnoi();
		//B2: Tạo câu lệnh sql
		String sql = "update ChiTietHoaDon set damua = 1 where mahd = ?";
		//B3: Tạo câu lệnh
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setLong(1, mahd);
				
		//B4: Thực hiện câu lệnh
		int kq = cmd.executeUpdate();
				
		//B5: Đóng rs va kết nôi
		cmd.close();
		kn.cn.close();
				
		return kq;
	}
	
	public int Xoa(long machd) throws Exception {
		//B1: Kết nối vào csdl
		KetNoidao kn = new KetNoidao();
		kn.ketnoi();
		//B2: Tạo câu lệnh sql
		String sql = "delete from ChiTietHoaDon where machd = ?";
		//B3: Tạo câu lệnh
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setLong(1, machd);
				
		//B4: Thực hiện câu lệnh
		int kq = cmd.executeUpdate();
				
		//B5: Đóng rs va kết nôi
		cmd.close();
		kn.cn.close();
				
		return kq;
	}
	
	public ArrayList<xacNhanCTbean> getHDChuaXacNhan() throws Exception {
		ArrayList<xacNhanCTbean> ds = new ArrayList<xacNhanCTbean>();
		
		//B1: Kết nối vào csdl
		KetNoidao kn = new KetNoidao();
		kn.ketnoi();
		//B2: Tạo câu lệnh sql
		String sql = "SELECT * FROM VXacNhan";
		//B3: Tạo câu lệnh
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		//B4: Thực hiện câu lệnh
		ResultSet rs = cmd.executeQuery();
		//B5: Duyệt rs de luu vao ds
		while(rs.next()) {
			long machd = rs.getLong("machd");
			long mahd = rs.getLong("mahd");
			Date ngaymua = rs.getDate("ngaymua");
			long makh = rs.getLong("makh");
			String tenkh = rs.getString("tenkh");
			String tenphim = rs.getString("tenphim");
			long gia = rs.getLong("gia");
			long thue = rs.getLong("thue");
			Boolean damua = rs.getBoolean("damua");
			long thanhtien = rs.getLong("thanhtien");
			
			ds.add(new xacNhanCTbean(machd, mahd, ngaymua, makh, tenkh, tenphim, gia, thue, damua, thanhtien));
		}
		//B6: Đóng rs va kết nôi
		rs.close();
		kn.cn.close();
		return ds;
	}
}
