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
    
    func removeItem(_ item: Item){
        if let index = allItems.index(of: item){
            allItems.remove(at: index)
        }
    }
    
    func moveItem(from fromIndex: Int, to toIndex: Int){
        if fromIndex == toIndex {
            return
        }
        //Get regerence to object being moved so you can reinsert it
        let movedItem = allItems[fromIndex]
        
        //Remove item from array
        allItems.remove(at: fromIndex)
        
        //insert item in array at new location
        allItems.insert(movedItem, at: toIndex)
    }
    
    
    
}
