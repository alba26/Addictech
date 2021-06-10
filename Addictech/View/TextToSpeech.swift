//
//  TextToSpeech.swift
//  Addictech
//
//  Created by Adhitya Laksamana Bayu Adrian on 10/06/21.
//

import Foundation
import AVFoundation

class TextToSpeech: NSObject{
    private var speechSynth = AVSpeechSynthesizer()
    
    override init(){
        super.init()
        self.speechSynth.delegate = self
    }
    func speak(keywords:String){
        let utterance = AVSpeechUtterance(string: keywords)
        speechSynth.speak(utterance)
    }
}


extension TextToSpeech: AVSpeechSynthesizerDelegate{
    func speechSynth(_ synthesizer: AVSpeechSynthesizer, didStart utterance: AVSpeechUtterance) {
      print("started")
    }
    func speechSynth(_ synthesizer: AVSpeechSynthesizer, didPause utterance: AVSpeechUtterance) {
      print("paused")
    }
    func speechSynth(_ synthesizer: AVSpeechSynthesizer, didContinue utterance: AVSpeechUtterance) {}
    func speechSynth(_ synthesizer: AVSpeechSynthesizer, didCancel utterance: AVSpeechUtterance) {}
    func speechSynth(_ synthesizer: AVSpeechSynthesizer, willSpeakRangeOfSpeechString characterRange: NSRange, utterance: AVSpeechUtterance) {}
    func speechSynth(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
      print("finished")
    }
    

    
    
}
