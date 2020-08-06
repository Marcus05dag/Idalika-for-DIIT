//
//  BoxsViewController.swift
//  MarketIdalika
//
//  Created by Мухтарпаша on 06.08.2020.
//  Copyright © 2020 Дмитрий Папушин. All rights reserved.
//

import UIKit

class BoxsViewController: UIViewController {

      
        override func viewDidLoad() {
            super .viewDidLoad()
            
            view.backgroundColor = .white
            
          
            
            GotoSearch()
            
            
            view.addSubview(beginShopping)
            beginShopping.anchor(top: nil, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: 10, bottom: 0, right: 10), size: .init(width: 350, height: 50))
            beginShopping.layer.cornerRadius = 1
            beginShopping.addTarget(self, action: #selector(begginShoppingTarget), for: .touchUpInside)
            
            
        }
        
        @objc fileprivate func begginShoppingTarget () {
            let searchItems = SearchItemsController(collectionViewLayout: UICollectionViewFlowLayout())
            let navController = UINavigationController(rootViewController: searchItems)
            navController.modalPresentationStyle = .fullScreen
            present(navController,animated: true,completion: nil)
            
        }
        
        
        fileprivate func GotoSearch () {
            navigationItem.leftBarButtonItem = UIBarButtonItem(title: "  ← КОРЗИНА", style: .plain, target: self, action: #selector(GotoSearchTarget))
            navigationItem.leftBarButtonItem?.tintColor = .black
            
            
        }
        
        
        @objc fileprivate func GotoSearchTarget () {
            
            let searchItems = SearchItemsController(collectionViewLayout: UICollectionViewFlowLayout())
            let navController = UINavigationController(rootViewController: searchItems)
            navController.modalPresentationStyle = .fullScreen
            present(navController,animated: true , completion: nil)
            
            
        }
        
        
        
        let beginShopping = CustomButton(backgroundColor: .black, title: "          ←            НАЧАТЬ ПОКУПКИ")

        
        
    }


