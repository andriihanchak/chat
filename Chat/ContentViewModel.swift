//
//  ContentViewModel.swift
//  Chat
//
//  Created by Andrii Hanchak on 09.10.2020.
//

import Foundation

class ContentViewModel: ObservableObject {
    
    @Published var items: [Item] = []
    
    private let generator = Generator()
    private var number: Int = 0
    private var timer: Timer?
    
    deinit {
        guard timer != nil else { return }
        
        timer?.invalidate()
        timer = nil
    }
    
    func start() {
        timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(elapsed(_:)), userInfo: nil, repeats: true)
    }
    
    @objc func elapsed(_ timer: Timer) {
        items.insert(generator.generate(number: number), at: 0)
        number += 1
    }
}
