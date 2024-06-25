//
//  ViewController.swift
//  TochnoNeAviasales
//
//  Created by Владислав Баранов on 21.06.2024.
//

import UIKit

class MainViewController: UIViewController, UIScrollViewDelegate {
    
    
    //MARK: - UI
    
    weak var citesDelegate : CitesTableViewDelegate?
    
    let labelMain : UILabel = {
        let labelMain = UILabel()
        labelMain.font = UIFont(name: "SFProDisplay-Medium", size: 22)
        labelMain.textColor = Colors.textWhite.color
        labelMain.numberOfLines = 2
        labelMain.textAlignment = .center
        labelMain.text = "Поиск дешевых авиабилетов"
        labelMain.translatesAutoresizingMaskIntoConstraints = false
        return labelMain
    }()
    
    let labelSecond : UILabel = {
        let labelSecond = UILabel()
        labelSecond.font = UIFont(name: "SFProDisplay-Medium", size: 22)
        labelSecond.textColor = .white
        labelSecond.numberOfLines = 2
        labelSecond.textAlignment = .left
        labelSecond.text = "Музыкально отлететь"
        labelSecond.translatesAutoresizingMaskIntoConstraints = false
        return labelSecond
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }

}


//MARK: - Setup Views
extension MainViewController {
    func setupViews(){

        view.addSubview(labelMain)
        
        NSLayoutConstraint.activate([
            
            labelMain.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelMain.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            labelMain.heightAnchor.constraint(equalToConstant: 130),
            labelMain.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.48),
            
        ])
        
        
        let ask = AskView()
        
        view.addSubview(ask)
        ask.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            ask.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            ask.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            ask.topAnchor.constraint(equalTo: labelMain.bottomAnchor, constant: 16),
            ask.heightAnchor.constraint(equalToConstant: 130),
        ])
        
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(askTapped))
        ask.addGestureRecognizer(gesture)
        
        view.addSubview(labelSecond)
        
        NSLayoutConstraint.activate([
            
            labelSecond.topAnchor.constraint(equalTo: ask.bottomAnchor, constant: 32),
            labelSecond.widthAnchor.constraint(equalTo: view.widthAnchor),
            labelSecond.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
            
        ])
        
        view.backgroundColor = Colors.basicBlack.color
        
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        let stackView = OffersStackView()
        scrollView.addSubview(stackView)
        view.addSubview(scrollView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: labelSecond.bottomAnchor, constant: 32),
            scrollView.heightAnchor.constraint(equalTo: stackView.heightAnchor),
            
            
            stackView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor, constant: -16),
            stackView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
        ])
    }
}


//MARK: - Action
extension MainViewController {
    @objc func askTapped(){
        
        let nextViewController = StartFindViewController()
        present(nextViewController, animated: true)
        
        nextViewController.onClose = {
            let showSomeRes = ShowSomeFlights()
            
            fetchData(from: "https://run.mocky.io/v3/38b5205d-1a3d-4c2f-9d77-2f9d1ef01a4a") { (result: Result<CountryPicked, Error>) in
                
                switch result {
                case .success(let data):
                    if let currentOffers = data.ticketsOffers {
                        ticketsOfferArray = currentOffers
                        DispatchQueue.main.async{
                            
                            self.navigationController?.pushViewController(showSomeRes, animated: true)
                        }
                    } else {
                        print("data.ticketsOffers == nil")
                    }
                case .failure(let error):
                    print("Ошибка: \(error)")
                }
                
            }
        }
        
        nextViewController.empty = {
            self.navigationController?.pushViewController(EmptyViewController(), animated: true)
        }
        
        
    }
}

extension MainViewController : CreateEmptyDelegate {
    func createEmpty() {
        
        navigationController?.pushViewController(EmptyViewController(), animated: true)
    }
}
