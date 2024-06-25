import Foundation
import UIKit
import SVGKit

//MARK: - Colors

enum Colors {
    case basicBlack
    case semiGray
    case whiteGray
    case closeToWhite
    case backGray
    case iconGray
    case textWhite
    case frontGray
    case backGray2
    case rlyWhite
    case textGray
    case redCircle
    case blueCircle
    case backGray3
    case borderGray
}

extension Colors {
    var color: UIColor {
        switch self {
        case .basicBlack:
            return UIColor(red: 12/255, green: 12/255, blue: 12/255, alpha: 1)
        case .semiGray:
            return UIColor(red: 47/255, green: 48/255, blue: 53/255, alpha: 1)
        case .whiteGray:
            return UIColor(red: 159/255, green: 159/255, blue: 159/255, alpha: 0.623529)
        case .closeToWhite:
            return UIColor(red: 1, green: 245/255, blue: 187/255, alpha: 1)
        case .backGray:
            return UIColor(red: 0.623, green: 0.623, blue: 0.623, alpha: 1)
        case .iconGray:
            return UIColor(red: 219/255, green: 219/255, blue: 219/255, alpha: 0.623529)
        case .textWhite:
            return UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1);
        case .frontGray:
            return UIColor(red: 62/255, green: 63/255, blue: 67/255, alpha: 1);
        case .backGray2:
            return UIColor(red: 36/255, green: 37/255, blue: 41/255, alpha: 1);
        case .rlyWhite:
            return UIColor(red: 1, green: 1, blue: 1, alpha: 1);
        case .textGray:
            return UIColor(red: 94/255, green: 95/255, blue: 97/255, alpha: 1);
        case .redCircle:
            return UIColor(red: 1, green: 95/255, blue: 94/255, alpha: 1);
        case .blueCircle:
            return UIColor(red: 34/255, green: 97/255, blue: 188/255, alpha: 1);
        case .backGray3:
            return UIColor(red: 29/255, green: 30/255, blue: 32/255, alpha: 1);
        case .borderGray:
            return UIColor(red: 29, green: 30, blue: 32, alpha: 1)
        }
    }
}

//MARK: - Date

let monthOrder = ["янв", "фев", "март", "апр", "май", "июнь", "июль", "авг", "снт", "окт", "ноя", "дек"]
let fullMonthOrder = ["января", "февраля", "марта", "апреля", "мая", "июня", "июля", "августа", "сентября", "октября", "ноября", "декабря"]
let weekdayOrder = ["вс", "пн", "вт", "ср", "чт", "пт","сб"]


//MARK: - Images

//name : imageName

let dicForSpecial : [String : String] = ["Сложный маршрут" : "command", "Куда угодно" : "net", "Выходные" : "calendar", "Горячие билеты" : "fire"]

let dicForCites : [String : String] = ["Стамбул" : "stambul", "Сочи" : "sochi", "Пхукет" : "phuket"]

let dicForSettings : [String : String] = ["обратно" : "plus", "1,эконом" : "people", "карта" : "settings"]

//MARK: - UI

let citesOrder : [String] = ["Стамбул", "Сочи", "Пхукет"]
let specialOrder : [String] = ["Сложный маршрут", "Куда угодно", "Выходные", "Горячие билеты"]
let settingsOrder : [String] = ["обратно", "дата", "1,эконом", "карта"]

