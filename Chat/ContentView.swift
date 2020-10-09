//
//  ContentView.swift
//  Chat
//
//  Created by Andrii Hanchak on 09.10.2020.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = ContentViewModel()
    
    var body: some View {
        ScrollViewReader { scrollProxy in
            List(0..<viewModel.items.count, id: \.self) {
                RowView(item: viewModel.items[$0])
                    .padding(.all, 8)
                    .modifier(FlipEffect())
            }.modifier(FlipEffect())
            .onReceive(viewModel.$items, perform: { id in
                guard let id = id.last?.id else { return }
                print(id)
                scrollProxy.scrollTo(id)
            }).onAppear(perform: { viewModel.start() })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
            .previewLayout(.sizeThatFits)
    }
}
