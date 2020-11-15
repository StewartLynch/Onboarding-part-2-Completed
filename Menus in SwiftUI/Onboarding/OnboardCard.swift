//
//  OnboardCard.swift
//  Onboarding
//
//  Created by Stewart Lynch on 2020-06-27.
//

import UIKit

struct OnboardCard: Identifiable {
    struct VideoInfo {
        let origWidth: CGFloat
        let origHeight: CGFloat
        let newHeight: CGFloat
        var ratio: CGFloat {
            origWidth/origHeight
        }
    }
    struct LinkInfo {
        let title: String
        let webLink: String
    }
    
    let id = UUID()
    let title: String
    let image: String
    let text: String
    var videoInfo: VideoInfo? = nil
    var pathToVideo: URL? {
        guard let path = Bundle.main.path(forResource: image, ofType: nil) else {
            return nil
        }
        return URL(fileURLWithPath: path)
    }
    var linkInfo: LinkInfo? = nil
}
