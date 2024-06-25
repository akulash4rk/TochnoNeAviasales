//
//  Price.swift
//  TochnoNeAviasales
//
//  Created by Владислав Баранов on 21.06.2024.
//

import Foundation

// MARK: - Price
struct Price : Codable {
    let value: Int?
    
    enum CodingKeys: String, CodingKey {
            case value
        }
}
