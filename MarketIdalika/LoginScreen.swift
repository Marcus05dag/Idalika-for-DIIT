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
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        self.title = "IDILLIKA"
//    }
//
    fileprivate func configureUIcomponents() {
        calltoActionButton.titleLabel?.font = UIFont(name: "SFProDisplay-Bold",size: 14)
        view.addSubview(calltoActionButton)
        
        // стрелочка
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.heightAnchor.constraint(equalToConstant: 10).isActive = true
        img.widthAnchor.constraint(equalToConstant: 18).isActive = true
        img.image = #imageLiteral(resourceName: "Vector")
        
        calltoActionButton.addSubview(img)
        img.rightAnchor.constraint(equalTo: calltoActionButton.rightAnchor, constant: -19).isActive = true
        img.topAnchor.constraint(equalTo: calltoActionButton.topAnchor, constant: 19).isActive = true
        img.bottomAnchor.constraint(equalTo: calltoActionButton.bottomAnchor, constant: -19).isActive = true

        
        calltoActionButton.addTarget(self, action: #selector(handelCalltoActionButton), for: .touchUpInside)
        

        calltoActionButton.anchor(top: nil, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: 10, bottom: 10, right: 10), size: .init(width: 350, height: 48))
        
        idillika()
    }
    
    //MARK: CalltoActionButton
     let calltoActionButton = CustomButton(backgroundColor: .black, title: "   ПОКАЗАТЬ ТОВАРЫ")
    
    @objc fileprivate func handelCalltoActionButton() {
        
        let searchItems = SearchItemsController(collectionViewLayout: UICollectionViewFlowLayout())
        let navController = UINavigationController(rootViewController: searchItems)
        navController.modalPresentationStyle = .fullScreen
        present(navController, animated: true, completion: nil)
        
    }
    
    fileprivate func idillika () {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "IDILLIKA", style: .plain, target: self, action: nil)
        navigationItem.leftBarButtonItem?.tintColor = .black
    }


}
