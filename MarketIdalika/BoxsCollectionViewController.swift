//
//  BoxsCollectionViewController.swift
//  MarketIdalika
//
//  Created by Мухтарпаша on 08.08.2020.
//  Copyright © 2020 Дмитрий Папушин. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"


class BoxsCollectionViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
      
        self.collectionView!.register(BoxsCollectionCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
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

    
    
  
   //--------------------------------------------------------------------------------------
   // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("youuuu")
        return 1

    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! BoxsCollectionCell

        return cell
    }

    //----------------------------------------------------------------------------------------
        // MARK: UICollectionViewDelegate
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            
//            let width = (view.frame.width) / 2
//            let height = (view.frame.height) / 2
//
            return CGSize(width: 350, height: 550)
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            let padding: CGFloat = 5
            return UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        }

    }




