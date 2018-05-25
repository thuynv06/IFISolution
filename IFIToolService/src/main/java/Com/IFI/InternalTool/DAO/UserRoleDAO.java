package Com.IFI.InternalTool.DAO;



import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


@Repository
@Transactional(rollbackFor = Exception.class)
public class UserRoleDAO {
 
	@Autowired
	private SessionFactory sessionFactory;
	
	public Long getRoleID(Long employee_Id) {
		Session session = this.sessionFactory.getCurrentSession();
		String hql = "select us.role_id FROM user_role us WHERE us.employee_id = :employee_Id";
		Query query = session.createQuery(hql);
		query.setParameter("employee_id", employee_Id).getSingleResult();
		return (Long)query.setParameter("employee_id", employee_Id).getSingleResult();
	}
}
