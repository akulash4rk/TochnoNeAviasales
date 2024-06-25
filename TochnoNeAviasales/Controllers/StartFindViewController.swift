//
//  StartFindViewController.swift
//  TochnoNeAviasales
//
//  Created by Владислав Баранов on 21.06.2024.
//

import Foundation
import UIKit

class StartFindViewController : UIViewController {
    
    var onClose : (() -> Void?)?
    var empty : (() -> Void)?

    var ask : AskViewTouchbleView!
    
    //MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = Colors.backGray2.color
        
        ask = AskViewTouchbleView()
        view.addSubview(ask)

        ask.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        ask.layer.shadowOpacity = 1
        ask.layer.shadowOffset = CGSize(width: 0, height: 4)
        ask.layer.shadowRadius = 4
        
        let special = SpecialView()
        view.addSubview(special)
        special.empty = self
        
        special.hardWay = {
            self.ask.bottomTextField.text = "Сложный маршрут"
        }
        
        
        let tableView = CitesTableView()
        view.addSubview(tableView)
        
        tableView.citesDelegate = self
        ask.arriveDelegate = self
        
        
        ask.translatesAutoresizingMaskIntoConstraints = false
        special.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            ask.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            ask.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            ask.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            ask.heightAnchor.constraint(equalToConstant: 130),
            
            special.topAnchor.constraint(equalTo: ask.bottomAnchor, constant: 16),
            special.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            special.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            tableView.topAnchor.constraint(equalTo: special.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            tableView.heightAnchor.constraint(equalToConstant: 60 * 3 + 32), //60 секция + 32 отспуы
        ])
        
    }
}

    //MARK: - Delegate

extension StartFindViewController : CreateEmptyDelegate {
    func createEmpty() {
        dismiss(animated: true)
        self.empty?()
    }
}

extension StartFindViewController : CitesTableViewDelegate {
    
    func didSelectRowAt(name: Int) {
        ask.bottomTextField.text = citesOrder[name]
    }
    
}
    
extension StartFindViewController : ArriveDelegate {
    
    func didPickedCities(from: String, to: String) {
        self.onClose?()
        dismiss(animated: true)
    }
    
}
