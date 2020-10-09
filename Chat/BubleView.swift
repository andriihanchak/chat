//
//  BundleView.swift
//  Chat
//
//  Created by Andrii Hanchak on 09.10.2020.
//

import SwiftUI

struct BubleView: View {
    
    let item: Item
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 16) {
            if item.kind == .outgoing { image(for: item) }
            
            Text(item.message)
                .padding(.all, 12)
                .multilineTextAlignment(item.kind == .incoming ? .trailing : .leading)
                .foregroundColor(.white)
                .background(
                    RoundedRectangle(cornerRadius: 16.0)
                        .foregroundColor(item.kind == .incoming ? Color.secondary : Color.blue)
                        .frame(minWidth: 100,
                               maxWidth: .infinity,
                               minHeight: 44.0,
                               maxHeight: .infinity,
                               alignment: item.kind == .incoming ? .trailing : .leading))
            
            if item.kind == .incoming { image(for: item) }
        }
    }
    
    private func image(for: Item) -> some View {
        return Image(item.imageName)
            .resizable()
            .frame(width: 44.0, height: 44.0, alignment: .center)
            .cornerRadius(22.0)
    }
}

struct BubleView_Previews: PreviewProvider {
    
    static var previews: some View {
        let incoming = Item(kind: .incoming, message: "Message")
        let outgoing = Item(kind: .outgoing, message: "Message")
        
        Group {
            BubleView(item: incoming)
            BubleView(item: outgoing)
        }.previewLayout(.fixed(width: 375, height: 44))
    }
}
