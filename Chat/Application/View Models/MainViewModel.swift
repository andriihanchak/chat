//
//  MainViewModel.swift
//  Chat
//
//  Created by Andrii Hanchak on 09.10.2020.
//

import AVFoundation
import Combine
import Foundation

final class MainViewModel: ObservableObject {
        
    @Published var items: [Item] = []
    
    private var cancellables: Set<AnyCancellable> = []
    
    private let generator: Generator
    private let speaker: Speaker
    
    init(speaker: Speaker, generator: Generator) {
        self.generator = generator
        self.speaker = speaker
    }
    
    func start() {
        speek()
    }
    
    private func speek() {
        let item = generator.generate()
        let voice: Voice = item.kind == .incoming ? .male : .female
        
        items.insert(item, at: 0)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.speaker.speak(speech: item, voice: voice)
                .subscribe(on: DispatchQueue.global())
                .receive(on: DispatchQueue.main)
                .sink { [weak self] (_) in self?.speek() }
                .store(in: &self.cancellables)
        }
    }
}
