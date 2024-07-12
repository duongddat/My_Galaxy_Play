package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import bean.lichSuMuabean;

public class lichSuMuadao {
	public ArrayList<lichSuMuabean> getLS(long makh) throws Exception {
		ArrayList<lichSuMuabean> ds = new ArrayList<lichSuMuabean>();
		//B1: Kết nối vào csdl
		KetNoidao kn = new KetNoidao();
		kn.ketnoi();
		//B2: Tạo câu lệnh sql
		String sql = "select * from VLichSu where makh = ? order by ngaymua desc";
		//B3: Tạo câu lệnh
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setLong(1, makh);
		//B4: Thực hiện câu lệnh
		ResultSet rs = cmd.executeQuery();
		//B5: Duyệt rs de luu vao ds
		while(rs.next()) {
			String maphim = rs.getString("maphim");
			String tenphim = rs.getString("tenphim");
			long gia = rs.getLong("gia");
			long thue = rs.getLong("thue");
			Date ngaymua = rs.getDate("ngaymua");
			Boolean damua = rs.getBoolean("damua");
			long thanhtien = rs.getLong("thanhtien");
			long makh1 = rs.getLong("makh");
			ds.add(new lichSuMuabean(maphim, tenphim, gia, thue, ngaymua, damua, thanhtien, makh1));
		}
		//B6: Đóng rs va kết nôi
		rs.close();
		kn.cn.close();
		return ds;
	}
}
