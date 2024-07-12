package bo;

import java.util.ArrayList;

import bean.phimbean;
import dao.phimdao;

public class phimbo {
	phimdao pdao = new phimdao();
	ArrayList<phimbean> ds;
	
	public ArrayList<phimbean> getPhim() throws Exception {
		ds = pdao.getPhim();
		return ds;
	}
	
	public ArrayList<phimbean> sortNew() throws Exception {
		return pdao.sortNew();
	}
	
	public ArrayList<phimbean> phimLienQuan(String maloai, String mp) throws Exception {
		ArrayList<phimbean> tam = new ArrayList<phimbean>();
		
		for(phimbean i : getPhim()) {
			if(i.getMaloai().equals(maloai) && !i.getMaphim().equals(mp)) {
				tam.add(i);
			}	
		}
		
		return tam;
	}
	
	public ArrayList<phimbean> TimLoai(String maloai) throws Exception {
		ArrayList<phimbean> tam = new ArrayList<phimbean>();
		
		for(phimbean i : getPhim()) {
			if(i.getMaloai().equals(maloai)) {
				tam.add(i);
			}	
		}
		
		return tam;
	}
	
	public ArrayList<phimbean> TimPhim(String key) throws Exception {
		ArrayList<phimbean> tam = new ArrayList<phimbean>();
		
		for(phimbean i : getPhim()) {
			if(i.getTenphim().toLowerCase().contains(key.toLowerCase())
				|| i.getTacgia().toLowerCase().contains(key.toLowerCase())
				|| i.getDienvien().toLowerCase().contains(key.toLowerCase())
				|| i.getMota().toLowerCase().contains(key.toLowerCase())) {
				tam.add(i);
			}
		}
		
		return tam;
	}
	
	public phimbean getDetail(String mp) throws Exception {
		phimbean p = new phimbean();
		
		for(phimbean i: getPhim()) {
			if(i.getMaphim().equals(mp)) {
				p = i;
				break;
			}
		}
		return p;
	}
	
	public String getImg(String mp) throws Exception {
		String img = null;
		for(phimbean i : getPhim()) {
			if(i.getMaphim().trim().equals(mp.trim())) {
				img = i.getImage();
			}
		}
		return img;
	}
	
	public String getVideo(String mp) throws Exception {
		String video = null;
		for(phimbean i : getPhim()) {
			if(i.getMaphim().trim().equals(mp.trim())) {
				video = i.getVideo();
			}
		}
		return video;
	}
	
	public int Them(String maphim, String tenphim, long gia, String maloai, String tacgia, String image, String video,
			String dienvien, String mota) throws Exception {
		for(phimbean i : getPhim()) {
			if(i.getMaphim().equals(maphim)) {
				return 0;
			}
		}
		
		return pdao.Them(maphim, tenphim, gia, maloai, tacgia, image, video, dienvien, mota);
	}
	
	public int Xoa(String maphim) throws Exception {
		return pdao.Xoa(maphim);
	}
	
	public int Sua(String maphim, String tenphim, long gia, String maloai, String tacgia, String image, String video,
			String dienvien, String mota) throws Exception {
		return pdao.Sua(maphim, tenphim, gia, maloai, tacgia, image, video, dienvien, mota);
	}
	
	public int countSL() throws Exception {
		return getPhim().size();
	}
	
	public static void main(String[] args) {
		try {
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
	}
}
