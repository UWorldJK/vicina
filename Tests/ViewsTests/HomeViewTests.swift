import XCTest
@testable import ios_local_recommendations_app

class HomeViewTests: XCTestCase {

    var homeView: HomeView!

    override func setUp() {
        super.setUp()
        homeView = HomeView()
    }

    override func tearDown() {
        homeView = nil
        super.tearDown()
    }

    func testHomeViewInitialization() {
        XCTAssertNotNil(homeView, "HomeView should be initialized")
    }

    func testHomeViewDisplaysPlaces() {
        // Assuming there's a method to load places
        homeView.loadPlaces()
        XCTAssertFalse(homeView.places.isEmpty, "HomeView should display places")
    }

    func testHomeViewHasCorrectTitle() {
        XCTAssertEqual(homeView.title, "Local Recommendations", "HomeView title should be 'Local Recommendations'")
    }
}