package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.loaibean;

public class loaidao {
	public ArrayList<loaibean> getloai() throws Exception {
		ArrayList<loaibean> ds = new ArrayList<loaibean>();
		//B1: Kết nối vào csdl
		KetNoidao kn = new KetNoidao();
		kn.ketnoi();
		//B2: Tạo câu lệnh sql
		String sql = "SELECT * FROM Loai";
		//B3: Tạo câu lệnh
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		//B4: Thực hiện câu lệnh
		ResultSet rs = cmd.executeQuery();
		//B5: Duyệt rs de luu vao ds
		while(rs.next()) {
			String maloai = rs.getString("maloai");
			String tenloai = rs.getString("tenloai");
			ds.add(new loaibean(maloai, tenloai));
		}
		//B6: Đóng rs va kết nôi
		rs.close();
		kn.cn.close();
		return ds;
	}
	
	public int Them(String maloai, String tenloai) throws Exception {
		//B1: Kết nối vào csdl
		KetNoidao kn = new KetNoidao();
		kn.ketnoi();
		//B2: Tạo câu lệnh sql
		String sql = "insert into Loai(maloai,tenloai) values (?,?)";
		//B3: Tạo câu lệnh
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, maloai);
		cmd.setString(2, tenloai);
		
		//B4: Thực hiện câu lệnh
		int kq = cmd.executeUpdate();
		
		//B5: Đóng rs va kết nôi
		cmd.close();
		kn.cn.close();
		
		return kq;
	}
	
	public int Xoa(String maloai) throws Exception {
		//B1: Kết nối vào csdl
		KetNoidao kn = new KetNoidao();
		kn.ketnoi();
		//B2: Tạo câu lệnh sql
		String sql = "delete from Loai where maloai=?";
		//B3: Tạo câu lệnh
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, maloai);
				
		//B4: Thực hiện câu lệnh
		int kq = cmd.executeUpdate();
				
		//B5: Đóng rs va kết nôi
		cmd.close();
		kn.cn.close();
				
		return kq;
	}
	
	public int Sua(String maloai,String tenloai) throws Exception {
		//B1: Kết nối vào csdl
		KetNoidao kn = new KetNoidao();
		kn.ketnoi();
		//B2: Tạo câu lệnh sql
		String sql = "update Loai set tenloai = ? where maloai = ?";
		//B3: Tạo câu lệnh
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, tenloai);
		cmd.setString(2, maloai);
				
		//B4: Thực hiện câu lệnh
		int kq = cmd.executeUpdate();
				
		//B5: Đóng rs va kết nôi
		cmd.close();
		kn.cn.close();
				
		return kq;
	}
}
