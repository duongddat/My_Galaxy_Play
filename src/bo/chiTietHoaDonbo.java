package bo;

import java.util.ArrayList;

import bean.xacNhanCTbean;
import dao.chiTietHoaDondao;

public class chiTietHoaDonbo {
	chiTietHoaDondao ctdao = new chiTietHoaDondao();
	
	public int Them(String maphim, long thue, long mahd) throws Exception {
		return ctdao.Them(maphim, thue, mahd);
	}
	
	public ArrayList<xacNhanCTbean> getHDChuaXacNhan() throws Exception {
		return ctdao.getHDChuaXacNhan();
	}
	
	public ArrayList<xacNhanCTbean> timTheoHD(long mahd) throws Exception {
		ArrayList<xacNhanCTbean> tam = new ArrayList<xacNhanCTbean>();
		for(xacNhanCTbean i : getHDChuaXacNhan()) {
			if(i.getMahd() == mahd) {
				tam.add(i);
			}
		}
		
		return tam;
	}
	
	public int CapNhat(long machd) throws Exception {
		return ctdao.CapNhat(machd);
	}
	
	public int CapNhatTheoHD(long mahd) throws Exception {
		return ctdao.CapNhatTheoHD(mahd);
	}
	
	public int Xoa(long machd) throws Exception {
		return ctdao.Xoa(machd);
	}
	
}
