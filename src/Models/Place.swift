import Foundation

struct Place {
    let id: String
    let name: String
    let location: Location
    let category: String
    let rating: Double?
    let reviewsCount: Int?
}

struct Location {
    let latitude: Double
    let longitude: Double
}