package com.mycompany.petbuddyy.dao;

import com.mycompany.petbuddyy.entities.product;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class ProductDao {
    private SessionFactory factory;

    public ProductDao(SessionFactory factory) {
        this.factory = factory;
    }

    public boolean saveProduct(product product) {
        boolean f = false;
        try {
            Session session = this.factory.openSession();
            Transaction tx = session.beginTransaction();
            session.save(product);
            tx.commit();
            session.close();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
            f = false;
        }
        return f;
    }

    //get all products
    public List<product> getAllProduct() {
        Session s = this.factory.openSession();
        Query query = s.createQuery("from product");
        List<product> list = query.list();
        return list;
    }

    //get all products of given category
    public List<product> getAllProductById(int cid) {
        Session s = this.factory.openSession();
        Query query = s.createQuery("from product as p where p.category.categoryId =: id");
        query.setParameter("id", cid);
        List<product> list = query.list();
        return list;
    }

    public List<product> getFirstFourProducts() {
        Session s = this.factory.openSession();
        Query query = s.createQuery("from product");
        query.setMaxResults(4);
        List<product> list = query.list();
        return list;
    }

}
