package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.bieuDobean;

public class bieuDodao {
	public ArrayList<bieuDobean> getBDLoai() throws Exception {
		ArrayList<bieuDobean> ds = new ArrayList<bieuDobean>();
		
		//B1: Kết nối vào CSDL
		KetNoidao kn = new KetNoidao();
		kn.ketnoi();
		//B2: Tạo câu lệnh SQL
		String sql = "SELECT * FROM VBieuDo";
		//B3: Tạo câu lệnh
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		//B4: Thực hiện câu lệnh
		ResultSet rs = cmd.executeQuery();
		//B5: Duyệt rs để lưu vào ds
		while(rs.next()) {
			String maloai = rs.getString("maloai");
			String tenloai = rs.getString("tenloai");
			long soluong = rs.getLong("soluong");
			ds.add(new bieuDobean(maloai, tenloai, soluong));
		}
		//B6: Đóng rs và kết nối
		rs.close();
		kn.cn.close();
		return ds;
	}
}
