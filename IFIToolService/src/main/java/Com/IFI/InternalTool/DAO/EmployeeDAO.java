package Com.IFI.InternalTool.DAO;

import javax.persistence.Query;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import Com.IFI.InternalTool.Model.Employee;
@Repository
@Transactional(rollbackFor = Exception.class)
public class EmployeeDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
 
    public Employee findUserAccount(String userName) {
    	Session session = this.sessionFactory.getCurrentSession();
    	String hql = "FROM Employee WHERE username = :userName";
		Query query = session.createQuery(hql);
		query.setParameter("userName", userName);
		Employee rs = (Employee)query.getSingleResult();
		session.close();
		return rs;
    }

}
