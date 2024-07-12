package bo;

import bean.khachHangbean;
import dao.khachHangdao;

public class khachHangbo {
	khachHangdao khdao = new khachHangdao();
	
	public khachHangbean khdn(String username, String pass) throws Exception {
		return khdao.khdn(username, pass);
	}
	
	public int khdk(String tenkh, String diachi, String sdt, String email, String username, String pass, String pass1) throws Exception {
		khachHangbean kh = khdao.checkUn(username);
		
		if(kh == null) {
			if(pass.equals(pass1)) {
				return khdao.dkKhachHang(tenkh, diachi, sdt, email, username, pass);
			}
		}
		
		return 0;
	}
	
	public int Sua(long makh, String tenkh, String diachi, String sdt, String email) throws Exception {
		return khdao.Sua(makh, tenkh, diachi, sdt, email);
	}
	
	public int doiMK(long makh, String pass, String pass1) throws Exception {
		if(pass.equals(pass1)) {
			return khdao.doiMK(makh, pass);
		}
		
		return 0;
	}
	
	public long countKH() throws Exception {
		return khdao.countKH();
	}
}
