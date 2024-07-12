package bo;

import java.util.ArrayList;

import bean.xacNhanHDbean;
import dao.hoaDondao;

public class hoaDonbo {
	hoaDondao hddao = new hoaDondao();
	
	public int Them (long makh) throws Exception {	
		return hddao.Them(makh);
	}
	
	public int Xoa() throws Exception {
		return hddao.Xoa();
	}
	
	public long getMaxHD() throws Exception {
		return hddao.getMaxHD();
	}
	
	public int CapNhat(long MaHoaDon) throws Exception {
		return hddao.CapNhat(MaHoaDon);
		
	}
	
	public int TuDongCapNhat() throws Exception {
		return hddao.TuDongCapNhat();
	}
	
	public ArrayList<xacNhanHDbean> getHDXacNhan() throws Exception {
		return hddao.getHDXacNhan();
	}
}
