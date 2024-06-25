//
//  DirectFlightsTableViewCell.swift
//  TochnoNeAviasales
//
//  Created by Владислав Баранов on 24.06.2024.
//

import Foundation
import UIKit

class DirectFlightsTableViewCell : UITableViewCell {

    //MARK: - UI
    
    private let cellImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "arrow"))
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.setContentHuggingPriority(.required, for: .horizontal)
        imageView.setContentHuggingPriority(.required, for: .vertical)
        imageView.setContentCompressionResistancePriority(.required, for: .horizontal)
        imageView.setContentCompressionResistancePriority(.required, for: .vertical)
        
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        
        let label = UILabel()
        label.font = UIFont(name: "SFProDisplay-MediumItalic", size: 18)
        label.textColor = Colors.rlyWhite.color
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setContentHuggingPriority(.defaultLow, for: .horizontal)
        label.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProDisplay-Medium", size: 18)
        label.textColor = Colors.textGray.color
        label.text = "Популярное направление"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let circle : UIView = {
        let circle = UIView()
        circle.translatesAutoresizingMaskIntoConstraints = false
        return circle
    }()
    
    private let upperStackView : UIStackView = {
        let upperStackView = UIStackView()
        upperStackView.translatesAutoresizingMaskIntoConstraints = false
        return upperStackView
    }()
    
    private let price : UILabel = {
        let price = UILabel()
        price.textAlignment = .right
        price.font = UIFont(name: "SFProDisplay-MediumItalic", size: 18)
        price.translatesAutoresizingMaskIntoConstraints = false
        price.textColor = Colors.blueCircle.color

        return price
    }()
    
    
    // MARK: - Инициализаторы
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    // MARK: - Setup View
    private func setupViews() {
        
        backgroundColor = Colors.backGray3.color
        
        addSubview(circle)
        addSubview(subtitleLabel)
        
        addSubview(upperStackView)
        
        upperStackView.addArrangedSubview(titleLabel)
        upperStackView.addArrangedSubview(price)
        upperStackView.addArrangedSubview(cellImageView)
        
        upperStackView.distribution = .fill
    
        
        NSLayoutConstraint.activate([
            
            circle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            circle.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            circle.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4),
            circle.widthAnchor.constraint(equalTo: circle.heightAnchor),
        
            upperStackView.leadingAnchor.constraint(equalTo: circle.trailingAnchor, constant: 8),
            upperStackView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            upperStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            
            subtitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            subtitleLabel.topAnchor.constraint(equalTo: upperStackView.bottomAnchor, constant: 8),
            subtitleLabel.leadingAnchor.constraint(equalTo: circle.trailingAnchor, constant: 8),
            subtitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        ])
        
        
    }

    func configure(row: Int, offer: TicketsOffer) {
        if row == 0 {
            circle.backgroundColor = Colors.redCircle.color
        }
        
        if row == 1 {
            circle.backgroundColor = Colors.blueCircle.color
        }
        
        if row == 2 {
            circle.backgroundColor = .white
        }
        
        circle.layer.cornerRadius = (bounds.height - 16) * 0.4
        titleLabel.text = offer.title

        if let data = offer.price, let dataValue = data.value {
            price.text = numberWorking(currentString: dataValue, camesFrom: false)
        }
        
        var someString = ""
        
        if let range = offer.timeRange {
            for currentTime in range {
                someString.append(currentTime)
                someString.append("  ")
            }
            
            subtitleLabel.text = someString
            
        }
        
        
    }
}

