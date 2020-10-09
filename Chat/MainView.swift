//
//  MainView.swift
//  Chat
//
//  Created by Andrii Hanchak on 09.10.2020.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var viewModel: MainViewModel
    @State private var scaled: Bool = false
    
    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
            ScrollView {
                LazyVStack {
                    ForEach(0..<viewModel.items.count, id: \.self) { index in
                        let item = viewModel.items[index]
                        
                        RowView(item: item)
                            .padding(.all, 8)
                            .scaleEffect(scale(for: item), anchor: anchor(for: item))
                            .modifier(FlipEffect())
                    }
                }
            }.padding(.all, 8)
            .modifier(FlipEffect())
            .onAppear(perform: { viewModel.start(); })
            .onReceive(viewModel.$items, perform: { id in
                scaled = false
                
                DispatchQueue.main
                    .asyncAfter(deadline: .now() + 0.15, execute: {
                                    withAnimation(.spring()) { scaled = true } })
            })
    }
    
    private func anchor(for item: Item) -> UnitPoint {
        return item.kind == .incoming ? .bottomTrailing : .bottomLeading
    }

    private func scale(for item: Item) -> CGFloat {
        guard let index = viewModel.items.firstIndex(of: item), index == 0
        else { return 1.0 }
        return scaled ? 1.0 : 0.000001
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        let viewModel = MainViewModel(speaker: SpeechSynthesizer(), generator: Generator())
        
        MainView(viewModel: viewModel)
            .previewLayout(.sizeThatFits)
    }
}
