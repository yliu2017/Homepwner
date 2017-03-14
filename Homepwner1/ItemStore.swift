//
//  ItemStore.swift
//  Homepwner1
//
//  Created by Yingqi Liu on 3/13/17.
//  Copyright © 2017 Yingqi Liu. All rights reserved.
//

import UIKit

class ItemStore {
    
    var allItems = [Item]()
    
    @discardableResult func createItem() -> Item{
        let newItem = Item(random: true)
        
        allItems.append(newItem)
        
        return newItem
    }
    
    init() {
        for _ in 0..<5 {
            createItem()
        }
    }
    
    
}
