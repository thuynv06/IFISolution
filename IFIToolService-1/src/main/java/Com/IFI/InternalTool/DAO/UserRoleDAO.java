package Com.IFI.InternalTool.DAO;



import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import Com.IFI.InternalTool.Model.UserRole;

@Repository
@Transactional(rollbackFor = Exception.class)
public class UserRoleDAO {
 
	@Autowired
	private SessionFactory sessionFactory;
	
	public Long getRoleID(Long employee_Id) {
		Session session = this.sessionFactory.getCurrentSession();
		session.get(UserRole.class, employee_Id);
		Long role_id= session.get(UserRole.class, employee_Id).getRole().getRoleId();
		return role_id;
	}
}
