//
//  OneTicketsView.swift
//  TochnoNeAviasales
//
//  Created by Владислав Баранов on 24.06.2024.
//

import Foundation
import UIKit

class OneTicketsView : UIView {
    
    //MARK: - UI
    
    private let price : UILabel = {
        let  price = UILabel()
        price.translatesAutoresizingMaskIntoConstraints = false
        price.font = UIFont(name: "SFProDisplay-Medium", size: 22)
        price.textColor = Colors.rlyWhite.color
        return price
    }()
    
    let circle : UIView = {
        let circle = UIView()
        circle.translatesAutoresizingMaskIntoConstraints = false
        circle.backgroundColor = Colors.redCircle.color
        return circle
    }()
    
    
    private let settingsLabel : UILabel = {
        let settingsLabel = UILabel()
        settingsLabel.translatesAutoresizingMaskIntoConstraints = false
        settingsLabel.font = UIFont(name: "SFProDisplay-MediumItalic", size: 14)
        settingsLabel.textColor = Colors.rlyWhite.color
        return settingsLabel
    }()
    
    
     let depart : TimeStackView = {
        let stack = TimeStackView()
         stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let arrive : TimeStackView = {
       let stack = TimeStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
       return stack
   }()
    
    
    //MARK: - Инициализаторы
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
//MARK: - Setup view
extension OneTicketsView{
    func setupView(){
        
        backgroundColor = Colors.backGray3.color
        layer.cornerRadius = 16
        addSubview(price)
        addSubview(circle)
        addSubview(settingsLabel)
        
        let someLabel = UILabel()
        someLabel.text = "—"
        someLabel.font = UIFont(name: "SFProDisplay-MediumItalic", size: 14)
        someLabel.textColor = Colors.whiteGray.color
        
        let mainStackView = UIStackView()
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.spacing = 4
        mainStackView.alignment = .top
        addSubview(mainStackView)
        
        mainStackView.addArrangedSubview(depart)
        mainStackView.addArrangedSubview(someLabel)
        mainStackView.addArrangedSubview(arrive)
        
        NSLayoutConstraint.activate([
            price.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            price.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            
            circle.topAnchor.constraint(equalTo: price.bottomAnchor, constant: 24),
            circle.heightAnchor.constraint(equalToConstant: 24),
            circle.widthAnchor.constraint(equalToConstant: 24),
            circle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            mainStackView.leadingAnchor.constraint(equalTo: circle.trailingAnchor, constant: 16),
            mainStackView.topAnchor.constraint(equalTo: price.bottomAnchor, constant: 16),
            
            
            settingsLabel.leadingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: 8),
            settingsLabel.topAnchor.constraint(equalTo: price.bottomAnchor, constant: 16),
            settingsLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
            
        ])
        circle.layer.cornerRadius = 12
        
    }
    //MARK: - Configure
    
    func configure(currentTicket : Ticket){
        
        if let lastPrice = currentTicket.price, let string = lastPrice.value {
            price.text = numberWorking(currentString: string, camesFrom: false)
        }
        
        if let _ = currentTicket.departure?.date, let _ = currentTicket.departure?.airport {
            depart.configure(settings: currentTicket, isDepart: true)
        }
        
        if let _ = currentTicket.arrival?.date, let _ = currentTicket.arrival?.airport {
            arrive.configure(settings: currentTicket, isDepart: false)
        }
        
        if let dep = currentTicket.departure, let ariv = currentTicket.arrival, let _ = ariv.date, let _ = dep.date {
            var someText = timeInWay(from: dep.dateAsDate!, to: ariv.dateAsDate!)
            if currentTicket.hasTransfer == true {
                someText += " / Без пересадок"
            }
            settingsLabel.text = someText
        }
        
        
    }
    
}
