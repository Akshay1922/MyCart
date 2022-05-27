package com.learn.mycart.dao;


import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.learn.mycart.entities.Categary;

public class CategoryDao {
	
	private SessionFactory factory;

	public CategoryDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}
	
	public int saveCategory(Categary cat)
	{
		Session session= this.factory.openSession();
		Transaction tx = session.beginTransaction();
		int catId = (Integer) session.save(cat);
		
		session.save(cat);
		tx.commit();
		session.close();
		return catId;
	}
	
	public List<Categary> getCategories()
	{
		Session s = this.factory.openSession();
		Query query = s.createQuery("from Categary");
		List<Categary> list = query.list();
		return list;
	}
	
	public Categary getCategoryById(int cid)
	{
		Categary cat = null;
		try {
			
			Session session = this.factory.openSession();
			cat = session.get(Categary.class, cid);	
			session.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cat;
		
	}

}
