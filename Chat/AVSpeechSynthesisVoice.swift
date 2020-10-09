//
//  AVSpeechSynthesisVoice.swift
//  Chat
//
//  Created by Andrii Hanchak on 09.10.2020.
//

import AVFoundation
import Foundation

extension AVSpeechSynthesisVoice {
    
    static let daniel = AVSpeechSynthesisVoice(identifier: "com.apple.ttsbundle.Daniel-compact")!
    static let samantha = AVSpeechSynthesisVoice(identifier: "com.apple.ttsbundle.Samantha-compact")!
    
    static func speechSynthesisVoice(_ voice: Voice) -> AVSpeechSynthesisVoice {
        switch voice {
        case .female:
            return samantha
            
        case .male:
            return daniel
        }
    }
}
