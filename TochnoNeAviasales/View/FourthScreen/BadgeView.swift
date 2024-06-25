//
//  BadgeView.swift
//  TochnoNeAviasales
//
//  Created by Владислав Баранов on 25.06.2024.
//

import Foundation
import UIKit

class BadgeView : UIView {
    
    //MARK: - UI
    
    let textLabel : UILabel = {
        let textLabel = UILabel()
        textLabel.font = UIFont(name: "SFProDisplay-MediumItalic", size: 14)
        textLabel.textColor = Colors.rlyWhite.color
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.textAlignment = .center
        return textLabel
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

extension BadgeView {
    
    func setupView(){
        
        backgroundColor = Colors.blueCircle.color
        layer.cornerRadius = 10
        
        addSubview(textLabel)
        
        NSLayoutConstraint.activate([
        
            textLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            textLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            textLabel.heightAnchor.constraint(equalTo: heightAnchor),
            textLabel.widthAnchor.constraint(equalTo: widthAnchor),
        
        ])

    }
    
    func configure(text : String){
        
        textLabel.text = text
        
    }
    
}
