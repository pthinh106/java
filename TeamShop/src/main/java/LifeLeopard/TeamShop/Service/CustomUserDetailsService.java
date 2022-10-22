package LifeLeopard.TeamShop.Service;

import LifeLeopard.TeamShop.Models.Accounts;
import LifeLeopard.TeamShop.Responsibility.AccountReps;
import LifeLeopard.TeamShop.UserDetails.CustomUserDetails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class CustomUserDetailsService implements UserDetailsService {
    @Autowired
    AccountReps accountReps;
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        boolean exists = accountReps.existsByUsername(username);
        if(exists){
            Accounts accounts = accountReps.findByUsername(username);
//            List<GrantedAuthority> granList =  new ArrayList<GrantedAuthority>();
////            if(user.getRoles().isEmpty()){
////                user.setRoles("USER");
////            }
//            GrantedAuthority grantedAuthority = new SimpleGrantedAuthority(user.getRoles()) ;
//            granList.add(grantedAuthority);
            CustomUserDetails userDetails = new CustomUserDetails(accounts);
            return  userDetails;
        }else {
            new UsernameNotFoundException("fail");
        }
        return null;
    }

}
