import Foundation

class ProductViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var categories: [String] = []
    
    func fetchAllProducts() {
        guard let url = URL(string: "https://fakestoreapi.com/products") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else { return }
            
            do {
                let products = try JSONDecoder().decode([Product].self, from: data)
                DispatchQueue.main.async {
                    self.products = products
                }
            } catch {
                print("Decoding error: \(error)")
            }
        }.resume()
    }
    
    func searchProducts(category: String) {
        guard let url = URL(string: "https://fakestoreapi.com/products/category/\(category)") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else { return }
            
            do {
                let products = try JSONDecoder().decode([Product].self, from: data)
                DispatchQueue.main.async {
                    self.products = products
                }
            } catch {
                self.fetchCategories()
            }
        }.resume()
    }
    
    func fetchCategories() {
        guard let url = URL(string: "https://fakestoreapi.com/products/categories") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else { return }
            
            do {
                let categories = try JSONDecoder().decode([String].self, from: data)
                DispatchQueue.main.async {
                    self.categories = categories
                }
            } catch {
                print("Decoding error: \(error)")
            }
        }.resume()
    }
}
