//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Zhejun Zhang on 1/26/25.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    @State private var imageName = ""
    //    @State private var imageNumber = 0
    @State private var imageRandomer = 0
    @State private var lastImageRandomer = 0
    @State private var messageString = ""
    //    @State private var messageNumber = 0
    @State private var messageRandomer = 0
    @State private var lastMessageRandomer = 0
    @State private var imageCount = 0
    @State private var messageCount = 0
    @State private var audioPlayer: AVAudioPlayer!
    @State private var soundName = ""
    @State private var soundRandomer = 0
    @State private var lastSoundRandomer = -1
    
    var body: some View {
        //        let message1 = "You are awesome!"
        //        let message2 = "You are great!"
        let messages = ["You are awesome!", "You are great!", "You are amazing!", "You are incredible!", "You are fantastic!", "You are perfect!", "You are the best!", "You are the GOAT!", "You are dazzling!"]
        let numberOfImages = 9
        
        VStack {
            
            Text(messageString)
                .bold()
                .font(.largeTitle)
                .foregroundStyle(.yellow)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.center)
                .animation(.easeInOut(duration: 0.15), value: messageString)
                .frame(height: 100)
            
            Spacer()
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 50))
                .animation(.default, value: imageName)
                .shadow(radius: 50)
            
            Spacer()
            
            Button("Show Message") {
                imageRandomer = Int.random(in: 0...numberOfImages)
                
                if imageCount == 0 {
                    lastImageRandomer = imageRandomer
                    //Note: imageName = "image\(imageNumber)" also works
                    imageName = "image" + String(imageRandomer)
                    imageCount += 1
                } else {
                    while lastImageRandomer == imageRandomer {
                        imageRandomer = Int.random(in: 0...numberOfImages)
                    }
                    lastImageRandomer = imageRandomer
                    //Note: imageName = "image\(imageNumber)" also works
                    imageName = "image" + String(imageRandomer)
                    imageCount += 1
                }
                
                messageRandomer = Int.random(in: 0...(messages.count-1))
                if messageCount == 0 {
                    lastMessageRandomer = messageRandomer
                    messageCount += 1
                } else {
                    while lastMessageRandomer == messageRandomer {
                        messageRandomer = Int.random(in: 0...(messages.count-1))
                    }
                    lastMessageRandomer = messageRandomer
                    messageString =  messages[messageRandomer]
                    messageCount += 1
                }
                
                repeat {
                    soundRandomer = Int.random(in: 0...5)
                } while lastSoundRandomer == soundRandomer
                soundName = "sound\(soundRandomer)"
                lastSoundRandomer = soundRandomer
                guard let soundFile = NSDataAsset(name: soundName) else {
                    print("Can't find \(soundName)")
                    return
                }
                do {
                    audioPlayer = try AVAudioPlayer(data: soundFile.data)
                    audioPlayer.play()
                } catch {
                    print("\(error.localizedDescription)")
                    return
                }
                
                //The code below allows for messages to be displayed in order
                //                messageNumber += 1
                //                if messageNumber == messages.count {
                //                    messageNumber = 0
                //                }
                
                //                imageName = (imageName == image1 ?9image2 : image1)
                //                message = (message == message1 ? message2 : message1)
                //                imageNumber = imageNumber + 1
                //                imageNumber += 1
                //                if imageNumber > 9 {
                //                    imageNumber = 0
            }
            .buttonStyle(.borderedProminent)
            .bold()
            .font(.title2)
            .tint(.blue)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
