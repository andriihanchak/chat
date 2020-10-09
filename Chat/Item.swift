//
//  Item.swift
//  Chat
//
//  Created by Andrii Hanchak on 09.10.2020.
//

import Foundation

struct Item: Identifiable, Equatable {
    
    let id = UUID()
    
    let kind: Kind
    let message: String
    
    var imageName: String {
        switch kind {
        case .incoming:
            return "incoming"
            
        case .outgoing:
            return "outgoing"
        }
    }
}
