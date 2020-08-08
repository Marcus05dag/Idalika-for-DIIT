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

        

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

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
        // #warning Incomplete implementation, return the number of sections
        return Base.shareds.userDefs.count
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
   
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
     
       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ItmesCell
               
        
    
        
    
        return cell
    }

    //----------------------------------------------------------------------------------------
        // MARK: UICollectionViewDelegate
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            
            let width = (view.frame.width) / 2
            
            return CGSize(width: width - 10, height: width + 200)
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            let padding: CGFloat = 5
            return UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        }

    }
    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */


