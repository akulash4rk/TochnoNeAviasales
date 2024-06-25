import Foundation
import UIKit

class ShowAllTicketsViewController: UIViewController {
    
    //MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Colors.basicBlack.color
        
        let wayInfo = MainWayView()
        view.addSubview(wayInfo)
        wayInfo.translatesAutoresizingMaskIntoConstraints = false
        wayInfo.configure()
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(returnBack))
        wayInfo.backArrow.addGestureRecognizer(gesture)
        wayInfo.backArrow.isUserInteractionEnabled = true
        
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        let ticketsStackView = AllTicketsStackView()
        ticketsStackView.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Colors.basicBlack.color
        scrollView.addSubview(ticketsStackView)
        
        ticketsStackView.clipsToBounds = true
        
        let bottomButtons = BottomFixedView()
        view.addSubview(bottomButtons)
        bottomButtons.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            wayInfo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            wayInfo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            wayInfo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            wayInfo.heightAnchor.constraint(equalToConstant: 60),
            
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: wayInfo.bottomAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            ticketsStackView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor, constant: 16),
            ticketsStackView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor, constant: -16),
            ticketsStackView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            ticketsStackView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),

            ticketsStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -32),
            
            bottomButtons.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bottomButtons.heightAnchor.constraint(equalToConstant: 40),
            bottomButtons.widthAnchor.constraint(equalTo: bottomButtons.mainStackView.widthAnchor, constant: 8),
            bottomButtons.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
            
        ])
    
    }
}

//MARK: - Actions

extension ShowAllTicketsViewController {
    @objc func returnBack(){
        self.navigationController?.popViewController(animated: true)
    }
    
}



