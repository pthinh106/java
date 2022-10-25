package LifeLeopard.TeamShop;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;


@SpringBootApplication
public class TeamShopApplication {
	public static final String myUrl = "http://localhost:8070/";
	public static void main(String[] args) {
		SpringApplication.run(TeamShopApplication.class, args);
	}



}
