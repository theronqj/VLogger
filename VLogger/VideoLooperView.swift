//
//  VideoLooperView.swift
//  VLogger
//
//  Created by TJ on 3/26/19.
//  Copyright © 2019 TJ. All rights reserved.
//

import UIKit
import AVFoundation

class VideoLooperView: UIView {
    let clips: [VideoClip]
    let videoPlayerView = VideoPlayerView()
    
    init(clips: [VideoClip]) {
        self.clips = clips
        
        super.init(frame: .zero)
        
        initializePlayer()
        addGestureReconizers()
    }
    
    @objc private let player = AVQueuePlayer()
    @objc func wasTapped() {
        player.volume = player.volume == 1.0 ? 0.0 : 1.0
    }
    @objc func wasDoubleTapped() {
        player.rate = player.rate == 1.0 ? 2.0 : 1.0
    }
    
    private var token: NSKeyValueObservation?
    
    private func initializePlayer() {
        videoPlayerView.player = player
        addAllVideosToPlayer()
        player.volume = 0.0
        player.play()
        token = player.observe(\.currentItem) { [weak self] player, _ in
            if player.items().count == 1 {
                self?.addAllVideosToPlayer()
            }
        }
    }
    
    private func addAllVideosToPlayer() {
        for video in clips {
            let asset = AVURLAsset(url: video.url)
            let item = AVPlayerItem(asset: asset)
            
            player.insert(item, after: player.items().last)
        }
    }
    
    func addGestureReconizers() {
        // 2 taps w/ method assignment
        let tap = UITapGestureRecognizer(target: self, action: #selector(VideoLooperView.wasTapped))
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(VideoLooperView.wasDoubleTapped))
        doubleTap.numberOfTapsRequired = 2
        
        tap.require(toFail: doubleTap)
        
        addGestureRecognizer(tap)
        addGestureRecognizer(doubleTap)
    }
    
    // MARK - Unnecessary but necessary Code
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func pause() {
        player.pause()
    }
    
    func play() {
        player.play()
    }
}
