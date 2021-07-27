//
//  Speaker.swift
//  Chat
//
//  Created by Andrii Hanchak on 10.10.2020.
//

import Combine
import Foundation

protocol Speaker {
    
    func speak(speech: Speech, voice: Voice) -> AnyPublisher<Speech, Never>
}
