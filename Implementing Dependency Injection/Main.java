import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Main {
    
    public static void main(String[] args) {
        System.out.println("=== Library Management Application ===\n");
        
        // Load Spring context from applicationContext.xml
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        
        // Get BookService bean from Spring container
        BookService bookService = (BookService) context.getBean("bookService");
        
        // Verify that BookRepository is injected
        if (bookService.getBookRepository() != null) {
            System.out.println("✓ BookRepository successfully injected into BookService\n");
        } else {
            System.out.println("✗ BookRepository injection failed!\n");
        }
        
        // Test the dependency injection by calling BookService methods
        System.out.println("--- Testing BookService Methods ---");
        bookService.addBook("Spring in Action");
        System.out.println();
        
        bookService.retrieveBook("B001");
        System.out.println();
        
        bookService.removeBook("B001");
        System.out.println();
        
        System.out.println("=== Application Completed Successfully ===");
        
        // Close the Spring context
        ((ClassPathXmlApplicationContext) context).close();
    }
}
