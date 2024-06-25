//
//  SettingsStackView.swift
//  TochnoNeAviasales
//
//  Created by Владислав Баранов on 22.06.2024.
//

import Foundation
import UIKit



class SettingsScrollView : UIScrollView {
    
    //MARK: - UI
    
    weak var showCalendaryDelegate: ShowCalendar?
    weak var showToCalendaryDelegate: ShowCalendarTo?
    
    let currentStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
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

extension SettingsScrollView{
    func setupView(){
        
        addSubview(currentStackView)
        showsHorizontalScrollIndicator = false
        
        
        for (index, value) in settingsOrder.enumerated() {
            
            let viewForSettingsElement = UIView()
            let settingsElement = SettingsElementView()
            
            if index == 0 {
                let gesture = UITapGestureRecognizer(target: self, action: #selector(pickDate))
                settingsElement.addGestureRecognizer(gesture)
                isUserInteractionEnabled = true
            }
            if index == 1 {
                let gesture = UITapGestureRecognizer(target: self, action: #selector(pickDateTo))
                settingsElement.addGestureRecognizer(gesture)
                isUserInteractionEnabled = true
            }
            
            settingsElement.configure(imageString: dicForSettings[value], textString: value, id: index)
            
            viewForSettingsElement.addSubview(settingsElement)
            viewForSettingsElement.backgroundColor = Colors.semiGray.color
            
            viewForSettingsElement.layer.cornerRadius = 15
            
            viewForSettingsElement.translatesAutoresizingMaskIntoConstraints = false
            settingsElement.translatesAutoresizingMaskIntoConstraints = false
            
            currentStackView.addArrangedSubview(viewForSettingsElement)
            
            NSLayoutConstraint.activate([
                
                currentStackView.leadingAnchor.constraint(equalTo: contentLayoutGuide.leadingAnchor, constant: 16),
                currentStackView.trailingAnchor.constraint(equalTo: contentLayoutGuide.trailingAnchor, constant: -16),
                currentStackView.topAnchor.constraint(equalTo: contentLayoutGuide.topAnchor),
                currentStackView.bottomAnchor.constraint(equalTo: contentLayoutGuide.bottomAnchor),
                
                viewForSettingsElement.heightAnchor.constraint(equalToConstant: 33),
                settingsElement.centerYAnchor.constraint(equalTo: viewForSettingsElement.centerYAnchor),
                
                
                settingsElement.trailingAnchor.constraint(equalTo: viewForSettingsElement.trailingAnchor, constant: -8)
            ])
            
            if dicForSettings[value] == nil {
                NSLayoutConstraint.activate([
                settingsElement.leadingAnchor.constraint(equalTo: viewForSettingsElement.leadingAnchor),

                ])
            } else {
                NSLayoutConstraint.activate([
                settingsElement.leadingAnchor.constraint(equalTo: viewForSettingsElement.leadingAnchor, constant: 8),
                ])
            }
        }
    }
}

    //MARK: - Delegate & Actions

extension SettingsScrollView {
    @objc func pickDate(){
        showCalendaryDelegate?.willShowCalendary()
    }
    
    @objc func pickDateTo(){
        showToCalendaryDelegate?.willShowCalendaryTo()
    }
}
