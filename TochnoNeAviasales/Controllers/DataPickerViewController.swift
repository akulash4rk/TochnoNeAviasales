//
//  DataPickerViewController.swift
//  TochnoNeAviasales
//
//  Created by Владислав Баранов on 25.06.2024.
//

import Foundation
import UIKit

class DataPickerViewController : UIViewController {

    //MARK: - UI
    
    var datePicked : (() -> Void)?
    var dateDeny : (() -> Void)?
    
    
    var cancelButton : UIButton! = nil
    var okButton : UIButton! = nil
    
    
    var datePicker: UIDatePicker = {
        
        let datePicker = UIDatePicker()
        
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .inline
        datePicker.minimumDate = fromDate
        
        return datePicker
    }()
    
    //MARK: - ViewDidLoad
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        view.addSubview(datePicker)
        
        view.backgroundColor = Colors.backGray3.color
        
        datePicker.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            datePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            datePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            datePicker.topAnchor.constraint(equalTo: view.topAnchor, constant: 8),
        ])

        okButton = UIButton(type: .custom)
        okButton.setTitle("Готово", for: .normal)
        
        
        
        okButton.addTarget(self, action: #selector(okButtonTapped), for: .touchUpInside)
        view.addSubview(okButton)
        okButton.translatesAutoresizingMaskIntoConstraints = false
        okButton.setTitleColor(Colors.textWhite.color, for: .normal)
        okButton.titleLabel?.font = UIFont(name: "SFProDisplay-Medium", size: 18)

        

        cancelButton = UIButton(type: .custom)
        cancelButton.setTitle("Сброс", for: .normal)
        cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        cancelButton.setTitleColor(Colors.redCircle.color, for: .normal)
        cancelButton.titleLabel?.font = UIFont(name: "SFProDisplay-Medium", size: 18)
        
        view.addSubview(cancelButton)
        cancelButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            
            okButton.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 16),
            okButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -32),
            
            cancelButton.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 16),
            cancelButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
        ])
        
    }
    
}

    //MARK: - Actions

extension DataPickerViewController {
    @objc func okButtonTapped() {
        
        returnDate = self.datePicker.date
        
        self.datePicked?()
        
        self.dismiss(animated: true)
    }

    @objc func cancelButtonTapped() {
        returnDate = nil
        self.dateDeny?()
        self.dismiss(animated: true)
    }

}
