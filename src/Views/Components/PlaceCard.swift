import SwiftUI

struct PlaceCard: View {
    var place: Place

    var body: some View {
        VStack(alignment: .leading) {
            Text(place.name)
                .font(.headline)
            Text(place.category)
                .font(.subheadline)
                .foregroundColor(.gray)
            Text(place.location)
                .font(.footnote)
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(8)
        .shadow(radius: 4)
    }
}