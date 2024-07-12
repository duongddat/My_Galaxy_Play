package bo;

import java.util.ArrayList;

import bean.gioHangbean;

public class gioHangbo {
	public ArrayList<gioHangbean> ds = new ArrayList<gioHangbean>();
	
	public void Them(String mp, String tp, String img, long gia) throws Exception {
		int n = ds.size();
		//Check có phim trong giỏ chưa
		for(int i = 0; i < n; i++) {
			if(ds.get(i).getMaphim().toLowerCase().equals(mp.toLowerCase())) {
				long sl  = ds.get(i).getThue() + 1;
				long g = ds.get(i).getGia();
				long tt = sl * g;
				ds.get(i).setThue(sl);
				ds.get(i).setThanhtien(tt);
				return;
			}
		}
		//Thêm phim mới
		gioHangbean phim =  new gioHangbean(mp, tp, img, 1, gia, gia);
		ds.add(phim);
	}
	
	public void Sua(String mp,long thue) throws Exception {
		int n = ds.size();
		
		for(int i = 0; i < n; i++) {
			gioHangbean p = ds.get(i);
			if(p.getMaphim().toLowerCase().trim().equals(mp.toLowerCase().trim())) {
				p.setThue(thue);
				p.setThanhtien(thue * p.getGia());
				ds.set(i, p);
				return;
			}
		}
	}
	
	public void Xoa(String mp) throws Exception {
		int n = ds.size();
		
		for(int i = 0; i < n; i++) {
			gioHangbean p = ds.get(i);
			if(p.getMaphim().trim().equals(mp.trim())) {
				ds.remove(i);
				return;
			}
		}
	}
	
	public long TongTien() throws Exception {
		int n = ds.size();
		long s = 0;
		
		for(int i = 0; i < n; i++) {
			s = s + ds.get(i).getThanhtien();
		}
		
		return s;
	}
}
