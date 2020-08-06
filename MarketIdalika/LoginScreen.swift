//
//  LoginScreen.swift
//  MarketIdalika
//
//  Created by Дмитрий Папушин on 28.07.2020.
//  Copyright © 2020 Дмитрий Папушин. All rights reserved.
//

import UIKit



class LoginScreen: UIViewController {
    


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUIcomponents()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    fileprivate func configureUIcomponents() {
        view.addSubview(calltoActionButton)
        
        calltoActionButton.addTarget(self, action: #selector(handelCalltoActionButton), for: .touchUpInside)
        

        calltoActionButton.anchor(top: nil, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: 10, bottom: 0, right: 10), size: .init(width: 350, height: 50))
        
    }
    
    //MARK: CalltoActionButton
     let calltoActionButton = CustomButton(backgroundColor: .black, title: "   ПОКАЗАТЬ ТОВАРЫ")
    
    @objc fileprivate func handelCalltoActionButton() {
        
        let searchItems = SearchItemsController(collectionViewLayout: UICollectionViewFlowLayout())
        let navController = UINavigationController(rootViewController: searchItems)
        navController.modalPresentationStyle = .fullScreen
        present(navController, animated: true, completion: nil)
        
    }
    


}
