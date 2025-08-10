import XCTest
@testable import ios_local_recommendations_app

class ReviewAggregatorServiceTests: XCTestCase {
    
    var reviewAggregatorService: ReviewAggregatorService!

    override func setUp() {
        super.setUp()
        reviewAggregatorService = ReviewAggregatorService()
    }

    override func tearDown() {
        reviewAggregatorService = nil
        super.tearDown()
    }

    func testAggregateReviews() {
        let reviews = [
            Review(rating: 5, text: "Amazing place!", author: "User1"),
            Review(rating: 4, text: "Great atmosphere.", author: "User2"),
            Review(rating: 3, text: "It was okay.", author: "User3")
        ]
        
        let aggregatedReview = reviewAggregatorService.aggregate(reviews: reviews)
        
        XCTAssertEqual(aggregatedReview.averageRating, 4.0)
        XCTAssertEqual(aggregatedReview.reviewCount, 3)
    }

    func testEmptyReviews() {
        let aggregatedReview = reviewAggregatorService.aggregate(reviews: [])
        
        XCTAssertEqual(aggregatedReview.averageRating, 0.0)
        XCTAssertEqual(aggregatedReview.reviewCount, 0)
    }
}