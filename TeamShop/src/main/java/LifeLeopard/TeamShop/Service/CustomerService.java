package LifeLeopard.TeamShop.Service;

import LifeLeopard.TeamShop.Models.Accounts;
import LifeLeopard.TeamShop.Models.Customers;
import LifeLeopard.TeamShop.Models.Roles;
import LifeLeopard.TeamShop.Responsibility.AccountReps;
import LifeLeopard.TeamShop.Responsibility.CustomerRepos;
import LifeLeopard.TeamShop.Responsibility.RolesRepos;
import net.bytebuddy.utility.RandomString;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.io.UnsupportedEncodingException;
import java.util.Optional;

@Service
@Transactional
public class CustomerService {
    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
    private CustomerRepos customerRepos;
    @Autowired
    private AccountReps accountReps;
    @Autowired
    RolesRepos rolesRepos;
    @Autowired
    private JavaMailSender javaMailSender;
    public boolean createCustomer(Customers customersDetails,Accounts accountDetails, String siteURL) throws MessagingException, UnsupportedEncodingException {
        boolean exists = accountReps.existsByUsername(accountDetails.getUsername().trim());
        if(exists){
            return false;
        }else{
            Roles roles = rolesRepos.findByRoleName("ROLE_USER");
            accountDetails.setRoles(roles);
            accountDetails.setStatus(0);
            accountDetails.setPassword(passwordEncoder.encode(accountDetails.getPassword()));
            String randomCode = RandomString.make(64);
            accountDetails.setVerificationCode(randomCode);
            try{
//                System.out.println(customers.toString());
                accountReps.save(accountDetails);
                Accounts accountrepos = accountReps.findByUsername(accountDetails.getUsername());
                System.out.println(accountrepos.toString());
                customersDetails.setAccountId(accountrepos.getAccountId());
                customerRepos.save(customersDetails);
                sendVerificationEmail(customersDetails, siteURL);
                System.out.println(customersDetails.toString());
            }catch (Exception e){
                System.out.println(e);
            }
            return true;
        }
    }

        private void sendVerificationEmail(Customers customers, String siteURL)
        throws MessagingException, UnsupportedEncodingException {
            String toAddress = customers.getEmail();
            String fromAddress = "lifeleopardjava@gmail.com";
            String senderName = "Shop Life Leopard";
            String subject = "Please verify your registration";
            String content = "Dear [[name]],<br>"
                    + "Please click the link below to verify your registration:<br>"
                    + "<h3><a href=\"[[URL]]\" target=\"_self\">VERIFY</a></h3>"
                    + "Thank you,<br>"
                    + "Your company name.";

            MimeMessage message = javaMailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message);

            helper.setFrom(fromAddress, senderName);
            helper.setTo(toAddress);
            helper.setSubject(subject);

            content = content.replace("[[name]]", customers.getFullName());
            Accounts accounts = accountReps.getById(customers.getAccountId());
            String verifyURL = siteURL + "/verify?code=" + accounts.getVerificationCode();
            content = content.replace("[[URL]]", verifyURL);
            helper.setText(content, true);
            javaMailSender.send(message);
    }
        public void sendResetPassWord(Customers customers, String siteURL)
            throws MessagingException, UnsupportedEncodingException {
        String toAddress = customers.getEmail();
        String fromAddress = "lifeleopardjava@gmail.com";
        String senderName = "Shop Life Leopard";
        String subject = "Request your reset password";
        String content = "Dear [[name]],<br>"
                + "Please click the link below to your reset password:<br>"
                + "<h3><a href=\"[[URL]]\" target=\"_self\">VERIFY</a></h3>"
                + "Thank you,<br>"
                + "Your company name.";

        MimeMessage message = javaMailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message);

        helper.setFrom(fromAddress, senderName);
        helper.setTo(toAddress);
        helper.setSubject(subject);

        content = content.replace("[[name]]", customers.getFullName());
        Accounts accounts = accountReps.getById(customers.getAccountId());

        String verifyURL = siteURL + "/verify?code=" + accounts.getResetPassCode();

        content = content.replace("[[URL]]", verifyURL);

        helper.setText(content, true);

        javaMailSender.send(message);
    }

}
