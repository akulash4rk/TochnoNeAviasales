//
//  CitesTableView.swift
//  TochnoNeAviasales
//
//  Created by Владислав Баранов on 22.06.2024.
//

import Foundation
import UIKit

let cellID = "CitesCell"

class CitesTableView : UITableView {
    
    //MARK: - Инициализаторы
    
    weak var citesDelegate: CitesTableViewDelegate?
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
}

    //MARK: - Setup View
extension CitesTableView {
    func setupView(){
        delegate = self
        dataSource = self
        
        register(CitesTableViewCell.self, forCellReuseIdentifier: cellID)
        
        backgroundColor = Colors.frontGray.color
        layer.cornerRadius = 16
        
        isScrollEnabled = false
        
    }
}

    //MARK: - Data source

extension CitesTableView : UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return citesOrder.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell 
    {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! CitesTableViewCell
        cell.configure(image: UIImage(named: dicForCites[citesOrder[indexPath.row]]!), title: citesOrder[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(section)
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

//MARK: - Delegate

extension CitesTableView : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        citesDelegate?.didSelectRowAt(name: indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
    }
}
