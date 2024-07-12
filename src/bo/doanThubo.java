package bo;

import java.util.ArrayList;

import bean.doanhThubean;
import bean.thongKeDTbean;
import dao.doanhThudao;

public class doanThubo {
	doanhThudao dtdao = new doanhThudao();
	
	public ArrayList<doanhThubean> getDT() throws Exception {
		return dtdao.getDT();
	}
	
	public ArrayList<doanhThubean> DTNgay() throws Exception {
		return dtdao.DTNgay();
	}
	
	public ArrayList<doanhThubean> DTThang() throws Exception {
		return dtdao.DTThang();
	}
	
	public long daBanNgay() throws Exception {
		int count = 0;
		
		for(doanhThubean i : DTNgay()) {
			count += i.getBan();
		}
		
		return count;
	}
	
	public long thuNhapNgay() throws Exception {
		long sum = 0;
		
		for(doanhThubean i : DTNgay()) {
			sum += i.getThanhtien();
		}
		
		return sum;	
	}
	
	public long thuNhapThang() throws Exception {
		long sum = 0;
		
		for(doanhThubean i : DTThang()) {
			sum += i.getThanhtien();
		}
		
		return sum;	
	}
	
	public long tongDT() throws Exception {
		long sum = 0;
		
		for(doanhThubean i : getDT()) {
			sum += i.getThanhtien();
		}
		
		return sum;
	}
	
	public long tongSPTHue() throws Exception {
		long sum = 0;
		
		for(doanhThubean i : getDT()) {
			sum += i.getSoluong();
		}
		
		return sum;
	}
	
	public ArrayList<thongKeDTbean> TKThang() throws Exception {
		return dtdao.TKThang();
	}
	
	public ArrayList<doanhThubean> bieuDoDT() throws Exception {
		return dtdao.bieuDoDT();
	}
	
	public static void main(String[] args) {
		try {
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
	}
}
