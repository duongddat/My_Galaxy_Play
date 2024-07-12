package bean;

import java.util.Date;

public class lichSuMuabean {
	private String maphim;
	private String tenphim;
	private long gia;
	private long thue;
	private Date ngaymua;
	private Boolean damua;
	private long thanhtien;
	private long makh;
		
	public lichSuMuabean() {
		super();
	}

	public lichSuMuabean(String maphim, String tenphim, long gia, long thue, Date ngaymua, Boolean damua,
			long thanhtien, long makh) {
		super();
		this.maphim = maphim;
		this.tenphim = tenphim;
		this.gia = gia;
		this.thue = thue;
		this.ngaymua = ngaymua;
		this.damua = damua;
		this.thanhtien = thanhtien;
		this.makh = makh;
	}

	public String getMaphim() {
		return maphim;
	}

	public void setMaphim(String maphim) {
		this.maphim = maphim;
	}

	public String getTenphim() {
		return tenphim;
	}

	public void setTenphim(String tenphim) {
		this.tenphim = tenphim;
	}

	public long getGia() {
		return gia;
	}

	public void setGia(long gia) {
		this.gia = gia;
	}

	public long getThue() {
		return thue;
	}

	public void setThue(long thue) {
		this.thue = thue;
	}

	public Date getNgaymua() {
		return ngaymua;
	}

	public void setNgaymua(Date ngaymua) {
		this.ngaymua = ngaymua;
	}

	public Boolean getDamua() {
		return damua;
	}

	public void setDamua(Boolean damua) {
		this.damua = damua;
	}

	public long getMakh() {
		return makh;
	}

	public void setMakh(long makh) {
		this.makh = makh;
	}

	public long getThanhtien() {
		return thanhtien;
	}

	public void setThanhtien(long thanhtien) {
		this.thanhtien = thanhtien;
	}
	
}
