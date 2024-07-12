package bo;

import java.util.ArrayList;

import bean.lichSuMuabean;
import dao.lichSuMuadao;

public class lichSuMuabo {
	lichSuMuadao lsdao = new lichSuMuadao();
	
	public ArrayList<lichSuMuabean> getLS(long makh) throws Exception {
		return lsdao.getLS(makh);
	}
	
	public ArrayList<lichSuMuabean> getLSDaTT(long makh) throws Exception {
		ArrayList<lichSuMuabean> tam = new ArrayList<lichSuMuabean>();
		
		for(lichSuMuabean i : getLS(makh)) {
			if(i.getDamua() == true) {
				tam.add(i);
			}
		}
		
		return tam;
	}
	
	public ArrayList<lichSuMuabean> getLSChuaTT(long makh) throws Exception {
		ArrayList<lichSuMuabean> tam = new ArrayList<lichSuMuabean>();
		
		for(lichSuMuabean i : getLS(makh)) {
			if(i.getDamua() == false) {
				tam.add(i);
			}
		}
		
		return tam;
	}
	
	public long thanhToan(long makh) throws Exception {
		long tong = 0;
		for(lichSuMuabean i : getLS(makh)) {
			if(i.getDamua() == false) {
				tong += i.getThanhtien();
			}
		}
		return tong;
	}
}
