import Foundation

class ReviewAggregatorService {
    private var reviews: [Review] = []

    func aggregateReviews(from sources: [String], completion: @escaping ([Review]) -> Void) {
        var aggregatedReviews: [Review] = []
        let dispatchGroup = DispatchGroup()

        for source in sources {
            dispatchGroup.enter()
            fetchReviews(from: source) { reviews in
                aggregatedReviews.append(contentsOf: reviews)
                dispatchGroup.leave()
            }
        }

        dispatchGroup.notify(queue: .main) {
            self.reviews = aggregatedReviews
            completion(aggregatedReviews)
        }
    }

    private func fetchReviews(from source: String, completion: @escaping ([Review]) -> Void) {
        // Simulate network call to fetch reviews from the specified source
        // In a real implementation, you would make an API call here
        let dummyReviews = [
            Review(rating: 5, text: "Amazing place!", author: "User1"),
            Review(rating: 4, text: "Great experience.", author: "User2")
        ]
        completion(dummyReviews)
    }

    func getAggregatedReviews() -> [Review] {
        return reviews
    }
}