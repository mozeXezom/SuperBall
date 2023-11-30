//
//  AppAudioPlayer.swift
//  SuperBall
//
//

import AVFoundation

final class AudioPlayer {
    static let sharedPlayer = AudioPlayer()
    
    var player: AVAudioPlayer?

    private init() {
        if let path = Bundle.main.path(forResource: "superballsong", ofType: "mp3") {
            let url = URL(fileURLWithPath: path)
            do {
                player = try AVAudioPlayer(contentsOf: url)
                player?.numberOfLoops = -1
                player?.prepareToPlay()
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }
    }

    func play() {
        player?.play()
    }

    func pause() {
        player?.pause()
    }

    func isPlaying() -> Bool {
        return player?.isPlaying ?? false
    }
}

