public class BookService {
    private BookRepository bookRepository;
    
    // Setter method for dependency injection
    public void setBookRepository(BookRepository bookRepository) {
        this.bookRepository = bookRepository;
    }
    
    // Getter method for BookRepository
    public BookRepository getBookRepository() {
        return bookRepository;
    }
    
    public void addBook(String bookName) {
        System.out.println("BookService: Adding book...");
        bookRepository.saveBook(bookName);
    }
    
    public void retrieveBook(String bookId) {
        System.out.println("BookService: Retrieving book...");
        String book = bookRepository.getBook(bookId);
        System.out.println(book);
    }
    
    public void removeBook(String bookId) {
        System.out.println("BookService: Removing book...");
        bookRepository.deleteBook(bookId);
    }
}
