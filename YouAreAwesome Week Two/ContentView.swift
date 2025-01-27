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
    @State private var imageRandomer = 0
    @State private var lastImageRandomer = -1
    @State private var messageString = ""
    @State private var messageRandomer = 0
    @State private var lastMessageRandomer = -1
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
                repeat {
                    messageRandomer = Int.random(in: 0...messages.count-1)
                } while lastMessageRandomer == messageRandomer
                messageString = messages[messageRandomer]
                lastMessageRandomer = messageRandomer
                
                repeat {
                    imageRandomer = Int.random(in: 0...messages.count-1)
                } while lastImageRandomer == imageRandomer
                imageName = "image\(imageRandomer)"
                lastImageRandomer = imageRandomer
                
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
