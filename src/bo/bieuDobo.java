package bo;

import java.util.ArrayList;

import bean.bieuDobean;
import dao.bieuDodao;

public class bieuDobo {
	bieuDodao bddao = new bieuDodao();
	
	public ArrayList<bieuDobean> getBDLoai() throws Exception {
		return bddao.getBDLoai();
	}
}
