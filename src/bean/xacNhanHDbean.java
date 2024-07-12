package bean;

import java.util.Date;

public class xacNhanHDbean {
	private long mahd;
	private String tenkh;
	private Date ngaymua;
	private long tong;
	
	public xacNhanHDbean() {
		super();
	}

	public xacNhanHDbean(long mahd, String tenkh, Date ngaymua, long tong) {
		super();
		this.mahd = mahd;
		this.tenkh = tenkh;
		this.ngaymua = ngaymua;
		this.tong = tong;
	}

	public long getMahd() {
		return mahd;
	}

	public void setMahd(long mahd) {
		this.mahd = mahd;
	}

	public String getTenkh() {
		return tenkh;
	}

	public void setTenkh(String tenkh) {
		this.tenkh = tenkh;
	}

	public Date getNgaymua() {
		return ngaymua;
	}

	public void setNgaymua(Date ngaymua) {
		this.ngaymua = ngaymua;
	}

	public long getTong() {
		return tong;
	}

	public void setTong(long tong) {
		this.tong = tong;
	}
}
