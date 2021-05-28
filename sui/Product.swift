//
//  Product.swift
//  sui
//
//  Created by Joseph Chung on 5/24/21.
//

import Foundation

public class Product: Identifiable {
    
    public var id: String
    var title: String
    var price: String
    
    init(id: String, title: String, price: String) {
        self.id = id
        self.title = title
        self.price = price
    }
    
}
