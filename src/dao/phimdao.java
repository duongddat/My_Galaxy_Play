package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import bean.phimbean;

public class phimdao {
	public ArrayList<phimbean> getPhim() throws Exception {
		ArrayList<phimbean> ds = new ArrayList<phimbean>();
		
		//B1: Kết nối vào CSDL
		KetNoidao kn = new KetNoidao();
		kn.ketnoi();
		//B2: Tạo câu lệnh SQL
		String sql = "SELECT * FROM Phim";
		//B3: Tạo câu lệnh
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		//B4: Thực hiện câu lệnh
		ResultSet rs = cmd.executeQuery();
		//B5: Duyệt rs để lưu vào ds
		while(rs.next()) {
			String maphim = rs.getString("maphim"); 
			String tenphim = rs.getString("tenphim");
			long gia = rs.getLong("gia");
			String maloai = rs.getString("maloai");
			String tacgia = rs.getString("tacgia");
			String image = rs.getString("image");
			String video = rs.getString("video");
			Date ngaynhap = rs.getDate("ngaynhap");
			String dienvien = rs.getString("dienvien");
			String mota = rs.getString("mota");
			ds.add(new phimbean(maphim, tenphim, gia, maloai, tacgia, image, video, ngaynhap, dienvien, mota));
		}
		//B6: Đóng rs và kết nối
		rs.close();
		kn.cn.close();
		return ds;
	}
	
	public ArrayList<phimbean> sortNew() throws Exception {
		ArrayList<phimbean> ds = new ArrayList<phimbean>();
		
		//B1: Kết nối vào CSDL
		KetNoidao kn = new KetNoidao();
		kn.ketnoi();
		//B2: Tạo câu lệnh SQL
		String sql = "SELECT * FROM Phim ORDER BY ngaynhap desc";
		//B3: Tạo câu lệnh
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		//B4: Thực hiện câu lệnh
		ResultSet rs = cmd.executeQuery();
		//B5: Duyệt rs để lưu vào ds
		while(rs.next()) {
			String maphim = rs.getString("maphim"); 
			String tenphim = rs.getString("tenphim");
			long gia = rs.getLong("gia");
			String maloai = rs.getString("maloai");
			String tacgia = rs.getString("tacgia");
			String image = rs.getString("image");
			String video = rs.getString("video");
			Date ngaynhap = rs.getDate("ngaynhap");
			String dienvien = rs.getString("dienvien");
			String mota = rs.getString("mota");
			ds.add(new phimbean(maphim, tenphim, gia, maloai, tacgia, image, video, ngaynhap, dienvien, mota));
		}
		//B6: Đóng rs và kết nối
		rs.close();
		kn.cn.close();
		return ds;
	}
	
	public int Them(String maphim, String tenphim, long gia, String maloai, String tacgia, String image, String video,
			String dienvien, String mota) throws Exception {
		//B1: Kết nối vào csdl
		KetNoidao kn = new KetNoidao();
		kn.ketnoi();
		//B2: Tạo câu lệnh sql
		String sql = "insert into Phim(maphim, tenphim, gia, maloai, tacgia, image, video, ngaynhap, dienvien, mota) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		//B3: Tạo câu lệnh
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, maphim);
		cmd.setString(2, tenphim);
		cmd.setLong(3, gia);
		cmd.setString(4, maloai);
		cmd.setString(5, tacgia);
		cmd.setString(6, image);
		cmd.setString(7, video);
		
		//Lấy ngày  giờ hiện tại
		Date n1 = new Date();
		SimpleDateFormat dd = new SimpleDateFormat("yyyy-MM-dd");
		//Đổi ngày until sang chuổi theo định dạng
		String tam = dd.format(n1);
		Date n2 = dd.parse(tam); //Đổi chuổi ra ngày until
		//Đổi ngày until sang ngày sql và đưa vào tham số
		cmd.setDate(8, new java.sql.Date(n2.getTime()));
		cmd.setString(9, dienvien);
		cmd.setString(10, mota);
		
		//B4: Thực hiện câu lệnh
		int kq = cmd.executeUpdate();
		
		//B5: Đóng rs va kết nôi
		cmd.close();
		kn.cn.close();
		
		return kq;
	}
	
	public int Xoa(String maphim) throws Exception {
		//B1: Kết nối vào csdl
		KetNoidao kn = new KetNoidao();
		kn.ketnoi();
		//B2: Tạo câu lệnh sql
		String sql = "delete from Phim where maphim=?";
		//B3: Tạo câu lệnh
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, maphim);
				
		//B4: Thực hiện câu lệnh
		int kq = cmd.executeUpdate();
				
		//B5: Đóng rs va kết nôi
		cmd.close();
		kn.cn.close();
				
		return kq;
	}
	
	public int Sua(String maphim, String tenphim, long gia, String maloai, String tacgia, String image, String video,
			String dienvien, String mota) throws Exception {
		//B1: Kết nối vào csdl
		KetNoidao kn = new KetNoidao();
		kn.ketnoi();
		//B2: Tạo câu lệnh sql
		String sql = "update Phim set tenphim = ?, gia = ?, maloai = ?, tacgia = ?, image = ?, video = ?, ngaynhap = ?, dienvien = ?, mota = ? where maphim = ?";
		//B3: Tạo câu lệnh
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, tenphim);
		cmd.setLong(2, gia);
		cmd.setString(3, maloai);
		cmd.setString(4, tacgia);
		cmd.setString(5, image);
		cmd.setString(6, video);
		
		//Lấy ngày  giờ hiện tại
		Date n1 = new Date();
		SimpleDateFormat dd = new SimpleDateFormat("yyyy-MM-dd");
		//Đổi ngày until sang chuổi theo định dạng
		String tam = dd.format(n1);
		Date n2 = dd.parse(tam); //Đổi chuổi ra ngày until
		//Đổi ngày until sang ngày sql và đưa vào tham số
		cmd.setDate(7, new java.sql.Date(n2.getTime()));
		cmd.setString(8, dienvien);
		cmd.setString(9, mota);
		cmd.setString(10, maphim);
		
		//B4: Thực hiện câu lệnh
		int kq = cmd.executeUpdate();
		
		//B5: Đóng rs va kết nôi
		cmd.close();
		kn.cn.close();
		
		return kq;
	}
}
