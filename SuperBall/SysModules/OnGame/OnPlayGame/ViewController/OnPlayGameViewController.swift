//
//  OnPlayGameViewController.swift
//  SuperBall
//
//  Created by Yurii Derzhylo on 17.11.2023.
//

import UIKit
import WebKit

class OnPlayGameViewController: UIViewController {
    
    @IBOutlet weak var animatedImageView: UIImageView!
    @IBOutlet weak var gameView: UIView!
    @IBOutlet weak var openMenuButton: UIButton!
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var entireMenuView: UIView!
    @IBOutlet weak var loadingLabel: UILabel!
    
    private let viewPresenter: OnPlayGameViewPresenter = OnPlayGameViewPresenter()
    private let coordinator: OnPlayGameCoordinator = OnPlayGameCoordinator()
    private var onPlayIndex = 0
    private var onPlayGameTimer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initiateOnPlayGameUI()
        setTimerOn()
        performGameView()
    }
    
    private func initiateOnPlayGameUI() {
        loadingLabel.text = viewPresenter.loadingTxt
        openMenuButton.setImage(viewPresenter.onMenuButtonImage, for: .normal)
    }
    
    private func setTimerOn() {
        openMenuButton.isHidden = true
        onPlayGameTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(performCustomAnimation), userInfo: nil, repeats: true)
        
        RunLoop.current.add(onPlayGameTimer!, forMode: .common)
    }
    
    private func setTimerOff() {
        onPlayGameTimer?.invalidate()
        onPlayGameTimer = nil
    }
    
    private func performGameView() {
        viewPresenter.startOnGame { result in
            switch result {
            case .classic:
                self.viewPresenter.prepareWebView(with: self.gameView)
            case .error:
                print("error")
            case .url(_):
                self.viewPresenter.prepareWebView(with: self.gameView)
            }
        }
    }
    
    deinit {
        onPlayGameTimer?.invalidate()
    }
    
    @objc func performCustomAnimation() {
        if onPlayIndex < viewPresenter.animationBallImages.count - 1 {
            onPlayIndex += 1
        } else {
            onPlayIndex = 0
        }
        
        animatedImageView.image = viewPresenter.animationBallImages[onPlayIndex]
        
        if onPlayIndex % 10 == 0 {
            setTimerOff()
            UIView.transition(with: self.view, duration: 0.5, options: .transitionCrossDissolve, animations: {
                self.loadingLabel.isHidden = true
                self.entireMenuView.isHidden = true
                self.animatedImageView.isHidden = true
                self.openMenuButton.isHidden = false
            }, completion: nil)
        }
    }
    
    @IBAction func openMenuInsert(_ sender: UIButton) {
        coordinator.makeForwardCoordinationWithOnTutorialController(selfController: self)
    }
}
