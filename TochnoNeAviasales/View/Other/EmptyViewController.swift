//
//  EmptyViewController.swift
//  TochnoNeAviasales
//
//  Created by Владислав Баранов on 25.06.2024.
//

import Foundation
import UIKit

class EmptyViewController : UIViewController {
    
    override func viewDidLoad() {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(back), for: .touchUpInside)
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.heightAnchor.constraint(equalToConstant: 100),
            button.widthAnchor.constraint(equalToConstant: 250)
        ])
        
        button.setTitle("Привет, я кнопка", for: .normal)
        button.backgroundColor = .blue
        
        button.layer.cornerRadius = 16
        
        view.backgroundColor = Colors.backGray.color
    }
    
    @objc func back(){
        navigationController?.popViewController(animated: true)
    }
    
}
