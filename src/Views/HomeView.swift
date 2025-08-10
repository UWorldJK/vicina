import SwiftUI

struct HomeView: View {
    @State private var places: [Place] = []
    @State private var isLoading: Bool = true
    @State private var errorMessage: String?

    var body: some View {
        NavigationView {
            VStack {
                if isLoading {
                    ProgressView("Loading...")
                } else if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                } else {
                    List(places) { place in
                        NavigationLink(destination: PlaceDetailView(place: place)) {
                            PlaceCard(place: place)
                        }
                    }
                }
            }
            .navigationTitle("Local Recommendations")
            .onAppear(perform: loadPlaces)
        }
    }

    private func loadPlaces() {
        FoursquareService.fetchPlaces { result in
            switch result {
            case .success(let fetchedPlaces):
                self.places = fetchedPlaces
                self.isLoading = false
            case .failure(let error):
                self.errorMessage = error.localizedDescription
                self.isLoading = false
            }
        }
    }
}