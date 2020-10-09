//
//  ContentView.swift
//  Chat
//
//  Created by Andrii Hanchak on 09.10.2020.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = ContentViewModel()
    @State private var scaled: Bool = false
    
    init() {
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().tableFooterView = .none
    }
    
    var body: some View {
        ScrollViewReader { scrollProxy in
            List(0..<viewModel.items.count, id: \.self) {
                let item = viewModel.items[$0]

                RowView(item: item)
                    .padding(.all, 8)
                    .scaleEffect(scale(for: item), anchor: anchor(for: item))
                    .modifier(FlipEffect())
                    .onAppear(perform: { withAnimation(.default) { scaled = true } })
            }.modifier(FlipEffect())
            .onReceive(viewModel.$items, perform: { id in
                guard let id = id.last?.id else { return }
                scaled = false
                scrollProxy.scrollTo(id)
            }).onAppear(perform: { viewModel.start(); })
        }
    }
    
    private func anchor(for item: Item) -> UnitPoint {
        return item.kind == .incoming ? .bottomTrailing : .bottomLeading
    }
    
    private func scale(for item: Item) -> CGFloat {
        guard let index = viewModel.items.firstIndex(of: item), index == 0
        else { return 1.0 }
        return scaled ? 1.0 : 0.0
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
            .previewLayout(.sizeThatFits)
    }
}
