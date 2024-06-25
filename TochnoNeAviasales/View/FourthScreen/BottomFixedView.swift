//
//  BottomFixedButtons.swift
//  TochnoNeAviasales
//
//  Created by Владислав Баранов on 25.06.2024.
//

import Foundation
import UIKit

class BottomFixedView : UIView {
    
    //MARK: - UI
    
    let mainStackView : UIStackView = {
        let mainStackView = UIStackView()
        
        mainStackView.axis = .horizontal
        mainStackView.spacing = 16
        mainStackView.translatesAutoresizingMaskIntoConstraints = false

        return mainStackView
    }()
    
    let leftView : UIView = {
        
        let leftView = UIView()
        
        let filterLabel : UILabel = {
            
            let filterLabel = UILabel()
            filterLabel.text = "Фильтр"
            filterLabel.textColor = Colors.rlyWhite.color
            filterLabel.font = UIFont(name: "SFProDisplay-Medium", size: 14)
            filterLabel.translatesAutoresizingMaskIntoConstraints = false
            
            return filterLabel
        }()
        
        let filterImage : UIImageView = {
            let image = UIImageView()
            
            image.image = UIImage(named: "settings")
            image.contentMode = .scaleAspectFit
            image.translatesAutoresizingMaskIntoConstraints = false
            
            return image
        }()
        
        leftView.addSubview(filterImage)
        leftView.addSubview(filterLabel)
        
        NSLayoutConstraint.activate([
            filterImage.centerYAnchor.constraint(equalTo: leftView.centerYAnchor),
            filterImage.leadingAnchor.constraint(equalTo: leftView.leadingAnchor, constant: 0),
            filterImage.widthAnchor.constraint(equalToConstant: 24),
            filterImage.heightAnchor.constraint(equalTo: filterImage.widthAnchor),
            
            filterLabel.leadingAnchor.constraint(equalTo: filterImage.trailingAnchor, constant: 4),
            filterLabel.centerYAnchor.constraint(equalTo: leftView.centerYAnchor),
            filterLabel.trailingAnchor.constraint(equalTo: leftView.trailingAnchor)
        ])
        
        return leftView
    }()
    
    private let rightView : UIView = {
        
        let rightView = UIView()
        
        let priceImage : UIImageView = {
            let image = UIImageView()
            
            image.image = UIImage(named: "price")
            image.contentMode = .scaleAspectFit
            image.translatesAutoresizingMaskIntoConstraints = false
            
            return image
        }()
        
        let priceLabel : UILabel = {
            
            let priceLabel = UILabel()
            priceLabel.text = "График цен"
            priceLabel.textColor = Colors.rlyWhite.color
            priceLabel.font = UIFont(name: "SFProDisplay-MediumItalic", size: 14)
            priceLabel.translatesAutoresizingMaskIntoConstraints = false
            
            return priceLabel
        }()
        
        
        rightView.addSubview(priceImage)
        rightView.addSubview(priceLabel)
        
        NSLayoutConstraint.activate([
            priceImage.centerYAnchor.constraint(equalTo: rightView.centerYAnchor),
            priceImage.leadingAnchor.constraint(equalTo: rightView.leadingAnchor, constant: 0),
            priceImage.widthAnchor.constraint(equalToConstant: 24),
            priceImage.heightAnchor.constraint(equalTo: priceImage.widthAnchor),
            
            priceLabel.leadingAnchor.constraint(equalTo: priceImage.trailingAnchor, constant: 4),
            priceLabel.centerYAnchor.constraint(equalTo: rightView.centerYAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: rightView.trailingAnchor)
        ])
        
        return rightView
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

extension BottomFixedView {
    func setupView(){
        
        backgroundColor = Colors.blueCircle.color
        layer.cornerRadius = 20
        
        addSubview(mainStackView)
        
        mainStackView.addArrangedSubview(leftView)
        mainStackView.addArrangedSubview(rightView)
        
        
        
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4),
            mainStackView.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4)
            ]
        )
    }
}
