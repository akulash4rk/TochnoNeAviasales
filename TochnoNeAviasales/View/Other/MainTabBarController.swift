//
//  MainTabBarController.swift
//  TochnoNeAviasales
//
//  Created by Владислав Баранов on 25.06.2024.
//

import Foundation
import UIKit

class MainTabBarController: UITabBarController {

    //MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let mainView = MainViewController()
        let navigation = createNavigationController()
        navigation.viewControllers = [mainView]
        
        tabBar.backgroundColor = Colors.basicBlack.color
        
        let borderView = UIView(frame: CGRect(x: 0, y: 0, width: tabBar.frame.width, height: 0.5))
        borderView.backgroundColor = Colors.borderGray.color
        
        
        tabBar.addSubview(borderView)

        
        let vc1 = navigation
        let vc2 = EmptyViewController()
        let vc3 = EmptyViewController()
        let vc4 = EmptyViewController()
        let vc5 = EmptyViewController()

        vc1.tabBarItem = createTabBarItem(title: "Авиабилеты", imageName: "planeTab")
        vc2.tabBarItem = createTabBarItem(title: "Отели", imageName: "bedTab")
        vc3.tabBarItem = createTabBarItem(title: "Короче", imageName: "pointTab")
        vc4.tabBarItem = createTabBarItem(title: "Подписки", imageName: "bellTab")
        vc5.tabBarItem = createTabBarItem(title: "Профиль", imageName: "profileTab")

        viewControllers = [vc1, vc2, vc3, vc4, vc5]

        tabBar.tintColor = Colors.blueCircle.color
        tabBar.unselectedItemTintColor = Colors.whiteGray.color
    }

    //MARK: - Functions
    
    private func createTabBarItem(title: String, imageName: String) -> UITabBarItem {
        let item = UITabBarItem(
            title: title,
            image: UIImage(named: imageName),
            tag: 0
        )

        item.setTitleTextAttributes([.foregroundColor: Colors.whiteGray.color], for: .normal)
        item.setTitleTextAttributes([.foregroundColor: Colors.blueCircle.color], for: .selected)

        return item
    }
    
    
    private func createNavigationController() -> UINavigationController{
        let navigation = UINavigationController()
        navigation.setNavigationBarHidden(true, animated: true)
        return navigation
    }
}
