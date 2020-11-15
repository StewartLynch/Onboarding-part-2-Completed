//
//  OBCardView.swift
//  Onboarding
//
//  Created by Stewart Lynch on 2020-06-27.
//

import AVKit
import SwiftUI

struct OBCardView: View {
    @Binding var isShowing: Bool
    let card: OnboardCard
    let width: CGFloat
    let height: CGFloat
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Text(card.title)
                    .font(.largeTitle)
                Spacer()
                Button(action: {
                    withAnimation {
                        isShowing = false
                    }
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .font(.title)
                }
            }
            if let videoInfo = card.videoInfo {
                if let url = card.pathToVideo {
                    VideoPlayer(player: AVPlayer(url: url))
                        .frame(width: videoInfo.ratio * videoInfo.newHeight,
                               height: videoInfo.newHeight)
                }
            } else {
                Image(card.image)
                    .resizable()
                    .scaledToFit()
            }
            Text(card.text)
            if let linkInfo = card.linkInfo {
                Button(linkInfo.title) {
                    if let url = URL(string: linkInfo.webLink) {
                        UIApplication.shared.open(url)
                    }
                }
                .frame(width: 100, height: 50)
                .background(RoundedRectangle(cornerRadius: 5).fill(Color("AccentColor")))
                .foregroundColor(.white)
                .font(.title2)
                .padding(.top)
            }
            Spacer()
        }
        .padding(.horizontal)
        .padding(.top,10)
        .frame(width: width, height: height)
        .background(RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(Color(.secondarySystemBackground))
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/))
    }
}

struct OBCardView_Previews: PreviewProvider {
    static let onboardSet = OnboardSet.previewSet()
    static var previews: some View {
        Group {
            OBCardView(isShowing: .constant(true), card: onboardSet.cards[0], width: 350, height: 350)
                .previewLayout(.sizeThatFits)
            OBCardView(isShowing: .constant(true), card: onboardSet.cards[3], width: 400, height: 500)
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
        }
    }
}
