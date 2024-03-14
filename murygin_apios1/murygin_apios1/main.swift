//
//  main.swift
//  murygin_apios1
//
//  Created by Kacper Murygin on 14/03/2024.
//

import Foundation

do {
    let bst = BST()
    bst.insert(key: 4, data: "macos")
    bst.insert(key: 3, data: "ios")
    bst.insert(key: 5, data: "apios")
    bst.insert(key: 1, data: 44)
    
    bst.printBst()
}
