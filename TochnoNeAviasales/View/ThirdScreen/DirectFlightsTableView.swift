//
//  directFlightsTableView.swift
//  TochnoNeAviasales
//
//  Created by Владислав Баранов on 24.06.2024.
//

import Foundation
import UIKit

let cellIDTwo = "showFlights"

class DirectFlightsTableView : UITableView {
    
    //MARK: - Инициализаторы
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func setupView(){
        
        dataSource = self
        delegate = self
        
        register(DirectFlightsTableViewCell.self, forCellReuseIdentifier: cellIDTwo)
        
        
        isScrollEnabled = false
        backgroundColor = nil
        
    }
}
//MARK: - Data Source
extension DirectFlightsTableView : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return min(ticketsOfferArray.count, 3)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIDTwo, for: indexPath) as! DirectFlightsTableViewCell
        cell.configure(row: indexPath.row, offer: ticketsOfferArray[indexPath.row])

        return cell
    }
}

//MARK: - Delegate
extension DirectFlightsTableView : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
    }
}
