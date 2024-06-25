//
//  ShowSomeFlights.swift
//  TochnoNeAviasales
//
//  Created by Владислав Баранов on 22.06.2024.
//

import Foundation
import UIKit

//ТЗ: Нужно чуть больше информации для более корректного вида.

class ShowSomeFlights : UIViewController  {
    
    //MARK: - UI
    
    var currentScrollView = UIScrollView()
    
    let directLabel : UILabel = {
        
        let directLabel = UILabel()
        
        directLabel.font = UIFont(name: "SFProDisplay-Bold", size: 20)
        directLabel.translatesAutoresizingMaskIntoConstraints = false
        directLabel.text = "Прямые шпалы"
        directLabel.textColor = Colors.rlyWhite.color
        directLabel.clipsToBounds = true
        
        return directLabel
    }()
    
    let backPlate : UIView =  {
        
        let backPlate = UIView()
        
        backPlate.backgroundColor = Colors.backGray3.color
        backPlate.translatesAutoresizingMaskIntoConstraints = false
        backPlate.layer.cornerRadius = 16
        
        return backPlate
    }()
    
    var askView : AskWithBackView!
    
    let showAllTicketsView : UIView = {
        let showAllTicketsView = UIView()
        showAllTicketsView.translatesAutoresizingMaskIntoConstraints = false
        showAllTicketsView.layer.cornerRadius = 8
        showAllTicketsView.backgroundColor = Colors.blueCircle.color
        
        
        let textOnButton = UILabel()
        showAllTicketsView.addSubview(textOnButton)
        textOnButton.text = "Посмотреть все билеты"
        textOnButton.textAlignment = .center
        textOnButton.font = UIFont(name: "SFProDisplay-MediumItalic", size: 18)
        textOnButton.textColor = Colors.rlyWhite.color
        
        textOnButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textOnButton.centerXAnchor.constraint(equalTo: showAllTicketsView.centerXAnchor),
            textOnButton.centerYAnchor.constraint(equalTo: showAllTicketsView.centerYAnchor),
            textOnButton.leadingAnchor.constraint(equalTo: showAllTicketsView.leadingAnchor),
            textOnButton.trailingAnchor.constraint(equalTo: showAllTicketsView.trailingAnchor)
        ])
        
        
        return showAllTicketsView
    }()
    
    
    let notificationButton : UIView = {
        let notificationButton = UIView()
        
        notificationButton.layer.cornerRadius = 8
        notificationButton.backgroundColor = Colors.backGray2.color
        
        let mainStackView = UIStackView()
        mainStackView.spacing = 16
        mainStackView.alignment = .center
        
        let ringImage = UIImageView(image: UIImage(named: "ring"))
        ringImage.tintColor = Colors.blueCircle.color
        ringImage.translatesAutoresizingMaskIntoConstraints = false
        
        ringImage.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        ringImage.setContentHuggingPriority(.defaultHigh, for: .vertical)
        ringImage.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        ringImage.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        
        let textLabel = UILabel()
        textLabel.font = UIFont(name: "SFProDisplay-Medium", size: 18)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.text = "Подписка на цену"
        textLabel.textColor = Colors.rlyWhite.color
        
        let switcher = UISwitch()
        switcher.translatesAutoresizingMaskIntoConstraints = false
        
        mainStackView.addArrangedSubview(ringImage)
        mainStackView.addArrangedSubview(textLabel)
        notificationButton.addSubview(switcher)
        
        switcher.centerYAnchor.constraint(equalTo: notificationButton.centerYAnchor).isActive = true
        
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        
        notificationButton.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: notificationButton.topAnchor, constant: 8),
            mainStackView.trailingAnchor.constraint(equalTo: switcher.leadingAnchor, constant: -16),
            mainStackView.bottomAnchor.constraint(equalTo: notificationButton.bottomAnchor, constant: -8),
            mainStackView.leadingAnchor.constraint(equalTo: notificationButton.leadingAnchor, constant: 16),
            
            ringImage.heightAnchor.constraint(equalTo: notificationButton.heightAnchor, constant: -16),
            ringImage.widthAnchor.constraint(equalTo: ringImage.heightAnchor),
            
            switcher.trailingAnchor.constraint(equalTo: notificationButton.trailingAnchor, constant: -16),
            switcher.centerYAnchor.constraint(equalTo: notificationButton.centerYAnchor)
            
        ])
        
        return notificationButton
    }()
    
    //ТЗ: Кнопка “Показать все” не отображается + "val" не стал пописывать лейбл
    //MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        
        currentScrollView = SettingsScrollView()
        view.addSubview(currentScrollView)
        (currentScrollView as? SettingsScrollView)?.showCalendaryDelegate = self
        (currentScrollView as? SettingsScrollView)?.showToCalendaryDelegate = self
        
        askView = AskWithBackView()
        view.addSubview(askView)
        
        askView.buttonPressed = {
            self.navigationController?.popViewController(animated: true)
        }
        
        let tableView = DirectFlightsTableView()
        view.addSubview(tableView)
        
        view.addSubview(showAllTicketsView)
        view.addSubview(backPlate)
        
        backPlate.addSubview(directLabel)
        backPlate.addSubview(tableView)
        
        view.addSubview(notificationButton)
        
        notificationButton.translatesAutoresizingMaskIntoConstraints = false
        askView.translatesAutoresizingMaskIntoConstraints = false
        currentScrollView.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        view.backgroundColor = Colors.basicBlack.color
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(goToNextView))
        showAllTicketsView.addGestureRecognizer(gesture)
        showAllTicketsView.isUserInteractionEnabled = true
        
        
        NSLayoutConstraint.activate([
            
            askView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            askView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            askView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            askView.heightAnchor.constraint(equalToConstant: 96),
            
            currentScrollView.topAnchor.constraint(equalTo: askView.bottomAnchor, constant: 16),
            currentScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            currentScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            currentScrollView.heightAnchor.constraint(equalToConstant: 33),
            
            backPlate.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            backPlate.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            backPlate.topAnchor.constraint(equalTo: currentScrollView.bottomAnchor, constant: 16),
            backPlate.heightAnchor.constraint(equalToConstant: 250),
            
            directLabel.leadingAnchor.constraint(equalTo: backPlate.leadingAnchor, constant: 16),
            directLabel.topAnchor.constraint(equalTo: backPlate.topAnchor, constant: 16),
            
            tableView.topAnchor.constraint(equalTo: directLabel.bottomAnchor, constant: 8),
            tableView.leadingAnchor.constraint(equalTo: backPlate.leadingAnchor, constant: 8),
            tableView.trailingAnchor.constraint(equalTo: backPlate.trailingAnchor, constant: -8),
            tableView.bottomAnchor.constraint(equalTo: backPlate.bottomAnchor, constant: 8),
            
            
            showAllTicketsView.topAnchor.constraint(equalTo: backPlate.bottomAnchor, constant: 16),
            showAllTicketsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            showAllTicketsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            showAllTicketsView.heightAnchor.constraint(equalToConstant: 42),
            
            notificationButton.topAnchor.constraint(equalTo: showAllTicketsView.bottomAnchor, constant: 16),
            notificationButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            notificationButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            notificationButton.heightAnchor.constraint(equalTo: showAllTicketsView.heightAnchor),
            
        ])
        
    }
    
}


//MARK: - Delegate

extension ShowSomeFlights : ShowCalendarTo {
    func willShowCalendaryTo(){
        
        let controller = DataPickerToViewController()
        
        if let sheetController = controller.sheetPresentationController{
            sheetController.detents = [.medium()]
        }
        
        controller.dateDenyTo = {
            
        }
        
        controller.datePickedTo = {
            self.changeDate(date: fromDate, isFrom: false)
        }
        
        
        
        present(controller, animated: true)
    }
}


extension ShowSomeFlights : ShowCalendar {
    
    
    func willShowCalendary() {
        let controller = DataPickerViewController()
        if let sheetController = controller.sheetPresentationController{
            sheetController.detents = [.medium()]
        }
        
        controller.dateDeny = {
            self.setReturn()
        }
        
        controller.datePicked = {
            if let _ = returnDate {
                self.changeDate(date: returnDate!, isFrom: true)
            }
        }
        
        
        present(controller, animated: true)
    }
}

    //MARK: - Actions

extension ShowSomeFlights {
    
    func changeDate(date someDate : Date, isFrom : Bool){
        
        if let stackView = self.currentScrollView.subviews.first(where: { $0 is UIStackView }) as? UIStackView {
            if let returnDate = returnDate {
                if fromDate > returnDate{
                    setReturn()
                }
            }
            
            var arrangedSubview : UIView? = nil
            
            if isFrom {
                arrangedSubview = stackView.arrangedSubviews.first
            }
            else {
                arrangedSubview = stackView.arrangedSubviews[1]
            }
            
            if let viewForSettingsElement = arrangedSubview {
                if let settingsElement = viewForSettingsElement.subviews.compactMap({ $0 as? SettingsElementView}).first {
                    
                    let dataFormatted = workWithData(choosedDate: someDate)
                    settingsElement.textView.attributedText = setDifColor(index: dataFormatted.1, string: dataFormatted.0)

                }
            }
        }
    }
    
    func setReturn(){
        if let stackView = self.currentScrollView.subviews.first(where: { $0 is UIStackView }) as? UIStackView {
            
            let arrangedSubview = stackView.arrangedSubviews.first
            if let viewForSettingsElement = arrangedSubview {
                
                if let settingsElement = viewForSettingsElement.subviews.compactMap({ $0 as? SettingsElementView }).first {
                    
                    settingsElement.textView.text = "обратно"
                    
                    
                }
            }
        }
    }
    
   @objc func goToNextView(){
       let nextView = ShowAllTicketsViewController()
       fetchData(from: "https://run.mocky.io/v3/c0464573-5a13-45c9-89f8-717436748b69") { (result: Result<ShowAll, Error>) in
           switch result {
           case .success(let data):
               if let currentOffers = data.tickets {
                   allTicketsArray = currentOffers
                   availableTickets = allTicketsArray
                   DispatchQueue.main.async{
                       self.navigationController?.pushViewController(nextView, animated: true)
                   }
               } else {
                   print("data.ticketsOffers == nil")
               }
           case .failure(let error):
               print("Ошибка: \(error)")
           }
           
       }
        
        
    }

}
