//
//  CustomImageView.swift
//  MarketIdalika
//
//  Created by Дмитрий Папушин on 29.07.2020.
//  Copyright © 2020 Дмитрий Папушин. All rights reserved.
//

import UIKit
// Cach photo

class CustomImageView: UIImageView {
    
    let cache = Service.shared.cache

    let placeholderImage = #imageLiteral(resourceName: "box").withRenderingMode(.alwaysOriginal)
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    fileprivate func configure() {
        clipsToBounds = true
        contentMode = .scaleAspectFill
        image = placeholderImage
    }
    
    func doownLoadImage(from urlString: String) {
        
        
        // MARK: - Check for image in cache
        
        let cacheKye = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKye) {
            self.image = image
            return
        }
        
        // MARK: - Set image and get to cache
        
        guard let url = URL(string: urlString) else {return}
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] (data, resp, err) in
            guard let self = self else {return}
            
            if err != nil {return}
            guard let response = resp as? HTTPURLResponse, response.statusCode == 200 else {return}
            guard let data = data else {return}
            
            guard let image = UIImage(data: data) else {return}
            self.cache.setObject(image, forKey: cacheKye)
            DispatchQueue.main.async { self.image = image }
        }
        
        task.resume()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
