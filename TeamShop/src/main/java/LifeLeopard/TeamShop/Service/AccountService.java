package LifeLeopard.TeamShop.Service;

import LifeLeopard.TeamShop.Models.Accounts;
import LifeLeopard.TeamShop.Responsibility.AccountReps;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class AccountService {
    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
    private AccountReps accountReps;

    public boolean verifyUser(String verificationCode) {
        Accounts accounts = accountReps.findByVerificationCode(verificationCode);

        if (accounts == null || accounts.isStatus()) {
            return false;
        } else {
            accounts.setVerificationCode(null);
            accounts.setStatus(1);
            accountReps.save(accounts);
            return true;
        }

    }
    public boolean verifyPassword(String verificationCode,String password) {
        Accounts accounts = accountReps.findByResetPassCode(verificationCode);

        if (accounts != null && accounts.isStatus()) {
            accounts.setResetPassCode(null);
            System.out.println(password);
            accounts.setPassword(passwordEncoder.encode(password));
            System.out.println(accounts.getPassword());
            accountReps.save(accounts);
            return true;
        } else {
            return false;
        }
    }
}