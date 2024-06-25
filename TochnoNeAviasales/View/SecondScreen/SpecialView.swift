//
//  SpecialView.swift
//  TochnoNeAviasales
//
//  Created by Владислав Баранов on 22.06.2024.
//

import Foundation
import UIKit

class SpecialView : UIStackView {
    
    //MARK: - UI
    
    weak var empty: CreateEmptyDelegate?
    var hardWay : (() -> Void)?
    
    let stackView : UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let imageView : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.setContentHuggingPriority(.required, for: .horizontal)
        image.setContentHuggingPriority(.required, for: .vertical)
        image.setContentCompressionResistancePriority(.required, for: .horizontal)
        image.setContentCompressionResistancePriority(.required, for: .vertical)
        return image
    }()
    
    let text : UILabel = {
        let text = UILabel()
        text.numberOfLines = 2
        text.textAlignment = .center
        text.lineBreakMode = .byWordWrapping
        return text
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

extension SpecialView {
    func setupView(){
        
        distribution = .fillEqually

        spacing = 8
        axis = .horizontal
        
        for (index, data) in specialOrder.enumerated(){
            let cell = configure(key: data)
            addArrangedSubview(cell)
            cell.isUserInteractionEnabled = true
            if index != 0 {
                let gesture = UITapGestureRecognizer(target: self, action: #selector(emptyFunc))
                cell.addGestureRecognizer(gesture)
            } else {
                let gesture = UITapGestureRecognizer(target: self, action: #selector(hard))
                cell.addGestureRecognizer(gesture)
            }
            
        }
    }
    
    
    func configure(key: String) -> UIStackView {
        let cell = UIStackView()
        cell.axis = .vertical
        cell.alignment = .center

        let newImageView = UIImageView()
        newImageView.contentMode = .scaleAspectFit
        newImageView.image = UIImage(named: dicForSpecial[key] ?? "")
        cell.addArrangedSubview(newImageView)

        let newTextLabel = UILabel()
        newTextLabel.text = key
        newTextLabel.numberOfLines = 2
        newTextLabel.textAlignment = .center
        newTextLabel.lineBreakMode = .byWordWrapping
        newTextLabel.font = UIFont(name: "SFProDisplay-Medium", size: 14)
        newTextLabel.textColor = .white
        cell.addArrangedSubview(newTextLabel)

        cell.spacing = 8

        newImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            newImageView.widthAnchor.constraint(equalTo: cell.widthAnchor, multiplier: 0.8),
            newImageView.heightAnchor.constraint(equalTo: cell.widthAnchor, multiplier: 0.8)
        ])

        return cell
    }
}
    //MARK: - Actions
extension SpecialView {
    @objc func emptyFunc(){
        empty?.createEmpty()
    }
    @objc func hard(){
        hardWay?()
    }
}
