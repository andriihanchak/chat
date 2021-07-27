//
//  ChatApp.swift
//  Chat
//
//  Created by Andrii Hanchak on 09.10.2020.
//

import SwiftUI

@main
struct ChatApp: App {
    
    private var viewModel = MainViewModel(speaker: SpeechSynthesizer(), generator: Generator())
    
    var body: some Scene {
        WindowGroup {
            MainView(viewModel: viewModel)
        }
    }
}
