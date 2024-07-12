package bo;

import bean.adminbean;
import dao.admindao;

public class adminbo {
	admindao adao = new admindao();
	
	public adminbean login(String username, String pass) throws Exception {
		return adao.login(username, pass);
	}
}
