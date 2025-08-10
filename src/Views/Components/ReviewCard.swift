import SwiftUI

struct ReviewCard: View {
    var review: Review

    var body: some View {
        VStack(alignment: .leading) {
            Text(review.author)
                .font(.headline)
            Text("Rating: \(review.rating)/5")
                .font(.subheadline)
                .foregroundColor(.gray)
            Text(review.text)
                .font(.body)
                .padding(.top, 5)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(8)
        .shadow(radius: 5)
    }
}