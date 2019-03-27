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
    }
    
    // MARK - Unnecessary but necessary Code
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
