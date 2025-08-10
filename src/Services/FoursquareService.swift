import Foundation

class FoursquareService {
    private let clientId: String
    private let clientSecret: String
    private let baseUrl = "https://api.foursquare.com/v2"

    init() {
        // Load API keys from environment variables
        self.clientId = ProcessInfo.processInfo.environment["FOURSQUARE_API_KEY"] ?? ""
        self.clientSecret = ProcessInfo.processInfo.environment["FOURSQUARE_API_SECRET"] ?? ""
    }

    func fetchLocalPlaces(latitude: Double, longitude: Double, completion: @escaping ([Place]?, Error?) -> Void) {
        let urlString = "\(baseUrl)/venues/explore?ll=\(latitude),\(longitude)&client_id=\(clientId)&client_secret=\(clientSecret)&v=\(getCurrentDateString())"
        
        guard let url = URL(string: urlString) else {
            completion(nil, NSError(domain: "FoursquareService", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"]))
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(nil, error)
                return
            }

            guard let data = data else {
                completion(nil, NSError(domain: "FoursquareService", code: 0, userInfo: [NSLocalizedDescriptionKey: "No data returned"]))
                return
            }

            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                   let response = json["response"] as? [String: Any],
                   let venues = response["groups"] as? [[String: Any]],
                   let items = venues.first?["items"] as? [[String: Any]] {
                    
                    let places = items.compactMap { item -> Place? in
                        guard let venue = item["venue"] as? [String: Any] else { return nil }
                        return Place(json: venue)
                    }
                    completion(places, nil)
                } else {
                    completion(nil, NSError(domain: "FoursquareService", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid JSON structure"]))
                }
            } catch {
                completion(nil, error)
            }
        }
        task.resume()
    }

    private func getCurrentDateString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYYMMDD"
        return dateFormatter.string(from: Date())
    }
}