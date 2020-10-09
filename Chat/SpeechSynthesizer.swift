//
//  SpeechSynthesizer.swift
//  Chat
//
//  Created by Andrii Hanchak on 09.10.2020.
//

import AVFoundation
import Combine
import Foundation

final class SpeechSynthesizer: NSObject, Speaker, AVSpeechSynthesizerDelegate {
    
    private var cancellables: Set<AnyCancellable> = []
    private let synthesizer = AVSpeechSynthesizer()
    private var tasks: [Task] = []
    
    override init() {
        super.init()
        
        synthesizer.delegate = self
    }

    func speak(speech: Speech, voice: Voice) -> Deferred<Future<Speech, Never>> {
        return Deferred { [weak self] in
            return Future { promise in
                guard let self = self
                else { return }
                
                let utterance = self.utterance(for: speech, using: voice)
                let task = Task(completion: promise, speech: speech, utterance: utterance)
                
                self.synthesizer.speak(utterance)
                self.tasks.append(task)
            }
        }
    }
    
    private func utterance(for speech: Speech, using voice: Voice) -> AVSpeechUtterance {
        let message = NSAttributedString(string: speech.speech)
        let utterance = AVSpeechUtterance(attributedString: message)

        utterance.pitchMultiplier = 1.0
        utterance.postUtteranceDelay = 0.0
        utterance.preUtteranceDelay = 0.0
        utterance.rate = AVSpeechUtteranceDefaultSpeechRate
        utterance.voice = .speechSynthesisVoice(voice)
        utterance.volume = 1.0
        
        return utterance
    }
}

extension SpeechSynthesizer {
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        guard let task = tasks.first(where: { $0.utterance == utterance })
        else { return }
        
        task.completion(.success(task.speech))
    }
}

extension SpeechSynthesizer {
    
    private struct Task {
        
        let completion: Future<Speech, Never>.Promise
        let speech: Speech
        let utterance: AVSpeechUtterance
    }
}
