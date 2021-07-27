//
//  RowView.swift
//  Chat
//
//  Created by Andrii Hanchak on 09.10.2020.
//

import SwiftUI

struct RowView: View {
    
    let item: Item
    
    var body: some View {
        HStack(alignment: item.kind == .incoming ? .lastTextBaseline : .firstTextBaseline) {
            if item.kind == .incoming { Spacer() }
            
            BubleView(item: item)
            
            if item.kind == .outgoing { Spacer() }
        }
    }
}

struct RowView_Previews: PreviewProvider {
    
    static var previews: some View {
        let incoming = Item(kind: .incoming, message: "incoming")
        let outgoing = Item(kind: .outgoing, message: "outgoing")
        
        Group {
            RowView(item: incoming)
            RowView(item: outgoing)
        }.previewLayout(.fixed(width: 375, height: 44))
    }
}
