import SwiftUI

struct Card: View {
    let image: String
    let title: String
    let subtitle: String
    let price: Double
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            AsyncImage(url: URL(string: image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 200)
                    .cornerRadius(12)
            } placeholder: {
                ProgressView()
            }
            
            Text(title)
                .font(.headline)
                .lineLimit(2)
            
            Text(subtitle)
                .font(.subheadline)
                .foregroundColor(.gray)
                .lineLimit(2)
            
            Text("$\(String(format: "%.2f", price))")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.blue)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(16)
        .shadow(radius: 4)
    }
}

#Preview {
    Card(
        image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
        title: "Example Product",
        subtitle: "This is a sample product description",
        price: 29.99
    )
}
