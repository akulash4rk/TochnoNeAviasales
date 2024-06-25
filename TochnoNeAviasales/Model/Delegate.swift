//
//  CitesTableViewDelegate.swift
//  TochnoNeAviasales
//
//  Created by Владислав Баранов on 22.06.2024.
//

import Foundation

protocol CitesTableViewDelegate: AnyObject {
    func didSelectRowAt(name: Int)
}

protocol ArriveDelegate: AnyObject {
    func didPickedCities(from: String, to: String)
}

protocol ShowCalendar : AnyObject {
    func willShowCalendary()
}

protocol ShowCalendarTo : AnyObject {
    func willShowCalendaryTo()
}

protocol SwapText : AnyObject {
    func buttonPressed()
}

protocol CreateEmptyDelegate : AnyObject {
    func createEmpty()
}
