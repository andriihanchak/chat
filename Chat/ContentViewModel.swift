//
//  ContentViewModel.swift
//  Chat
//
//  Created by Andrii Hanchak on 09.10.2020.
//

import Foundation

enum Kind: Int {
    
    case incoming
    case outgoing
}

struct Item: Identifiable {
    
    let id = UUID()
    let kind: Kind
    let message: String
}

class ContentViewModel: ObservableObject {
    
    @Published var items: [Item] = []
    
    private var count: Int = 0
    private var timer: Timer?
    
    deinit {
        guard timer != nil else { return }
        
        timer?.invalidate()
        timer = nil
    }
    
    func start() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(elapsed(_:)), userInfo: nil, repeats: true)
    }
    
    @objc func elapsed(_ timer: Timer) {
        let rawKind = Int.random(in: 0...1)
        guard let kind = Kind(rawValue: rawKind) else { return }
        
        let randomMessage = Int.random(in: 0..<100000000000)
        let message = "\(count): \(randomMessage)"
        let item = Item(kind: kind, message: String(message))
        
        items.insert(item, at: 0)
        count += 1
    }
}
