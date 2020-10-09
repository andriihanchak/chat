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
            
            Text(item.message)
                .padding(.all, 8)
                .multilineTextAlignment(item.kind == .incoming ? .trailing : .leading)
                .foregroundColor(.white)
                .background(
                    RoundedRectangle(cornerRadius: 22.0)
                        .foregroundColor(item.kind == .incoming ? Color.secondary : Color.blue)
                        .frame(minWidth: 100,
                               maxWidth: .infinity,
                               minHeight: 44.0,
                               maxHeight: .infinity,
                               alignment: item.kind == .incoming ? .trailing : .leading))
            
            if item.kind == .outgoing { Spacer() }
        }
        
    }
}

struct RowView_Preview: PreviewProvider {
    
    static var previews: some View {
        let incoming = Item(kind: .incoming, message: "incoming")
        let outgoing = Item(kind: .outgoing, message: "outgoing")
        
        Group {
            RowView(item: incoming)
            RowView(item: outgoing)
        }.previewLayout(.fixed(width: 375, height: 44))
    }
}
