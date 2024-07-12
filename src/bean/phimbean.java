package bean;

import java.util.Date;

public class phimbean {
	private String maphim;
	private String tenphim;
	private long gia;
	private String maloai;
	private String tacgia;
	private String image;
	private String video;
	private Date ngaynhap;
	private String dienvien;
	private String mota;
	
	public phimbean() {
		super();
	}

	public phimbean(String maphim, String tenphim, long gia, String maloai, String tacgia, String image, String video,
			Date ngaynhap, String dienvien, String mota) {
		super();
		this.maphim = maphim;
		this.tenphim = tenphim;
		this.gia = gia;
		this.maloai = maloai;
		this.tacgia = tacgia;
		this.image = image;
		this.video = video;
		this.ngaynhap = ngaynhap;
		this.dienvien = dienvien;
		this.mota = mota;
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

	public String getMaloai() {
		return maloai;
	}

	public void setMaloai(String maloai) {
		this.maloai = maloai;
	}

	public String getTacgia() {
		return tacgia;
	}

	public void setTacgia(String tacgia) {
		this.tacgia = tacgia;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getVideo() {
		return video;
	}

	public void setVideo(String video) {
		this.video = video;
	}

	public Date getNgaynhap() {
		return ngaynhap;
	}

	public void setNgaynhap(Date ngaynhap) {
		this.ngaynhap = ngaynhap;
	}

	public String getDienvien() {
		return dienvien;
	}

	public void setDienvien(String dienvien) {
		this.dienvien = dienvien;
	}

	public String getMota() {
		return mota;
	}

	public void setMota(String mota) {
		this.mota = mota;
	}
}
