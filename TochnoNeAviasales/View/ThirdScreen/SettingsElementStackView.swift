//
//  SettingsElement.swift
//  TochnoNeAviasales
//
//  Created by Владислав Баранов on 22.06.2024.
//

import Foundation
import UIKit

class SettingsElementView : UIStackView {
    
    //MARK: - UI
    
    weak var showCalendaryDelegate: ShowCalendar?
    
    let imageView : UIImageView = {
        
        let imageView = UIImageView()
        
        imageView.contentMode = .scaleAspectFit
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let textView : UILabel = {
        
        let textView = UILabel()
        
        textView.clipsToBounds = true
        textView.textColor = Colors.rlyWhite.color
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont(name: "SFProDisplay-MediumItalic", size: 16)
        
        return textView
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

extension SettingsElementView {
    
    func setupView(){
        
        addArrangedSubview(imageView)
        addArrangedSubview(textView)
        
        layer.cornerRadius = 2
        
        axis = .horizontal
        spacing = 8
        alignment = .leading
        distribution = .fillProportionally
        
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            textView.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
        

    }
    
    func configure(imageString: String?, textString: String, id: Int){
        
        if let imageString = imageString {
            imageView.image = UIImage(named: imageString)
        }
        
        textView.text = textString
        
        if textString == "обратно" {
            
            let shadow = NSShadow()
            shadow.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25)
            shadow.shadowOffset = CGSize(width: 0, height: 4)
            shadow.shadowBlurRadius = 4

            let attributes: [NSAttributedString.Key: Any] = [
                .strokeWidth: -1,
                .strokeColor: UIColor.black,
                .shadow: shadow
            ]
            
            let attributedString = NSAttributedString(string: "обратно", attributes: attributes)
            textView.attributedText = attributedString
            
        }
        if textString == "дата" {
            
            let someString = workWithData(choosedDate: nil)
            textView.attributedText = setDifColor(index: someString.1, string: someString.0)
            
        }
    }
}
