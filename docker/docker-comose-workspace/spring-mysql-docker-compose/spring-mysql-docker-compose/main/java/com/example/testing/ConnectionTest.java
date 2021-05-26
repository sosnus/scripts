package com.example.testing;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ConnectionTest {
	
	@RequestMapping("check")
	public String check() {
		
		// String url = "jdbc:mysql://s-vm.northeurope.cloudapp.azure.com:3306/iap-test";
		String url = "jdbc:mysql://db:3306/iap-test";

		String username = "root";
		String password = "my-secret-pw";

		System.out.println("Connecting database...");
		String s = "If you are seeing this message means you are not connected to the database";

		try (Connection connection = DriverManager.getConnection(url, username, password)) {
		    System.out.println("Database connected!");
		    s = "If you are seeing this message means you are connected to the database: " +url+ " : driver manager can establish connection";
		} catch (SQLException e) {
		    throw new IllegalStateException("Cannot connect the database!", e);
		}
		
		return s;

	}

}
