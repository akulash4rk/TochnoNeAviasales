//
//  AskWithBackView.swift
//  TochnoNeAviasales
//
//  Created by Владислав Баранов on 22.06.2024.
//

import Foundation
import UIKit

class AskWithBackView : UIView {
    
    var buttonPressed : (() -> Void)?
    var swapPressed : (() -> Void)?
    
    var askStackView : AskViewTouchbleForThirdView!
    
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
extension AskWithBackView {
    func setupView(){
        
        let backButton = UIImageView(image: UIImage(named: "back"))
        backButton.translatesAutoresizingMaskIntoConstraints = false
        

        backgroundColor = Colors.semiGray.color
        layer.cornerRadius = 16
        
        addSubview(backButton)
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(returnBack))
        backButton.addGestureRecognizer(gesture)
        backButton.isUserInteractionEnabled = true
        
        askStackView = AskViewTouchbleForThirdView()
        addSubview(askStackView)
        askStackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        let gestureSwap = UITapGestureRecognizer(target: self, action: #selector(swapWillPress))
        askStackView.topRightImageView.addGestureRecognizer(gestureSwap)
        askStackView.topRightImageView.isUserInteractionEnabled = true
        
        askStackView.topTextField.text = currentForm
        askStackView.bottomTextField.text = currentTo
        
        NSLayoutConstraint.activate([
            
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            backButton.heightAnchor.constraint(equalTo: backButton.widthAnchor),
            backButton.widthAnchor.constraint(equalToConstant: 24),
            backButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            askStackView.leadingAnchor.constraint(equalTo: backButton.trailingAnchor),
            askStackView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            askStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            askStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
                        
        ])
    }
}

//MARK: - Actions
extension AskWithBackView {
    @objc func returnBack() {
        buttonPressed?()
    }
    
    @objc func swapWillPress() {

        let top = askStackView.topTextField.text
        askStackView.topTextField.text = askStackView.bottomTextField.text
        askStackView.bottomTextField.text = top
        
    }

    
}
