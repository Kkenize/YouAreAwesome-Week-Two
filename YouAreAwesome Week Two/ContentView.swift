//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Zhejun Zhang on 1/26/25.
//

import SwiftUI

struct ContentView: View {
    @State private var imageName = ""
    @State private var message = ""
    @State private var imageNumber = 0
    var body: some View {
        let message1 = "You are awesome!"
        let message2 = "You are great!"
        
        VStack {
            
            Spacer()
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 50))
                .shadow(radius: 50)
            Text(message)
                .bold()
                .font(.largeTitle)
                .foregroundStyle(.yellow)
            
            Spacer()
            
            Button("Press Me!") {
                //Note: imageName = "image\(imageNumber)" also works
                imageName = "image" + String(imageNumber)
//                imageName = (imageName == image1 ?9image2 : image1)
                message = (message == message1 ? message2 : message1)
//                imageNumber = imageNumber + 1
                imageNumber += 1
                if imageNumber > 9 {
                    imageNumber = 0
                }
            }
            .buttonStyle(.borderedProminent)
            .bold()
            .font(.title2)
            .tint(.orange)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
