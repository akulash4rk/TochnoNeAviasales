//
//  TimeStackView.swift
//  TochnoNeAviasales
//
//  Created by Владислав Баранов on 24.06.2024.
//

import Foundation
import UIKit

class TimeStackView : UIStackView {
    
    //MARK: - UI
    
    let timeLabelArrive : UILabel = {
        let timeLabel = UILabel()
        
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.font = UIFont(name: "SFProDisplay-MediumItalic", size: 14)
        timeLabel.textColor = Colors.rlyWhite.color
        
        return timeLabel
    }()
    
    let airportLabel : UILabel = {
        let airportLabel = UILabel()
        
        
        airportLabel.translatesAutoresizingMaskIntoConstraints = false
        airportLabel.font = UIFont(name: "SFProDisplay-MediumItalic", size: 14)
        airportLabel.textColor = Colors.whiteGray.color
        
        
        return airportLabel
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
extension TimeStackView {
    
    func setupView(){
        axis = .vertical
        spacing = 4
        
        addArrangedSubview(timeLabelArrive)
        addArrangedSubview(airportLabel)
        
    }
    
    
    
    func configure(settings : Ticket, isDepart : Bool){
        if isDepart {
            if let _ = settings.departure?.airport {
                airportLabel.text = "\(settings.departure!.airport!)".uppercased()
            }
            if let _ = settings.departure?.date {
                timeLabelArrive.text = workWithTime(settings.departure!.dateAsDate!)
            }
        } else {
            if let _ = settings.arrival?.airport {
                airportLabel.text = "\(settings.arrival!.airport!)".uppercased()
            }
            if let _ = settings.arrival?.date {
                timeLabelArrive.text = workWithTime(settings.arrival!.dateAsDate!)
            }
        }
        
    }
    
}

