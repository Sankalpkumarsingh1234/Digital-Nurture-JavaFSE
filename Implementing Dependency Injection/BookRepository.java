public class BookRepository {
    
    public void saveBook(String bookName) {
        System.out.println("Book saved: " + bookName);
    }
    
    public String getBook(String bookId) {
        System.out.println("Fetching book with ID: " + bookId);
        return "Book with ID: " + bookId;
    }
    
    public void deleteBook(String bookId) {
        System.out.println("Book deleted with ID: " + bookId);
    }
}
