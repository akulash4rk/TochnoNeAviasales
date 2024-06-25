import Foundation

// MARK: - ShowAll
struct ShowAll: Codable {
    let tickets: [Ticket]?
}

// MARK: - Ticket
struct Ticket: Codable {
    let id: Int?
    let badge: String?
    let price: Price?
    let providerName, company: String?
    let departure, arrival: Arrival?
    let hasTransfer, hasVisaTransfer: Bool?
    let luggage: Luggage?
    let handLuggage: HandLuggage?
    let isReturnable, isExchangable: Bool?

    enum CodingKeys: String, CodingKey {
        case id, badge, price
        case providerName = "provider_name"
        case company, departure, arrival
        case hasTransfer = "has_transfer"
        case hasVisaTransfer = "has_visa_transfer"
        case luggage
        case handLuggage = "hand_luggage"
        case isReturnable = "is_returnable"
        case isExchangable = "is_exchangable"
    }

}

// MARK: - Arrival
struct Arrival: Codable {
    let town: Town?
    let date: String? 
    let airport: Airport?
    
    
    private static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return formatter
    }()
    
    var dateAsDate: Date? {
        get {
            guard let dateString = date else { return nil }
            return Arrival.dateFormatter.date(from: dateString)
        }
    }
}




enum Airport: String, Codable {
    case aer = "AER"
    case vko = "VKO"
}

enum Town: String, Codable {
    case moscow = "Москва"
    case sochi = "Сочи"
}

// MARK: - HandLuggage
struct HandLuggage: Codable {
    let hasHandLuggage: Bool?
    let size: String?

    enum CodingKeys: String, CodingKey {
        case hasHandLuggage = "has_hand_luggage"
        case size
    }
}

// MARK: - Luggage
struct Luggage: Codable {
    let hasLuggage: Bool?
    let price: Price?

    enum CodingKeys: String, CodingKey {
        case hasLuggage = "has_luggage"
        case price
    }
}
