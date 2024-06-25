//
//  FourthScreen.swift
//  TochnoNeAviasales
//
//  Created by Владислав Баранов on 24.06.2024.
//

import Foundation
import UIKit


class AllTicketsStackView : UIStackView {
    
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

extension AllTicketsStackView {
    func setupView(){
        
        axis = .vertical
        spacing = 24
        
        layoutMargins = UIEdgeInsets(top: 24, left: 0, bottom: 0, right: 0)
        isLayoutMarginsRelativeArrangement = true 

        
        for i in 0..<availableTickets.count {
            let ticketCell = OneTicketsView()
            addArrangedSubview(ticketCell)
            ticketCell.configure(currentTicket: availableTickets[i])
            
            NSLayoutConstraint.activate([
                ticketCell.leadingAnchor.constraint(equalTo: leadingAnchor),
                ticketCell.trailingAnchor.constraint(equalTo: trailingAnchor),
                ticketCell.heightAnchor.constraint(equalToConstant: 120)
            ])
        
            
            if let badgeText = availableTickets[i].badge {
                let badgeView = BadgeView()
                ticketCell.addSubview(badgeView)
                badgeView.translatesAutoresizingMaskIntoConstraints = false

                badgeView.textLabel.text = badgeText
                
                NSLayoutConstraint.activate([
                    badgeView.centerYAnchor.constraint(equalTo: ticketCell.topAnchor),
                    badgeView.heightAnchor.constraint(equalToConstant: 20),
                    badgeView.widthAnchor.constraint(equalToConstant: 120),
                    badgeView.leadingAnchor.constraint(equalTo: ticketCell.leadingAnchor)
                ])
            }
        }
    }
}
