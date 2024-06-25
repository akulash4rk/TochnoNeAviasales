//
//  OffersStruct.swift
//  TochnoNeAviasales
//
//  Created by Владислав Баранов on 21.06.2024.
//

//   let offers = try? JSONDecoder().decode(Offers.self, from: jsonData)

import Foundation

// MARK: - WelcomeStruct
struct WelcomeStruct : Decodable {
    let offers: [Offer]?
}

// MARK: - Offer
struct Offer : Decodable {
    let id: Int?
    let title, town: String?
    let price: Price?
}
