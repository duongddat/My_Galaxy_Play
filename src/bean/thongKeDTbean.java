package bean;

public class thongKeDTbean {
	private int month;
	private long doanhthu;
	
	public thongKeDTbean() {
		super();
	}

	public thongKeDTbean(int month, long doanhthu) {
		super();
		this.month = month;
		this.doanhthu = doanhthu;
	}
	
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	public long getDoanhthu() {
		return doanhthu;
	}
	public void setDoanhthu(long doanhthu) {
		this.doanhthu = doanhthu;
	}
}
