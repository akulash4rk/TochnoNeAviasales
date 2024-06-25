//
//  CitesTableViewCell.swift
//  TochnoNeAviasales
//
//  Created by Владислав Баранов on 22.06.2024.
//

import Foundation
import UIKit

class CitesTableViewCell : UITableViewCell {
    
    //MARK: - UI
    
    private let cellImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProDisplay-Medium", size: 14)
        label.textColor = Colors.textGray.color
        label.text = "Популярное направление"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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

    
        contentView.addSubview(cellImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
        backgroundColor = Colors.frontGray.color
        
        cellImageView.layer.cornerRadius = 8
        cellImageView.backgroundColor = .white
      
        NSLayoutConstraint.activate([
            cellImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            cellImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            cellImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8),
            cellImageView.widthAnchor.constraint(equalTo: cellImageView.heightAnchor),
            
            titleLabel.leadingAnchor.constraint(equalTo: cellImageView.trailingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),

            subtitleLabel.leadingAnchor.constraint(equalTo: cellImageView.trailingAnchor, constant: 15),
            subtitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            subtitleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    func configure(image: UIImage?, title: String) {
        cellImageView.image = image
        titleLabel.text = title
    }
}

