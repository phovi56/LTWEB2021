package pvb.controller;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import pvb.entity.Products;

@Controller
public class HomeController {
	@Autowired
	SessionFactory factory;
	
	@RequestMapping("/trang-chu")
	public String home(ModelMap model) {
		
		return "web/index";
	}
	
	private List<Products> getCPU(){
		Session session = factory.openSession();
		String hql = "FROM Products WHERE Id_Catalog = 0";
		Query query = session.createQuery(hql);
		List<Products> cPUList = query.list();
		cPUList = cPUList.subList(0, 3);
		return cPUList;
	}
	private List<Products> getMain(){
		Session session = factory.openSession();
		String hql = "FROM Products WHERE Id_Catalog = 1";
		Query query = session.createQuery(hql);
		List<Products> mainList = query.list();
		
		return mainList;
	}
	private List<Products> getVGA(){
		Session session = factory.openSession();
		String hql = "FROM Products WHERE Id_Catalog = 2";
		Query query = session.createQuery(hql);
		List<Products> prodList = query.list();
		
		return prodList;
	}
	private List<Products> getRam(){
		Session session = factory.openSession();
		String hql = "FROM Products WHERE Id_Catalog = 3";
		Query query = session.createQuery(hql);
		List<Products> prodList = query.list();
		
		return prodList;
	}
	private List<Products> getSSD(){
		Session session = factory.openSession();
		String hql = "FROM Products WHERE Id_Catalog = 4";
		Query query = session.createQuery(hql);
		List<Products> prodList = query.list();
		
		return prodList;
	}
	private List<Products> getHeadPhone(){
		Session session = factory.openSession();
		String hql = "FROM Products WHERE Id_Catalog = 5";
		Query query = session.createQuery(hql);
		List<Products> prodList = query.list();
		
		return prodList;
	}
	private List<Products> getKeyBoard(){
		Session session = factory.openSession();
		String hql = "FROM Products WHERE Id_Catalog = 6";
		Query query = session.createQuery(hql);
		List<Products> prodList = query.list();
		
		return prodList;
	}
	private List<Products> getMouse(){
		Session session = factory.openSession();
		String hql = "FROM Products WHERE Id_Catalog = 7";
		Query query = session.createQuery(hql);
		List<Products> prodList = query.list();
		
		return prodList;
	}
}
