package bean;

import java.util.Date;

public class xacNhanCTbean {
	private long machd;
	private long mahd;
	private Date ngaymua;
	private long makh;
	private String tenkh;
	private String tenphim;
	private long gia;
	private long thue;
	private Boolean damua;
	private long thanhtien;
	
	public xacNhanCTbean() {
		super();
	}

	public xacNhanCTbean(long machd, long mahd, Date ngaymua, long makh, String tenkh, String tenphim, long gia,
			long thue, Boolean damua, long thanhtien) {
		super();
		this.machd = machd;
		this.mahd = mahd;
		this.ngaymua = ngaymua;
		this.makh = makh;
		this.tenkh = tenkh;
		this.tenphim = tenphim;
		this.gia = gia;
		this.thue = thue;
		this.damua = damua;
		this.thanhtien = thanhtien;
	}

	public long getMachd() {
		return machd;
	}

	public void setMachd(long machd) {
		this.machd = machd;
	}

	public long getMahd() {
		return mahd;
	}

	public void setMahd(long mahd) {
		this.mahd = mahd;
	}

	public Date getNgaymua() {
		return ngaymua;
	}

	public void setNgaymua(Date ngaymua) {
		this.ngaymua = ngaymua;
	}

	public long getMakh() {
		return makh;
	}

	public void setMakh(long makh) {
		this.makh = makh;
	}

	public String getTenkh() {
		return tenkh;
	}

	public void setTenkh(String tenkh) {
		this.tenkh = tenkh;
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
}
