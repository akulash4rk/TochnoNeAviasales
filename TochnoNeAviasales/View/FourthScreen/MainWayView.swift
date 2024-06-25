//
//  mainWayView.swift
//  TochnoNeAviasales
//
//  Created by Владислав Баранов on 24.06.2024.
//

import Foundation
import UIKit

class MainWayView : UIView {
    
    //MARK: - UI
    
    let backArrow : UIImageView = {
        let backArrow = UIImageView()
        backArrow.image = UIImage(named: "backArrow")
        backArrow.translatesAutoresizingMaskIntoConstraints = false
        
        return backArrow
    }()
    
    let cityLabel : UILabel = {
        let cityLabel = UILabel()
        
        cityLabel.text = "SomeText"
        cityLabel.textColor = Colors.rlyWhite.color
        cityLabel.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return cityLabel
    }()
    
    let aboutFlight : UILabel = {
        let aboutFlight = UILabel()
        aboutFlight.font =  UIFont(name: "SFProDisplay-Medium", size: 14)
        aboutFlight.textColor = Colors.whiteGray.color
        aboutFlight.text = "someText2"
        aboutFlight.translatesAutoresizingMaskIntoConstraints = false
        
        
        return aboutFlight
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
    //MARK: - Setup View
extension MainWayView {
    func setupView(){
        
        backgroundColor = Colors.backGray3.color
        
        addSubview(backArrow)
        addSubview(cityLabel)
        addSubview(aboutFlight)
        
        NSLayoutConstraint.activate([
            
            backArrow.centerYAnchor.constraint(equalTo: centerYAnchor),
            backArrow.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            backArrow.heightAnchor.constraint(equalToConstant: 24),
            backArrow.widthAnchor.constraint(equalToConstant: 24),
            
            cityLabel.leadingAnchor.constraint(equalTo: backArrow.trailingAnchor, constant: 8),
            cityLabel.bottomAnchor.constraint(equalTo: centerYAnchor, constant: -4),
            
            aboutFlight.topAnchor.constraint(equalTo: centerYAnchor, constant: 4),
            aboutFlight.leadingAnchor.constraint(equalTo: backArrow.trailingAnchor, constant: 8),
        ])
    }
    func configure(){
        if let _ = currentForm, let _ = currentTo  {
            cityLabel.text = "\(currentForm!)-\(currentTo!)"
        }
        let day = Calendar.current.component(.day, from: fromDate )
        let month = Calendar.current.component(.month, from: fromDate )
        aboutFlight.text = "\(day) \(fullMonthOrder[month-1]), 1 пассажир"
    }
}
