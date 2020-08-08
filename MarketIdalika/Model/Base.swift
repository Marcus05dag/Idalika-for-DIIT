//
//  Base.swift
//  MarketIdalika
//
//  Created by Мухтарпаша on 08.08.2020.
//  Copyright © 2020 Дмитрий Папушин. All rights reserved.
//

import Foundation


class Base{
    
    let defaults = UserDefaults.standard
    static let shareds = Base()
    struct UserDef:Codable {
        let id: Int
        let imageLink: String?
        let title: String?
        let price: Int
        
            
    }
    
    var userDefs:[UserDef]  {
        
        get {
            if let data = defaults.value(forKey: "userDefs") as? Data {
               return try! PropertyListDecoder().decode([UserDef].self , from: data)
            } else {
                return [UserDef]()
            }
            
        }
        set {
            
            if  let data = try? PropertyListEncoder().encode(newValue) {
                defaults.set(data, forKey: "userDefs")
            }
        }
        
    }
    func saveImag (id: Int, imageLink: String?,title: String?,price: Int) {
        
        let enums = UserDef(id: id, imageLink: imageLink, title: title, price: price)
        userDefs.append(enums)
        
        
    }
}
