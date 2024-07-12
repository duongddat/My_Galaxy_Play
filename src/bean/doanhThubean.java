package bean;

import java.util.Date;

public class doanhThubean {
	private long mahd;
	private long soluong;
	private Date ngaymua;
	private Boolean damua;
	private long thanhtien;
	private long ban;
	
	public doanhThubean() {
		super();
	}

	public doanhThubean(long mahd, long soluong, Date ngaymua, Boolean damua, long thanhtien, long ban) {
		super();
		this.mahd = mahd;
		this.soluong = soluong;
		this.ngaymua = ngaymua;
		this.damua = damua;
		this.thanhtien = thanhtien;
		this.ban = ban;
	}
	
	
	public long getMahd() {
		return mahd;
	}
	public void setMahd(long mahd) {
		this.mahd = mahd;
	}
	public long getSoluong() {
		return soluong;
	}
	public void setSoluong(long soluong) {
		this.soluong = soluong;
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
	public long getThanhtien() {
		return thanhtien;
	}
	public void setThanhtien(long thanhtien) {
		this.thanhtien = thanhtien;
	}
	public long getBan() {
		return ban;
	}
	public void setBan(long ban) {
		this.ban = ban;
	}
}
