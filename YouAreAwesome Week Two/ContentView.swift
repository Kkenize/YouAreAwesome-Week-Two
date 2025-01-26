//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Zhejun Zhang on 1/26/25.
//

import SwiftUI

struct ContentView: View {
    @State private var imageName = ""
    @State private var imageNumber = 0
    @State private var messageString = ""
    @State private var messageNumber = 0
    var body: some View {
        //        let message1 = "You are awesome!"
        //        let message2 = "You are great!"
        let messages = ["You are awesome!", "You are great!", "You are amazing!", "You are incredible!", "You are fantastic!", "You are perfect!", "You are the best!", "You are the GOAT!", "You are dazzling!"]
        
        VStack {
            
            Spacer()
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 50))
                .shadow(radius: 50)
            Text(messageString)
                .bold()
                .font(.largeTitle)
                .foregroundStyle(.yellow)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            Button("Show Message") {
                //Note: imageName = "image\(imageNumber)" also works
                imageName = "image" + String(imageNumber)
                
                messageString = messages[messageNumber]
                messageNumber += 1
                if messageNumber == messages.count {
                    messageNumber = 0
                }
                //                imageName = (imageName == image1 ?9image2 : image1)
                //                message = (message == message1 ? message2 : message1)
                //                imageNumber = imageNumber + 1
                imageNumber += 1
                if imageNumber > 9 {
                    imageNumber = 0
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
