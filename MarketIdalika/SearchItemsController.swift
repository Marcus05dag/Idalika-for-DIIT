//
//  SearchItemsController.swift
//  MarketIdalika
//
//  Created by Дмитрий Папушин on 28.07.2020.
//  Copyright © 2020 Дмитрий Папушин. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"
//-----------------------------------------------------------------------------------------
class SearchItemsController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var itemsNewModel: [ItemsNewModel] = [] // empty array

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white

        // Register cell classes
        self.collectionView!.register(ItmesCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        fetchItemsInfo()
        configureComponents()
}


//-----------------------------------------------------------------------------------------
//MARK: ConfigureComponents
    
    fileprivate func configureComponents () {
        GotoBox()
        backButton()
    }
//-----------------------------------------------------------------------------------------
//MARK: Button
    
    //MARK:GotoBox
    
    fileprivate func GotoBox () {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "Icon-App-40x40"), style: .plain, target: self, action: #selector(GotoBoxTarget))
        navigationItem.rightBarButtonItem?.tintColor = .black
    }
    
    @objc fileprivate func GotoBoxTarget () {
        let searchItems = BoxsCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        let navController = UINavigationController(rootViewController: searchItems)
        navController.modalPresentationStyle = .fullScreen
        present(navController,animated: true,completion: nil)
    }
    
    
    //MARK:BackButtonTarget
    @objc fileprivate func backButtonTarget () {
        
        let backToLS = LoginScreen()
        let navController = UINavigationController(rootViewController: backToLS)
        navController.modalPresentationStyle = .fullScreen
        present(navController,animated: true,completion: nil)
        
    }
    
    fileprivate func backButton () {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "  ←  ОДЕЖДА", style: .plain, target: self, action: #selector(backButtonTarget))
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    
    
//-----------------------------------------------------------------------------------------
    // MARK: - API
    
    fileprivate func fetchItemsInfo() {
        
        Service.shared.fetchItemsInfo { [weak self] (result) in
            guard let self = self else {return}
            
            switch result {
            case.success(let items):
                self.itemsNewModel.append(contentsOf: items)
                //print(items)
                self.itemsNewModel = items
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            case .failure(let error):
                print("Failed to appent Itenms into Array with error: ", error)
            }
        }
        
    }

    

//------------------------------------------------------------------------------------------
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return itemsNewModel.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ItmesCell
        cell.items = itemsNewModel[indexPath.item]
        
        cell.setFavorite(isFaforite: ((UserDefaults.standard.array(forKey: "fav_ids") as! [Int]?) ?? []).contains(itemsNewModel[indexPath.item].id))
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
