package bean;

public class gioHangbean {
	private String maphim;
	private String tenphim;
	private String image;
	private long thue;
	private long gia;
	private long thanhtien;
	
	public gioHangbean() {
		super();
	}

	public gioHangbean(String maphim, String tenphim, String image, long thue, long gia, long thanhtien) {
		super();
		this.maphim = maphim;
		this.tenphim = tenphim;
		this.image = image;
		this.thue = thue;
		this.gia = gia;
		this.thanhtien = thanhtien;
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

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public long getThue() {
		return thue;
	}

	public void setThue(long thue) {
		this.thue = thue;
	}

	public long getGia() {
		return gia;
	}

	public void setGia(long gia) {
		this.gia = gia;
	}

	public long getThanhtien() {
		return thanhtien;
	}

	public void setThanhtien(long thanhtien) {
		this.thanhtien = thanhtien;
	}
}
