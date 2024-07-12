package bo;

import java.util.ArrayList;

import bean.loaibean;
import dao.loaidao;

public class loaibo {
	loaidao ldao = new loaidao();
	
	public ArrayList<loaibean> getloai() throws Exception {
		return ldao.getloai();
	}
	
	public String Tim(String maloai) throws Exception {
		for(loaibean l: getloai()) {
			if(l.getMaloai().equals(maloai)) {
				return l.getTenloai();
			}
		}
		return null;
	}
	
	public ArrayList<loaibean> Search(String tim) throws Exception {
		ArrayList<loaibean> tam = new ArrayList<loaibean>();
		
		for(loaibean l: getloai()) {
			if(l.getTenloai().contains(tim)) {
				tam.add(l);
			}
		}
		
		return tam;
	}
	
	public int Them(String maloai, String tenloai) throws Exception {
		for(loaibean i : getloai()) {
			if(i.getMaloai().equals(maloai)) {
				return 0;
			}
		}
		return ldao.Them(maloai, tenloai);
	}
	
	public int Xoa(String maloai) throws Exception {
		return ldao.Xoa(maloai);
	}
	
	public int Sua(String maloai, String tenloai) throws Exception {
		return ldao.Sua(maloai, tenloai);
	}
	
	public int countSL() throws Exception {
		return getloai().size();
	}
	
	public static void main(String[] args) {
		try {
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
	}
}
