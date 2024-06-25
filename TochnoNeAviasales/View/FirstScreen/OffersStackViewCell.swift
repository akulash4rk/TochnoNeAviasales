//
//  OffersStackViewCell.swift
//  TochnoNeAviasales
//
//  Created by Владислав Баранов on 21.06.2024.
//

import Foundation
import UIKit
import SVGKit

class OffersStackViewCell : UIStackView{
    
    //MARK: - UI
    
    let imageMain : UIImageView = {
        let imageMain = UIImageView()
        imageMain.layer.cornerRadius = 16
        imageMain.clipsToBounds = true
        imageMain.contentMode = .scaleAspectFill
        imageMain.translatesAutoresizingMaskIntoConstraints = false
        return imageMain
    }()
    
    let name : UILabel = {
        let name = UILabel()
        name.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        name.textColor = .white
        name.numberOfLines = 3
        name.lineBreakMode = .byWordWrapping
        name.textAlignment = .left
        return name
    }()
    
    let city : UILabel = {
        let city = UILabel()
        city.font = UIFont(name: "SFProDisplay-Medium", size: 14)
        city.textColor = .white
        city.numberOfLines = 2
        city.lineBreakMode = .byWordWrapping
        city.textAlignment = .left
        return city
    }()
    
    let price : UILabel = {
        let price = UILabel()
        price.font = UIFont(name: "SFProDisplay-Medium", size: 14)
        price.textColor = .white
        return price
    }()
    
    let planeImage : UIImageView = {
        let planeImage = UIImageView(image: UIImage(named: "plane"))
        planeImage.clipsToBounds = true
        planeImage.setContentHuggingPriority(.required, for: .horizontal)
        planeImage.setContentHuggingPriority(.required, for: .vertical)
        planeImage.setContentCompressionResistancePriority(.required, for: .horizontal)
        planeImage.setContentCompressionResistancePriority(.required, for: .vertical)
        return planeImage
    }()
    
    //MARK: - Инициализаторы
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//MARK: - Setup View
extension OffersStackViewCell {
    func setupViews(){
        
        spacing = 16
        axis = .vertical
        
        addArrangedSubview(imageMain)
        imageMain.backgroundColor = .brown
        imageMain.translatesAutoresizingMaskIntoConstraints = false

            
        
        addArrangedSubview(name)
        addArrangedSubview(city)
    
        let priceStackView = UIStackView()
        priceStackView.spacing = 8
        priceStackView.addArrangedSubview(planeImage)
        priceStackView.addArrangedSubview(price)
        addArrangedSubview(priceStackView) 

    }
    
    func configure(currentCellData : Offer){
        
        let imageHeightOption = UIScreen.main.bounds.width * 0.37
        let imageWidthOptionSmall = UIScreen.main.bounds.width * 0.37
        let imageWidthOptionBig = UIScreen.main.bounds.width * 0.37 * 2
        
        
        if let priceString = currentCellData.price?.value {
            price.text = numberWorking(currentString: priceString, camesFrom: true)
        }
        
        if let town = currentCellData.town {
            city.text = town
        }
        
        if let titleString = currentCellData.title {
            name.text = titleString
            if name.text == "Die Antwoord" {
                name.layer.cornerRadius = 16
                
                // Сколько не выкручивал яркость, не смог заметить различия..
                
                let shadow = NSShadow()
                shadow.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25)
                shadow.shadowOffset = CGSize(width: 0, height: 4)
                shadow.shadowBlurRadius = 4

                let attributes: [NSAttributedString.Key: Any] = [
                    .strokeWidth: -1,
                    .strokeColor: UIColor.black,
                    .shadow: shadow
                ]
            
                let attributedString = NSAttributedString(string: "Die Antwoord", attributes: attributes)
                name.attributedText = attributedString

                
            }
        }
        
        if let id = currentCellData.id {
            if let imageDic = imageDic[id] {
                
                //Не нашел по какой логике они квадратные или прямоугольные, поэтому привязался к id
                
                if id == 1 {
                    imageMain.image = imageDic
                    
                    NSLayoutConstraint.activate([
                        imageMain.heightAnchor.constraint(equalToConstant: imageHeightOption),
                        imageMain.widthAnchor.constraint(equalToConstant: imageWidthOptionSmall)
                    ])
                }
                
                if id == 2 {
                    imageMain.image = imageDic
                    NSLayoutConstraint.activate([
                        imageMain.heightAnchor.constraint(equalToConstant: imageHeightOption),
                        imageMain.widthAnchor.constraint(equalToConstant: imageWidthOptionBig)
                    ])
                }
              
                
            }
        }
    }
    
    
    
    
    
    //Scaling in % if need
    func imageWorking(image: UIImage, targetHeight: CGFloat) -> UIImage? {
        let scaleFactor = targetHeight / image.size.height
        let newWidth = image.size.width * scaleFactor
        let newSize = CGSize(width: newWidth, height: targetHeight)
        
        
        let renderFormat = UIGraphicsImageRendererFormat.default()
        renderFormat.opaque = false
        let renderer = UIGraphicsImageRenderer(size: newSize, format: renderFormat)
        
        let resizedImage = renderer.image { _ in
            image.draw(in: CGRect(origin: .zero, size: newSize))
        }
        
        return resizedImage
    }
    
    func setSmallSquare(image : UIImage) -> UIImage {
        let newWidth = bounds.width * 0.37
        let newSize = CGSize(width: newWidth, height: newWidth)
        
        let renderFormat = UIGraphicsImageRendererFormat.default()
        renderFormat.opaque = false
        let renderer = UIGraphicsImageRenderer(size: newSize, format: renderFormat)
        
        let _ = renderer.image { _ in
            image.draw(in: CGRect(origin: .zero, size: newSize))
        }
        
        return image
    }
    
    
    func setBig(image : UIImage) -> UIImage {
        let newWidth = bounds.width * 0.37 * 2
        let newSize = CGSize(width: newWidth, height: newWidth / 2)
        
        let renderFormat = UIGraphicsImageRendererFormat.default()
        renderFormat.opaque = false
        let renderer = UIGraphicsImageRenderer(size: newSize, format: renderFormat)
        
        let _ = renderer.image { _ in
            image.draw(in: CGRect(origin: .zero, size: newSize))
        }
        
        return image
    }
}
