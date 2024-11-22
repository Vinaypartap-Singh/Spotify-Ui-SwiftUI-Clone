import SwiftUI

struct SearchView: View {
    @State private var searchQuery: String = ""
    @State private var products: [Product] = []
    @State private var filteredProducts: [Product] = []
    @State private var isLoading: Bool = false
    @State private var errorMessage: String? = nil
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.ignoresSafeArea() // Black background
                
                VStack {
                    // Search Bar
                    HStack {
                        TextField("Search for products...", text: $searchQuery)
                            .padding(10)
                            .background(Color.white.opacity(0.1)) // Subtle contrast for the input field
                            .cornerRadius(8)
                            .foregroundColor(.white) // Input text color
                            .placeholder(when: searchQuery.isEmpty) {
                                
                            }
                            .onChange(of: searchQuery) { _ in
                                filterProducts()
                            }
                        
                        Button(action: {
                            searchQuery = ""
                            filterProducts()
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.white.opacity(searchQuery.isEmpty ? 0 : 0.8))
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 10)
                    
                    // Product List
                    if isLoading {
                        ProgressView("Loading products...")
                            .foregroundColor(.white)
                            .padding()
                    } else if let errorMessage {
                        Text("Error: \(errorMessage)")
                            .foregroundColor(.red)
                            .padding()
                    } else if filteredProducts.isEmpty {
                        Text("No products found.")
                            .foregroundColor(.gray)
                            .padding()
                    } else {
                        List(filteredProducts) { product in
                            ProductRowView(product: product)
                                .listRowBackground(Color.black) // Matches the black background
                        }
                        .listStyle(PlainListStyle())
                        .scrollContentBackground(.hidden) // Removes default list background
                    }
                }
                .navigationTitle("Search Products")
                .foregroundColor(.white) // Ensures all text is white by default
                .task {
                    await fetchProducts()
                }
            }
        }
    }
    
    // Fetch products from API
    private func fetchProducts() async {
        isLoading = true
        errorMessage = nil
        do {
            products = try await DatabaseHelper().getProducts()
            filteredProducts = products
        } catch {
            errorMessage = "Failed to load products."
        }
        isLoading = false
    }
    
    // Filter products based on search query
    private func filterProducts() {
        if searchQuery.isEmpty {
            filteredProducts = products
        } else {
            filteredProducts = products.filter {
                $0.title.localizedCaseInsensitiveContains(searchQuery) ||
                $0.category.localizedCaseInsensitiveContains(searchQuery) ||
                ($0.brand?.localizedCaseInsensitiveContains(searchQuery) ?? false)
            }
        }
    }
}

// Helper modifier for placeholder
extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content
    ) -> some View {
        ZStack(alignment: alignment) {
            if shouldShow {
                placeholder()
            }
            self
        }
    }
}

struct ProductRowView: View {
    let product: Product
    
    var body: some View {
        HStack(spacing: 10) {
            // Thumbnail Image
            ImageLoaderView(urlString: product.thumbnail)
                .frame(width: 50, height: 50)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            
            // Product Details
            VStack(alignment: .leading, spacing: 4) {
                Text(product.title)
                    .font(.headline)
                    .foregroundColor(.white)
                    .lineLimit(1)
                
                Text(product.brand ?? "Unknown Brand")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Text("$\(product.price, specifier: "%.2f")")
                    .font(.subheadline)
                    .foregroundColor(.green)
            }
        }
    }
}

#Preview {
    SearchView()
}
