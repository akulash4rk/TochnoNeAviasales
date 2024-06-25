//
//  askView.swift
//  TochnoNeAviasales
//
//  Created by Владислав Баранов on 21.06.2024.
//

import Foundation
import UIKit


class AskView : UIView {
    
    //MARK: - UI
    
    let backPanel : UIView = {
        let backPanel = UIView()
        backPanel.backgroundColor = Colors.semiGray.color
        backPanel.layer.cornerRadius = 16
        return backPanel
    }()
    
    
    let frontPanel : UIView = {
        let frontPanel = UIView()
        frontPanel.backgroundColor = Colors.frontGray.color
        frontPanel.layer.cornerRadius = 16
        frontPanel.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        frontPanel.layer.shadowOpacity = 1
        frontPanel.layer.shadowOffset = CGSize(width: 0, height: 4)
        frontPanel.layer.shadowRadius = 4
        return frontPanel
    }()
    
    let image : UIImageView = {
        let image = UIImageView(image: UIImage(named: "glass"))
        image.tintColor = Colors.iconGray.color
        return image
    }()
    
    let stackViewForFrontPanel : UIStackView = {
        let stackViewForFrontPanel = UIStackView()
        stackViewForFrontPanel.axis = .horizontal
        return stackViewForFrontPanel
    }()
    
    let stackViewForLabels : UIStackView  = {
        let stackViewForLabels = UIStackView()
        stackViewForLabels.axis = .vertical
        return stackViewForLabels
    }()
    
    let labelFrom : UILabel = {
        let labelFrom = UILabel()
        labelFrom.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        labelFrom.textColor = Colors.whiteGray.color
        labelFrom.text = "Откуда - Москва"
        
        if let _ = currentForm {
            labelFrom.text = currentForm!
            labelFrom.textColor = Colors.rlyWhite.color
        }
        
        return labelFrom
    }()
    
    let labelTo : UILabel = {
        let labelTo = UILabel()
        labelTo.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        labelTo.textColor = Colors.whiteGray.color
        labelTo.text = "Куда - Турция"
        return labelTo
    }()
    
    let line : UIView = {
        let line = UIView()
        line.backgroundColor = Colors.whiteGray.color
        return line
    }()
    
    //MARK: - Инициализаторы
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


    //MARK: - Setup Views
extension AskView {
    func setupViews(){
        addSubview(backPanel)
        
        backPanel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backPanel.topAnchor.constraint(equalTo: topAnchor),
            backPanel.bottomAnchor.constraint(equalTo: bottomAnchor),
            backPanel.leadingAnchor.constraint(equalTo: leadingAnchor),
            backPanel.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
        
        backPanel.addSubview(frontPanel)
        frontPanel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            frontPanel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            frontPanel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            frontPanel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            frontPanel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
        
        
        frontPanel.addSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            image.heightAnchor.constraint(equalTo: frontPanel.heightAnchor, multiplier: 0.26),
            image.widthAnchor.constraint(equalTo: frontPanel.heightAnchor, multiplier: 0.26),
            image.centerYAnchor.constraint(equalTo: frontPanel.centerYAnchor),
            image.leadingAnchor.constraint(equalTo: frontPanel.leadingAnchor, constant: 8)
        ])
        
        frontPanel.addSubview(line)
        line.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            line.heightAnchor.constraint(equalToConstant: 2),
            line.centerYAnchor.constraint(equalTo: frontPanel.centerYAnchor),
            line.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 16),
            line.trailingAnchor.constraint(equalTo: frontPanel.trailingAnchor, constant: -16)
        ])
        
        frontPanel.addSubview(labelFrom)
        labelFrom.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            labelFrom.leadingAnchor.constraint(equalTo: line.leadingAnchor),
            labelFrom.trailingAnchor.constraint(equalTo: line.trailingAnchor),
            labelFrom.bottomAnchor.constraint(equalTo: line.topAnchor, constant: -8)
        ])
        
        
        frontPanel.addSubview(labelTo)
        labelTo.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            labelTo.leadingAnchor.constraint(equalTo: line.leadingAnchor),
            labelTo.trailingAnchor.constraint(equalTo: line.trailingAnchor),
            labelTo.topAnchor.constraint(equalTo: line.bottomAnchor, constant: 8)
        ])
        
    }
}
