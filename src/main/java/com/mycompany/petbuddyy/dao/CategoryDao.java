
package com.mycompany.petbuddyy.dao;

import com.mycompany.petbuddyy.entities.category;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;



public class CategoryDao {
    private SessionFactory factory;

    public CategoryDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    //saves the category to db
    public int saveCategory(category cat){
        
        Session session = this.factory.openSession();        
        Transaction tx = session.beginTransaction();
        
        
        int catId=(int) session.save(cat);
        
        tx.commit();
        session.close();
        return catId;
    }

    public List<category> getCategories() {
        Session s = this.factory.openSession();
        Query query = s.createQuery("from category");
        List<category> list = query.list();
        return list;
    }

    public category getCategoryById(int cid) {
        category cat = null;
        try {
            Session session = this.factory.openSession();
            cat = session.get(category.class, cid);
            session.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return cat;
    }

}
