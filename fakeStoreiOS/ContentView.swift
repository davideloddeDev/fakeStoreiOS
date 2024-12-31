import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    @StateObject private var viewModel = ProductViewModel()
    
    var body: some View {
        VStack {
            HStack {
                SearchBar(text: $searchText)
                
                Button(action: {
                    if !searchText.isEmpty {
                        viewModel.searchProducts(category: searchText.lowercased())
                    }
                }) {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .padding(.trailing)
            }
            
            ScrollView {
                if !viewModel.categories.isEmpty {
                    VStack(alignment: .leading) {
                        Text("Available Categories:")
                            .font(.headline)
                            .padding(.horizontal)
                        
                        ForEach(viewModel.categories, id: \.self) { category in
                            Text("• \(category)")
                                .padding(.horizontal)
                        }
                    }
                } else {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                        ForEach(viewModel.products) { product in
                            ProductCard(product: product)
                        }
                    }
                    .padding()
                }
            }
        }
        .padding()
        .onAppear {
            viewModel.fetchAllProducts()
        }
    }
}

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            TextField("Search...", text: $text)
                .padding(7)
                .padding(.horizontal, 8)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        if !text.isEmpty {
                            Button(action: {
                                text = ""
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
        }
    }
}

struct ProductCard: View {
    let product: Product
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: product.image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
            .frame(height: 150)
            
            Text(product.title)
                .lineLimit(2)
                .font(.caption)
                .padding(.horizontal, 8)
            
            Text("$\(String(format: "%.2f", product.price))")
                .font(.caption)
                .bold()
        }
        .background(Color(.systemGray6))
        .cornerRadius(10)
    }
}

#Preview {
    ContentView()
}
