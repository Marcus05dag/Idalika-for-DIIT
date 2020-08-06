//
//  Service.swift
//  MarketIdalika
//
//  Created by Дмитрий Папушин on 28.07.2020.
//  Copyright © 2020 Дмитрий Папушин. All rights reserved.
//

import UIKit

class Service {
    
    static let shared = Service()
    
    let cache = NSCache<NSString, UIImage>()
    
    private init() {}
    
    // MARK: API Section
    
    func fetchItemsInfo(completion: @escaping (Result<[ItemsNewModel], Error>) -> ()) {
        
        let urlString = "https://idillika.com/api/catalogList.php?section=21&session_id=f3e82db3d0b2bcce07eae17dd9cb46d3"
        
        guard let url = URL(string: urlString) else {return}
        
        // MARK: Error Heandeling
        
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            
            if let err = err {
             completion(.failure(err))
                return
            }
            
            // MARK: Start to pars data and try to set data to the array of items
            
            guard let data = data else {return}
            
            do {
                
                let items = try JSONDecoder().decode([ItemsNewModel].self, from: data)
             completion(.success(items))
                
            } catch let jsonError {
             completion(.failure(jsonError))
            }
            
        }.resume()
    }
}

//        fetchItemsInfo { (res) in
//            switch res {
//            case .success(let items):
//                items.forEach { (items) in
//                    //print(items.id, items.imageLink ?? "")
//                }
//            case .failure(let err):
//                print("Failed to fetch items, :", err)
//            }
//        }
        
        // MARK: - The Old way
        
//        fetchItemsInfo { (itemsNewModel, err) in
//            if let err = err {
//                print("Failed to fetch Items from API with eeror:", err.localizedDescription)
//            }
//
//            itemsNewModel?.forEach({ (items) in
//                print(items.id)
//                print(items.imageLink ?? "")
//            })
//        }

    // MARK: - The New way of parsing JSON Data
    
//    fileprivate func fetchItemsInfo(completion: @escaping (Result<[ItemsNewModel], Error>) -> ()) {
//
//           let urlString = "https://idillika.com/api/catalogList.php?section=21&session_id=f3e82db3d0b2bcce07eae17dd9cb46d3"
//
//           guard let url = URL(string: urlString) else {return}
//
//           URLSession.shared.dataTask(with: url) { (data, resp, err) in
//
//               if let err = err {
//                completion(.failure(err))
//                   return
//               }
//
//               guard let data = data else {return}
//
//               do {
//
//                   let items = try JSONDecoder().decode([ItemsNewModel].self, from: data)
//                completion(.success(items))
//
//               } catch let jsonError {
//                completion(.failure(jsonError))
//               }
//
//
//
//           }.resume()
//       }
    
    
    // MARK: - The Old way to handle such a code
    
//    fileprivate func fetchItemsInfo(completion: @escaping ([ItemsNewModel]?, Error?) -> ()) {
//        print(123)
//
//        let urlString = "https://idillika.com/api/catalogList.php?section=21&session_id=f3e82db3d0b2bcce07eae17dd9cb46d3"
//
//        guard let url = URL(string: urlString) else {return}
//
//        URLSession.shared.dataTask(with: url) { (data, resp, err) in
//
//            if let err = err {
//                completion(nil, err)
//                return
//            }
//
//            guard let data = data else {return}
//
//            do {
//
//                let items = try JSONDecoder().decode([ItemsNewModel].self, from: data)
//                completion(items, nil)
//
//            } catch let jsonError {
//                completion(nil, jsonError)
//            }
//
//
//
//        }.resume()
//    }
