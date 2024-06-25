//
//  AskViewTouchbleForThirdScreen.swift
//  TochnoNeAviasales
//
//  Created by Владислав Баранов on 22.06.2024.
//

import Foundation
import UIKit

class AskViewTouchbleForThirdView : AskViewTouchbleView {
    //MARK: - UI
    let topRightImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "upDown")
        imageView.tintColor = UIColor(red: 159/255, green: 159/255, blue: 159/255, alpha: 1)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.setContentHuggingPriority(.required, for: .horizontal)
        imageView.setContentHuggingPriority(.required, for: .vertical)
        imageView.setContentCompressionResistancePriority(.required, for: .horizontal)
        imageView.setContentCompressionResistancePriority(.required, for: .vertical)
        return imageView
    }()
    //MARK: - Setup View
    override func setupView(){
        super.setupView()
        
        topImageView.removeFromSuperview()
        bottomLeftImageView.removeFromSuperview()
        topStackView.addArrangedSubview(topRightImageView)
        backgroundColor = nil
    }
    
}
//MARK: - Actions
extension AskViewTouchbleView {
    @objc func swapPressed(){
        
    }
}
