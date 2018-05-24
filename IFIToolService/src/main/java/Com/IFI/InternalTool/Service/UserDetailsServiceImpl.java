package Com.IFI.InternalTool.Service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import Com.IFI.InternalTool.DAO.EmployeeDAO;
import Com.IFI.InternalTool.DAO.RoleDAO;
import Com.IFI.InternalTool.DAO.UserRoleDAO;
import Com.IFI.InternalTool.Model.Employee;

@Service
public class UserDetailsServiceImpl  implements UserDetailsService{
	
	
	@Autowired  
	private EmployeeDAO employeeDAO;

	@Autowired 
	private RoleDAO roleDAO;
	@Autowired
	private UserRoleDAO userRoleDAO;
	
	
	@Override
    public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
		Employee user = this.employeeDAO.findUserAccount(userName);
 
        if (user == null) {
            System.out.println("User not found! " + userName);
            throw new UsernameNotFoundException("User " + userName + " was not found in the database");
        }
 
        System.out.println("Found User: " + user);
        
        Long role_id=userRoleDAO.getRoleID(user.getEmployee_id());
 
        // [ROLE_USER, ROLE_ADMIN,..]
        List<String> roleNames = this.roleDAO.getRoleNames(role_id);
 
        List<GrantedAuthority> grantList = new ArrayList<GrantedAuthority>();
        if (roleNames != null) {
            for (String role : roleNames) {
                // ROLE_USER, ROLE_ADMIN,..
                GrantedAuthority authority = new SimpleGrantedAuthority(role);
                grantList.add(authority);
            }
        }
 
        UserDetails userDetails = (UserDetails) new User(user.getUsername(), //
                user.getPassword(), grantList);
 
        return userDetails;
    }
	
	

}
