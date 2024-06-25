//
//  DataPickerViewController.swift
//  TochnoNeAviasales
//
//  Created by Владислав Баранов on 25.06.2024.
//
//Поздно понял, что стоит наследоваться

import Foundation
import UIKit

class DataPickerToViewController : UIViewController {

    //MARK: - UI
    
    var datePickedTo : (() -> Void)?
    var dateDenyTo : (() -> Void)?
    
    
    var cancelButton : UIButton! = nil
    var okButton : UIButton! = nil
    
    
    lazy var datePicker: UIDatePicker = {
        
        let datePicker = UIDatePicker()
        
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .inline
        datePicker.minimumDate = Date()
        
        return datePicker
    }()
    
    //MARK: - ViewDidLoad
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        view.addSubview(datePicker)
        
        view.backgroundColor = Colors.backGray3.color
        
        datePicker.datePickerMode = .date
        datePicker.minimumDate = Date()
        datePicker.preferredDatePickerStyle = .inline
        
        
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
        cancelButton.setTitle("Отмена", for: .normal)
        cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        cancelButton.setTitleColor(Colors.textWhite.color, for: .normal)
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

extension DataPickerToViewController {
    @objc func okButtonTapped() {
        
        
        fromDate = self.datePicker.date

        self.datePickedTo?()
        
        self.dismiss(animated: true)
    }

    @objc func cancelButtonTapped() {
        returnDate = nil
        self.dateDenyTo?()
        self.dismiss(animated: true)
    }

}
