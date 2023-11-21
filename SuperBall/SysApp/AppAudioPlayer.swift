//
//  AppAudioPlayer.swift
//  SuperBall
//
//  Created by Yurii Derzhylo on 21.11.2023.
//

import AVFoundation

class AudioPlayer {
    private var player: AVAudioPlayer?

    init() {
        setupAudioPlayer()
    }

    private func setupAudioPlayer() {
        guard let path = Bundle.main.path(forResource: "superballsong", ofType: "mp3") else {
            return
        }

        let url = URL(fileURLWithPath: path)

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.prepareToPlay()
        } catch {
            print("Error initializing audio player: \(error.localizedDescription)")
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

