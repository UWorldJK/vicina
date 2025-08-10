import SwiftUI

struct PlaceDetailView: View {
    var place: Place
    @State private var reviews: [Review] = []
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text(place.name)
                    .font(.largeTitle)
                    .padding(.bottom, 10)
                
                Text(place.category)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.bottom, 20)
                
                Text("Reviews")
                    .font(.headline)
                    .padding(.bottom, 5)
                
                ForEach(reviews) { review in
                    ReviewCard(review: review)
                        .padding(.bottom, 10)
                }
            }
            .padding()
            .onAppear {
                fetchReviews()
            }
        }
        .navigationTitle("Place Details")
    }
    
    private func fetchReviews() {
        // Call the ReviewAggregatorService to fetch reviews for the place
        ReviewAggregatorService().fetchReviews(for: place.id) { fetchedReviews in
            self.reviews = fetchedReviews
        }
    }
}

struct PlaceDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceDetailView(place: Place(id: "1", name: "Sample Place", category: "Restaurant", location: "123 Sample St"))
    }
}