//
//  functions.swift
//  TochnoNeAviasales
//
//  Created by Владислав Баранов on 22.06.2024.
//

import Foundation
import SVGKit


// Добавить обводку к слою
func applyStrokeToLayers(_ layer: CALayer) {
    if let shapeLayer = layer as? CAShapeLayer {
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.lineWidth = 2.0
        shapeLayer.fillColor = shapeLayer.fillColor ?? UIColor.clear.cgColor
    }
}

func addStrokeToSVG(_ svgImage: SVGKImage) {
    guard svgImage.caLayerTree != nil else {
        print("Failed to get root layer")
        return
    }
}

//string - финальная строка, int порядок символа, на котором надо сменить шрифт
func workWithData(choosedDate : Date?) -> (String, Int) {
              
    var month : Int
    var day : Int
    
    if let choosedDate = choosedDate {
        month  = Calendar.current.component(.month, from: choosedDate)
    } else {
        month = Calendar.current.component(.month, from: Date())
    }
    
    if let choosedDate = choosedDate {
        day  = Calendar.current.component(.day, from: choosedDate)
    } else {
        day = Calendar.current.component(.day, from: Date())
    }
    
    let weekDay  = Calendar.current.component(.weekday, from: choosedDate ?? Date())
    
    let someString = "\(day) \(monthOrder[month-1])"
    
    return ("\(day) \(monthOrder[month-1]), \(weekdayOrder[weekDay - 1])", someString.count)
}

// Получить время формата 00:00

func workWithTime(_ choosedDate : Date) -> String {
    let hour = Calendar.current.component(.hour, from: choosedDate)
    let mins = Calendar.current.component(.minute, from: choosedDate)
    
    return String(format: "%02d:%02d", hour, mins)
}

//Подсчет времени в пути
func timeInWay(from dateFrom: Date, to dateTo: Date) -> String {
    let components = Calendar.current.dateComponents([.day, .hour, .minute], from: dateFrom, to: dateTo)
    var final = 0
    
    if let days = components.day {
        final += days * 24
    }
    
    if let hours = components.hour {
        final += hours
    }
    
    var string = "\(final)"
    
    if let mins = components.minute {
        if mins > 15  && mins < 45 {
            string += ".5ч"
        }
        if mins >= 45 {
            final += 1
            string = "\(final)ч"
        }
    }
    
    string += " в пути"
    return string
}

//Деление разрядов, добавить ₽, опционально "от"
func numberWorking(currentString : Int, camesFrom : Bool) -> String {
    
    let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = " "
        formatter.groupingSize = 3
    
    if let some = formatter.string(from: NSNumber(value: currentString)){
        if camesFrom == true {
            let willReturn = "От \(some) ₽"
            return willReturn
        }
        else {
            let willReturn = "\(some) ₽"
            return willReturn
        }
        
    }
    print("error convert")
    
    return ""
    
}

//Сделать часть текста другим цветом
func setDifColor(index : Int, string : String) -> NSMutableAttributedString {
    let attributedString = NSMutableAttributedString(string: string)
    let length = string.count - index
    let range = NSRange(location: index, length: length)
    attributedString.addAttribute(.foregroundColor, value: Colors.whiteGray.color, range: range)
    return attributedString
}
