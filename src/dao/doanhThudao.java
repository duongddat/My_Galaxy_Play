package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import bean.doanhThubean;
import bean.thongKeDTbean;

public class doanhThudao {
	public ArrayList<doanhThubean> getDT() throws Exception {
		ArrayList<doanhThubean> ds = new ArrayList<doanhThubean>();
		
		//B1: Kết nối vào CSDL
		KetNoidao kn = new KetNoidao();
		kn.ketnoi();
		//B2: Tạo câu lệnh SQL
		String sql = "select * from VDoanhThu";
		//B3: Tạo câu lệnh
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		//B4: Thực hiện câu lệnh
		ResultSet rs = cmd.executeQuery();
		//B5: Duyệt rs để lưu vào ds
		while(rs.next()) {
			long mahd = rs.getLong("mahd");
			long soluong = rs.getLong("soluong");
			Date ngaymua = rs.getDate("ngaymua");
			Boolean damua = rs.getBoolean("damua");
			long thanhtien = rs.getLong("thanhtien");
			long ban = rs.getLong("ban");
			ds.add(new doanhThubean(mahd, soluong, ngaymua, damua, thanhtien, ban));
		}
		//B6: Đóng rs và kết nối
		rs.close();
		kn.cn.close();
		return ds;
	}
	
	public ArrayList<doanhThubean> bieuDoDT() throws Exception {
		ArrayList<doanhThubean> ds = new ArrayList<doanhThubean>();
		
		//B1: Kết nối vào CSDL
		KetNoidao kn = new KetNoidao();
		kn.ketnoi();
		//B2: Tạo câu lệnh SQL
		String sql = "select * from VDoanhThu where DATEDIFF(day,ngaymua, GETDATE()) < 7";
		//B3: Tạo câu lệnh
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		//B4: Thực hiện câu lệnh
		ResultSet rs = cmd.executeQuery();
		//B5: Duyệt rs để lưu vào ds
		while(rs.next()) {
			long mahd = rs.getLong("mahd");
			long soluong = rs.getLong("soluong");
			Date ngaymua = rs.getDate("ngaymua");
			Boolean damua = rs.getBoolean("damua");
			long thanhtien = rs.getLong("thanhtien");
			long ban = rs.getLong("ban");
			ds.add(new doanhThubean(mahd, soluong, ngaymua, damua, thanhtien, ban));
		}
		//B6: Đóng rs và kết nối
		rs.close();
		kn.cn.close();
		return ds;
	}
	
	public ArrayList<doanhThubean> DTNgay() throws Exception {
		ArrayList<doanhThubean> ds = new ArrayList<doanhThubean>();
		
		//B1: Kết nối vào CSDL
		KetNoidao kn = new KetNoidao();
		kn.ketnoi();
		//B2: Tạo câu lệnh SQL
		String sql = "select * from VDoanhThu where DAY(ngaymua) = DAY(GETDATE()) and MONTH(ngaymua) = MONTH(GETDATE()) and YEAR(ngaymua) = YEAR(GETDATE())";
		//B3: Tạo câu lệnh
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		//B4: Thực hiện câu lệnh
		ResultSet rs = cmd.executeQuery();
		//B5: Duyệt rs để lưu vào ds
		while(rs.next()) {
			long mahd = rs.getLong("mahd");
			long soluong = rs.getLong("soluong");
			Date ngaymua = rs.getDate("ngaymua");
			Boolean damua = rs.getBoolean("damua");
			long thanhtien = rs.getLong("thanhtien");
			long ban = rs.getLong("ban");
			ds.add(new doanhThubean(mahd, soluong, ngaymua, damua, thanhtien, ban));
		}
		//B6: Đóng rs và kết nối
		rs.close();
		kn.cn.close();
		return ds;
	}
	
	public ArrayList<doanhThubean> DTThang() throws Exception {
		ArrayList<doanhThubean> ds = new ArrayList<doanhThubean>();
		
		//B1: Kết nối vào CSDL
		KetNoidao kn = new KetNoidao();
		kn.ketnoi();
		//B2: Tạo câu lệnh SQL
		String sql = "select * from VDoanhThu where MONTH(ngaymua) = MONTH(GETDATE()) and YEAR(ngaymua) = YEAR(GETDATE())";
		//B3: Tạo câu lệnh
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		//B4: Thực hiện câu lệnh
		ResultSet rs = cmd.executeQuery();
		//B5: Duyệt rs để lưu vào ds
		while(rs.next()) {
			long mahd = rs.getLong("mahd");
			long soluong = rs.getLong("soluong");
			Date ngaymua = rs.getDate("ngaymua");
			Boolean damua = rs.getBoolean("damua");
			long thanhtien = rs.getLong("thanhtien");
			long ban = rs.getLong("ban");
			ds.add(new doanhThubean(mahd, soluong, ngaymua, damua, thanhtien, ban));
		}
		//B6: Đóng rs và kết nối
		rs.close();
		kn.cn.close();
		return ds;
	}
	
	public ArrayList<thongKeDTbean> TKThang() throws Exception {
		ArrayList<thongKeDTbean> ds = new ArrayList<thongKeDTbean>();
		
		//B1: Kết nối vào CSDL
		KetNoidao kn = new KetNoidao();
		kn.ketnoi();
		//B2: Tạo câu lệnh SQL
		String sql = "select MONTH(ngaymua), sum(thanhtien) from VDoanhThu where YEAR(ngaymua) = YEAR(GETDATE())\r\n"
				+ "group by MONTH(ngaymua)";
		//B3: Tạo câu lệnh
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		//B4: Thực hiện câu lệnh
		ResultSet rs = cmd.executeQuery();
		//B5: Duyệt rs để lưu vào ds
		while(rs.next()) {
			int month = rs.getInt(1);
			long doanhthu = rs.getLong(2);
			ds.add(new thongKeDTbean(month, doanhthu));
		}
		//B6: Đóng rs và kết nối
		rs.close();
		kn.cn.close();
		return ds;
	}
}
