//
//  Tickets.swift
//  TochnoNeAviasales
//
//  Created by Владислав Баранов on 21.06.2024.
//
import Foundation

// MARK: - CountryPicked
struct CountryPicked: Codable, Sendable {
    let ticketsOffers: [TicketsOffer]?

    enum CodingKeys: String, CodingKey {
        case ticketsOffers = "tickets_offers"
    }
}

// MARK: - TicketsOffer
struct TicketsOffer: Codable {
    let id: Int?
    let title: String?
    let timeRange: [String]?
    let price: Price?

    enum CodingKeys: String, CodingKey {
        case id, title
        case timeRange = "time_range"
        case price
    }
}

