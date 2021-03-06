//
//  BoxsCollectionCell.swift
//  MarketIdalika
//
//  Created by Мухтарпаша on 10.08.2020.
//  Copyright © 2020 Дмитрий Папушин. All rights reserved.
//

import UIKit

class BoxsCollectionCell: UICollectionViewCell {
    
      
        
        
        
         let defaults = UserDefaults.standard
        
       

        // MARK: - Properties
        
    //    let imageView: UIImageView = {
    //        let iv = UIImageView()
    //        iv.backgroundColor = .systemGray
    //        iv.contentMode = .scaleAspectFit
    //        return iv
    //    }()
        
        
        var imageView = CustomImageView(frame: .zero)
        
        var items: ItemsNewModel? {
            didSet {
                
                imageView.doownLoadImage(from: items?.imageLink ?? "")
                
                itemLabel.text = items?.title
                itemLabel.textAlignment = .center
                itemLabel.font = UIFont.preferredFont(forTextStyle: .body)
                itemLabel.lineBreakMode = .byWordWrapping
                itemLabel.minimumScaleFactor = 0.75
                itemLabel.adjustsFontSizeToFitWidth = true
                
                itemLabeltoPrice.text = "\(items!.price) $"
                itemLabeltoPrice.textAlignment = .center
                itemLabeltoPrice.lineBreakMode = .byWordWrapping
                
                
            
                
              
                
            }
        }
      
        
        
        
        //MARK:nameContainer
        lazy var nameContainerView: UIView = {
            let view = UIView()
            view.backgroundColor = .white
//            
//            view.addSubview(itemLabel)
//            itemLabel.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor,padding: .init(top: 0, left: 0, bottom: 30, right: 0))
//            view.addSubview(itemLabeltoPrice)
//            itemLabeltoPrice.anchor(top: nil, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 30, left: 0, bottom: 10, right: 0), size: .zero)
//            
//            view.addSubview(buttonFavorite)
//            buttonFavorite.anchor(top: nil, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: 120, bottom: 0, right: 0), size: .init(width: 10, height: 50))
//            buttonFavorite.addTarget(self, action: #selector(buttonTargetToFavorite), for: .touchUpInside)

           
            
            return view
        }()
    //-----------------------------------------------------------------------------------------
        //MARK:ButtonFavorite
        
        @objc fileprivate func buttonTargetToFavorite() {
        
            
            var names = defaults.array(forKey: "fav_names") ?? [] as! [String]
            var ids = defaults.array(forKey: "fav_ids") ?? [] as! [Int]
            var prices = defaults.array(forKey: "fav_prices") ?? [] as! [Int]
            var images = defaults.array(forKey: "fav_images") ?? [] as! [String]
            
            
            
            let id = items?.id
            let title = items?.title
            let price = items?.price
            let image = items?.imageLink
            
            //print("my tovar \((id,title,price,image))")
            
            
            
            if id != nil && !title!.isEmpty && price != nil  && !image!.isEmpty {
                names.append(title!)
                ids.append(id!)
                prices.append(price!)
                images.append(image!)
                
                            
                
                defaults.set(names, forKey: "fav_names")
                defaults.set(ids, forKey: "fav_ids")
                defaults.set(prices, forKey: "fav_prices")
                defaults.set(images, forKey: "fav_images")
                
                
                buttonFavorite.setImage(#imageLiteral(resourceName: "Union1").withRenderingMode(.alwaysOriginal), for: .normal)
                
                
            }
            
        }
        

        
        let buttonFavorite:UIButton = {
            let button = UIButton(type: .system)
        
            button.setImage(#imageLiteral(resourceName: "Union").withRenderingMode(.alwaysOriginal), for: .normal)
            button.tintColor = .black
            
            
            
            
            return button
        }()
        
        
        
        
        //MARK:PriceLabel
        let itemLabeltoPrice: UILabel = {
            let label = UILabel()
            label.textColor = .black
            label.font = UIFont.boldSystemFont(ofSize: 18)
            label.text = "Макасины"
            label.textAlignment = .center
            label.numberOfLines = 0
            label.lineBreakMode = .byTruncatingTail
            return label
        }()
        
        
        
        
        //MARK: Title
        let itemLabel: UILabel = {
            let label = UILabel()
            label.textColor = .black
            label.font = UIFont.systemFont(ofSize: 18)
            label.text = "Макасины"
            label.numberOfLines = 0
            label.lineBreakMode = .byTruncatingTail
            return label
        }()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            backgroundColor = .white
            self.layer.cornerRadius = 10
            self.clipsToBounds = true
            
            configureUIcomponents()
        }
        
        fileprivate func configureUIcomponents() {
            imageView.contentMode = .scaleAspectFit
            
            addSubview(imageView)
            imageView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: UIEdgeInsets(top: 64, left: 64, bottom: 64, right: 64), size: .init(width: 0, height: self.frame.height - 200))
            
            addSubview(nameContainerView)
            nameContainerView.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .zero, size: .init(width: 0, height: 100))
            
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
    }
