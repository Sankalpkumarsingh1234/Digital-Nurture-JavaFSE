package com.library;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * Main entry point for the Library Management Application
 */
public class LibraryManagementApp {

    public static void main(String[] args) {
        System.out.println("Starting Library Management Application...");
        
        // Initialize Spring ApplicationContext
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        
        System.out.println("Library Management Application started successfully!");
    }
}
