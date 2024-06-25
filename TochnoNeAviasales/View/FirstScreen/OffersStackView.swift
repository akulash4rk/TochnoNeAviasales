//
//  OffersStackView.swift
//  TochnoNeAviasales
//
//  Created by Владислав Баранов on 21.06.2024.
//

import Foundation
import UIKit


class OffersStackView : UIStackView {
    
    //MARK: - UI
    let cellForStackView : OffersStackViewCell = {
        let cell = OffersStackViewCell()
        return cell
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


    //MARK: - Functions
extension OffersStackView {
    
    func setupViews(){
        
        axis = .horizontal
        spacing = 67
        
        
        //ПО ТЗ всего 2 картинки с id, не указано, как обрабатывать отсутствие картинок/данных, поэтому просто не добавляю
        
        for data in welcomeArray {
            if (data.title != nil), (data.town != nil), data.price?.value != nil, data.id != nil, imageDic[data.id ?? -1] != nil {
                let currentCell = OffersStackViewCell()
                addArrangedSubview(currentCell)
                currentCell.configure(currentCellData: data)
            }
        }
    }
}
