package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import bean.xacNhanHDbean;

public class hoaDondao {
	public int Them(long makh) throws Exception {
		//B1: Kết nối vào csdl
		KetNoidao kn = new KetNoidao();
		kn.ketnoi();
		//B2: Tạo câu lệnh sql
		String sql = "insert into HoaDon(makh, ngaymua, damua) values (?, ?, ?)";
		//B3: Tạo câu lệnh
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setLong(1, makh);
		
		//Lấy ngày  giờ hiện tại
		Date n1 = new Date();
		SimpleDateFormat dd = new SimpleDateFormat("yyyy-MM-dd");
		//Đổi ngày until sang chuổi theo định dạng
		String tam = dd.format(n1);
		Date n2 = dd.parse(tam); //Đổi chuổi ra ngày until
		//Đổi ngày until sang ngày sql và đưa vào tham số
		cmd.setDate(2, new java.sql.Date(n2.getTime()));
		cmd.setBoolean(3, false);
		
		//B4: Thực hiện câu lệnh
		int kq = cmd.executeUpdate();
		
		//B5: Đóng rs va kết nôi
		cmd.close();
		kn.cn.close();
		
		return kq;
	}
	
	public long getMaxHD() throws Exception {
		//B1: Kết nối vào csdl
		KetNoidao kn = new KetNoidao();
		kn.ketnoi();
		//B2: Tạo câu lệnh sql
		String sql = "select MAX(mahd) as MaxHD  from HoaDon";
		//B3: Tạo câu lệnh
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		//B4: Thực hiện câu lệnh
		ResultSet rs = cmd.executeQuery();
		//B5: Duyệt rs de luu vao ds
		long max = 0;
		if(rs.next()) {
			//Lấy về giá trị của cột đầu tiên trong rs
			max = rs.getLong(1);	
		}
		//B6: Đóng rs va kết nôi
		rs.close();
		kn.cn.close();
		return max;
	}
	
	public ArrayList<xacNhanHDbean> getHDXacNhan() throws Exception {
		ArrayList<xacNhanHDbean> ds = new ArrayList<xacNhanHDbean>();
		
		//B1: Kết nối vào csdl
		KetNoidao kn = new KetNoidao();
		kn.ketnoi();
		//B2: Tạo câu lệnh sql
		String sql = "select mahd, tenkh, ngaymua, sum(thanhtien) \r\n"
				+ "from VXacNhan \r\n"
				+ "group by mahd, tenkh, ngaymua ";
		//B3: Tạo câu lệnh
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		//B4: Thực hiện câu lệnh
		ResultSet rs = cmd.executeQuery();
		//B5: Duyệt rs de luu vao ds
		while(rs.next()) {
			long mahd = rs.getLong("mahd");
			String tenkh = rs.getString("tenkh");
			Date ngaymua = rs.getDate("ngaymua");
			long tong = rs.getLong(4);
			ds.add(new xacNhanHDbean(mahd, tenkh, ngaymua, tong));
		}
		//B6: Đóng rs va kết nôi
		rs.close();
		kn.cn.close();
		return ds;
	}
	
	public int CapNhat(long mahd) throws Exception {
		//B1: Kết nối vào csdl
		KetNoidao kn = new KetNoidao();
		kn.ketnoi();
		//B2: Tạo câu lệnh sql
		String sql = "update HoaDon set damua = 1 where mahd = ?";
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
	
	public int TuDongCapNhat() throws Exception {
		//B1: Kết nối vào csdl
		KetNoidao kn = new KetNoidao();
		kn.ketnoi();
		//B2: Tạo câu lệnh sql
		String sql = "UPDATE HoaDon\r\n"
				+ "SET damua = 1\r\n"
				+ "WHERE mahd IN (\r\n"
				+ "    SELECT mahd\r\n"
				+ "    FROM ChiTietHoaDon\r\n"
				+ "    WHERE damua = 1\r\n"
				+ "    AND mahd IN (\r\n"
				+ "        SELECT mahd\r\n"
				+ "        FROM ChiTietHoaDon\r\n"
				+ "        WHERE damua = 1 and mahd = HoaDon.mahd\r\n"
				+ "        GROUP BY mahd \r\n"
				+ "        HAVING COUNT(*) = (\r\n"
				+ "            SELECT COUNT(*)\r\n"
				+ "            FROM ChiTietHoaDon\r\n"
				+ "            WHERE mahd = HoaDon.mahd\r\n"
				+ "        )\r\n"
				+ "    )\r\n"
				+ ")";
		//B3: Tạo câu lệnh
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
				
		//B4: Thực hiện câu lệnh
		int kq = cmd.executeUpdate();
				
		//B5: Đóng rs va kết nôi
		cmd.close();
		kn.cn.close();
				
		return kq;	
	}
	
	public int Xoa() throws Exception {
		//B1: Kết nối vào csdl
		KetNoidao kn = new KetNoidao();
		kn.ketnoi();
		//B2: Tạo câu lệnh sql
		String sql = "delete from hoadon where mahd not in (select distinct mahd from ChiTietHoaDon)";
		//B3: Tạo câu lệnh
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
				
		//B4: Thực hiện câu lệnh
		int kq = cmd.executeUpdate();
				
		//B5: Đóng rs va kết nôi
		cmd.close();
		kn.cn.close();
				
		return kq;
	}
}
