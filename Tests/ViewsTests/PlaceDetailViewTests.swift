import XCTest
@testable import ios_local_recommendations_app

class PlaceDetailViewTests: XCTestCase {

    var placeDetailView: PlaceDetailView!

    override func setUp() {
        super.setUp()
        // Initialize PlaceDetailView with a sample Place object
        let samplePlace = Place(name: "Sample Place", location: "123 Sample St", category: "Restaurant")
        placeDetailView = PlaceDetailView(place: samplePlace)
    }

    override func tearDown() {
        placeDetailView = nil
        super.tearDown()
    }

    func testPlaceDetailViewNotNil() {
        XCTAssertNotNil(placeDetailView, "PlaceDetailView should not be nil")
    }

    func testPlaceNameDisplayed() {
        let placeNameLabel = placeDetailView.placeNameLabel
        XCTAssertEqual(placeNameLabel.text, "Sample Place", "Place name should be displayed correctly")
    }

    func testPlaceLocationDisplayed() {
        let placeLocationLabel = placeDetailView.placeLocationLabel
        XCTAssertEqual(placeLocationLabel.text, "123 Sample St", "Place location should be displayed correctly")
    }

    func testPlaceCategoryDisplayed() {
        let placeCategoryLabel = placeDetailView.placeCategoryLabel
        XCTAssertEqual(placeCategoryLabel.text, "Restaurant", "Place category should be displayed correctly")
    }

    // Additional tests for reviews and other components can be added here
}