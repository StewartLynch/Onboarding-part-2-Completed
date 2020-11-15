//
//  OnboardData.swift
//  Onboarding
//
//  Created by Stewart Lynch on 2020-06-27.
//

import UIKit

enum OnboardData {
    static func buildSet(width:CGFloat = 350, height: CGFloat = 350) -> OnboardSet {
        let onboardSet = OnboardSet()
        onboardSet.dimensions(width: width, height: height)
        onboardSet.newCard(title: "Welcome",
                           image: "Welcome",
                           text: "Track yor food intake. Swipe to the next screen for more information.")
        onboardSet.newCard(title: "Update Count",
                           image: "Instructions.mov",
                           text: "Tap on any item to update the quantity or delete.",
                           videoInfo: OnboardCard.VideoInfo(origWidth: 392,
                                                            origHeight: 434,
                                                            newHeight: 210))
        onboardSet.newCard(title: "Visit Web Site",
                           image: "RedIcon",
                           text: "Visit the application web site for more information about the app and how to contact the developer.",
                           linkInfo: OnboardCard.LinkInfo(title: "App Site", webLink: "https://www.createchsol.com"))
        return onboardSet
    }
}
