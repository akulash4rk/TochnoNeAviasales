//
//  Varriable.swift
//  TochnoNeAviasales
//
//  Created by Владислав Баранов on 21.06.2024.
//

import Foundation
import UIKit

//MARK: - API Data

var welcomeArray : [Offer] = []

var ticketsOfferArray : [TicketsOffer] = []

var allTicketsArray : [Ticket] = []

var availableTickets : [Ticket] = []

//MARK: - Images

var imageDic : [Int : UIImage] = [1 : UIImage(named: "dora")!, 2 : UIImage(named: "secondPhoto")!]

//city
var currentForm : String? = nil
var currentTo : String? = nil

var fromDate : Date = Date()
var returnDate : Date? = nil



