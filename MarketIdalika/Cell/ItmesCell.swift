//
//  ItmesCell.swift
//  MarketIdalika
//
//  Created by Дмитрий Папушин on 28.07.2020.
//  Copyright © 2020 Дмитрий Папушин. All rights reserved.
//

import UIKit


class ItmesCell: UICollectionViewCell {
    
    
    
    
     let defaults = UserDefaults.standard
    
   

    // MARK: - Properties

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
            itemLabeltoPrice.textAlignment = .left
            itemLabeltoPrice.lineBreakMode = .byWordWrapping

        }
    }
  
    //MARK:MethodFavoriteBool
    
    func setFavorite(isFaforite: Bool) {
        buttonFavorite.setImage(isFaforite ? #imageLiteral(resourceName: "Union1").withRenderingMode(.alwaysOriginal) : #imageLiteral(resourceName: "Union").withRenderingMode(.alwaysOriginal), for: .normal)
    }
    
    //MARK:nameContainer
    lazy var nameContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        
        view.addSubview(itemLabel)
        itemLabel.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor,padding: .init(top: 0, left: 0, bottom: 30, right: 0))
        view.addSubview(itemLabeltoPrice)
        //itemLabeltoPrice.anchor(top: nil, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 30, left: 0, bottom: 10, right: 0), size: .zero)
        
        //itemLabeltoPrice.topAnchor.constraint(equalTo: itemLabeltoPrice.topAnchor).isActive = true
        itemLabeltoPrice.translatesAutoresizingMaskIntoConstraints = false
        itemLabeltoPrice.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        itemLabeltoPrice.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        itemLabeltoPrice.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        itemLabeltoPrice.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        view.addSubview(buttonFavorite)
        buttonFavorite.topAnchor.constraint(equalTo: itemLabeltoPrice.topAnchor).isActive = true
        buttonFavorite.bottomAnchor.constraint(equalTo: itemLabeltoPrice.bottomAnchor).isActive = true
        buttonFavorite.rightAnchor.constraint(equalTo: itemLabeltoPrice.rightAnchor).isActive = true
        buttonFavorite.widthAnchor.constraint(equalTo: buttonFavorite.heightAnchor).isActive = true


        //buttonFavorite.anchor(top: nil, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: 120, bottom: 0, right: 0), size: .init(width: 10, height: 50))
        buttonFavorite.addTarget(self, action: #selector(buttonTargetToFavorite), for: .touchUpInside)
        
        
       
        
        return view
    }()
//-----------------------------------------------------------------------------------------
    //MARK:ButtonFavoriteAndUserDefailts
    
    
    @objc fileprivate func buttonTargetToFavorite() {
        var names = (defaults.array(forKey: "fav_names") ?? []) as! [String]
        var ids = (defaults.array(forKey: "fav_ids") ?? []) as! [Int]
        var prices = (defaults.array(forKey: "fav_prices") ?? []) as! [Int]
        var images = (defaults.array(forKey: "fav_images") ?? []) as! [String]
        
        
        
        let id = items?.id

        let title = items?.title
        let price = items?.price
        let image = items?.imageLink
                
        
        if id != nil && !title!.isEmpty && price != nil  && !image!.isEmpty {
            
            if ids.contains(id!) {
                let index = (defaults.array(forKey: "fav_ids") as! [Int]).firstIndex(of: id!)!
                
                print(index)
                
                names.remove(at: index)
                ids.remove(at: index)
                prices.remove(at: index)
                images.remove(at: index)

                buttonFavorite.setImage(#imageLiteral(resourceName: "Union").withRenderingMode(.alwaysOriginal), for: .normal)
                buttonFavorite.imageView?.tintColor = .lightGray

                
            } else {
                names.append(title!)
                ids.append(id!)
                prices.append(price!)
                images.append(image!)

                buttonFavorite.setImage(#imageLiteral(resourceName: "Union1").withRenderingMode(.alwaysOriginal), for: .normal)
            }
            
            defaults.set(names, forKey: "fav_names")
            defaults.set(ids, forKey: "fav_ids")
            defaults.set(prices, forKey: "fav_prices")
            defaults.set(images, forKey: "fav_images")
            
            print(ids)
        }
        
    }
    
//-------------------------------------------------------------------------------------------
    //MARK:ButtonFavorite
    let buttonFavorite:UIButton = {
        let button = UIButton(type: .system)
    
        button.setImage(#imageLiteral(resourceName: "Union").withRenderingMode(.alwaysOriginal), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 5, left: 3, bottom: 4, right: 3)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        
        return button
    }()
    
    
    
    
    //MARK:PriceLabel
    let itemLabeltoPrice: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "SFProDisplay-Bold", size: 18)

        label.text = "Макасины"
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    
    
    
    //MARK: Title
    let itemLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "SFProDisplay-Regular", size: 18)
        label.text = "Макасины"
        label.numberOfLines = 0
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .red
        //self.layer.cornerRadius = 10
        self.clipsToBounds = true
        
        configureUIcomponents()
    }
    
    fileprivate func configureUIcomponents() {
        
        addSubview(imageView)
        imageView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .zero, size: .init(width: 0, height: self.frame.height - 100))
        
        addSubview(nameContainerView)
        nameContainerView.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .zero, size: .init(width: 0, height: 100))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
