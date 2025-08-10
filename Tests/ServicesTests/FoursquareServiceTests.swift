import XCTest
@testable import ios_local_recommendations_app

class FoursquareServiceTests: XCTestCase {
    
    var foursquareService: FoursquareService!

    override func setUp() {
        super.setUp()
        foursquareService = FoursquareService()
    }

    override func tearDown() {
        foursquareService = nil
        super.tearDown()
    }

    func testFetchPlacesSuccess() {
        let expectation = self.expectation(description: "Fetch places from Foursquare API")
        
        foursquareService.fetchPlaces { result in
            switch result {
            case .success(let places):
                XCTAssertNotNil(places)
                XCTAssertTrue(places.count > 0)
            case .failure(let error):
                XCTFail("Expected success but got error: \(error)")
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }

    func testFetchPlacesFailure() {
        // Simulate a failure scenario by providing invalid parameters or mocking the network response
        let expectation = self.expectation(description: "Fetch places from Foursquare API should fail")
        
        // Assuming we have a method to set invalid parameters
        foursquareService.setInvalidParameters()
        
        foursquareService.fetchPlaces { result in
            switch result {
            case .success:
                XCTFail("Expected failure but got success")
            case .failure(let error):
                XCTAssertNotNil(error)
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
}