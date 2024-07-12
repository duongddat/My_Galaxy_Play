package bean;

public class bieuDobean {
	private String maloai;
	private String tenloai;
	private long soluong;
	
	public bieuDobean() {
		super();
	}

	public bieuDobean(String maloai, String tenloai, long soluong) {
		super();
		this.maloai = maloai;
		this.tenloai = tenloai;
		this.soluong = soluong;
	}
	
	public String getMaloai() {
		return maloai;
	}
	public void setMaloai(String maloai) {
		this.maloai = maloai;
	}
	public String getTenloai() {
		return tenloai;
	}
	public void setTenloai(String tenloai) {
		this.tenloai = tenloai;
	}
	public long getSoluong() {
		return soluong;
	}
	public void setSoluong(long soluong) {
		this.soluong = soluong;
	}
}
