//
//  MainBar.swift
//  MarketIdalika
//
//  Created by Дмитрий Папушин on 28.07.2020.
//  Copyright © 2020 Дмитрий Папушин. All rights reserved.
//

import UIKit

class MainBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITabBar.appearance().tintColor = .black
        UINavigationBar.appearance().tintColor = .black
        
        let startScreen = createNavcontroller(viewController: LoginScreen(), title: "Одежда", uiTabBarItem: UITabBarItem(tabBarSystemItem: .search, tag: 0))
        
        let favorites = createNavcontroller(viewController: UIViewController(), title: "Избранное", uiTabBarItem: UITabBarItem(tabBarSystemItem: .favorites, tag: 1))
        
        viewControllers = [startScreen, favorites]

        // Do any additional setup after loading the view.
    }
    

    func createNavcontroller(viewController: UIViewController, title: String, uiTabBarItem: UITabBarItem) -> UINavigationController {
        
        let navController = UINavigationController(rootViewController: viewController)
        viewController.title = title
        navController.tabBarItem = uiTabBarItem
        
        return navController
    }

}
