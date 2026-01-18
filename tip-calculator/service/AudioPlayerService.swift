//
//  AudioPlayerService.swift
//  tip-calculator
//
//  Created by Gianluca Dubioso on 18/01/26.
//

import Foundation
import AVFoundation
protocol AudioPlayerService {
    func playsSound()
}
final class DefaultAudioPlayer: AudioPlayerService {
    private var player: AVAudioPlayer?
    func playsSound() {
        let path = Bundle.main.path(forResource: "click", ofType: "m4a")!
        let url = URL(fileURLWithPath: path)
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch(let error){
            print(error.localizedDescription)
        }
    }
}
