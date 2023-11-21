//
//  ViewController.swift
//  SuperBall
//
//  Created by Yurii Derzhylo on 16.11.2023.
//

import UIKit

class OnHelloViewController: UIViewController {
    
    @IBOutlet weak var onHelloBgImgView: UIImageView!
    @IBOutlet weak var onHelloLogoImgView: UIImageView!
    
    private let viewPresenter: OnHelloViewPresenter = OnHelloViewPresenter()
    private let coordinator: OnHelloCoordinator = OnHelloCoordinator()
    private let audioPlayer: AudioPlayer = AudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        initiateOnHelloViewController()
    }
    
    private func initiateOnHelloViewController() {
        onHelloBgImgView.image = viewPresenter.onHelloBackgroundImage
        onHelloLogoImgView.image = viewPresenter.onHelloLogoImage
        audioPlayer.play()
        UserDefaults.standard.set(true, forKey: "hasSongBeenPlayed")
        UserDefaults.standard.synchronize()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        coordinator.makeCoordinationWithOnHelloController(selfController: self)
        UserDefaults.standard.set(audioPlayer.isPlaying(), forKey: "isAudioPlaying")
        UserDefaults.standard.synchronize()
    }
}

