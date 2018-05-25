package Com.IFI.InternalTool.DAO;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


@Repository
@Transactional(rollbackFor = Exception.class)

public class RoleDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	public List<String> getRoleNames(Long Role_id) {
		Session session = this.sessionFactory.getCurrentSession();
    	String hql = "FROM role WHERE role_id = :Role_id";
		Query query = session.createQuery(hql);
		query.setParameter("Role_id", Role_id);

		return query.getResultList();
	}
	
//	public List<String> getRoleNames1(Long employee_id) {
//		Session session = this.sessionFactory.getCurrentSession();
//    	String hql = "FROM role WHERE role_id = :Role_id";
//		Query query = session.createQuery(hql);
//		return query.getResultList();
//	}
	

}
