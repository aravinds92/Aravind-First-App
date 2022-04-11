//
//  ContentView.swift
//  AravindFirstAppForSwetha
//
//  Created by Aravind Sridhar on 4/9/22.
//

import SwiftUI

struct ContentView: View {
    
    var emojis = ["🚗", "🚕", "🚙", "🚌", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚛", "🚜", "🦯", "🦽", "🦼", "🛴", "🚲", "🛵", "🏍", "🛺", "🚨", "🚔", "🚍"]
    @State var emojiCount = 4
    
    var body: some View {
        VStack{
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        stackView(displayText: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .padding(.all)
            .foregroundColor(.red)
            
            Spacer()

            HStack{
                removeCard
                Spacer()
                Text("Modify card count").font(.largeTitle).foregroundColor(.blue)
                Spacer()
                addCard
            }
            .padding(.horizontal)
        }
        .padding(.horizontal)
        .font(.largeTitle)
    }
    
    
    var addCard: some View {
        return Button {
            if(emojiCount < emojis.count)
            {
                emojiCount += 1
            }
                
        } label: {
            Image(systemName: "plus.circle")
        }
    }
    
    var removeCard: some View {
        Button{
            if(emojiCount > 1)
            {
                emojiCount -= 1
            }
                
        } label: {
            Image(systemName: "minus.circle")
        }
    }
}

struct stackView: View
{
    @State var isFaceUp: Bool = false
    var displayText: String
    var body: some View{
        ZStack(alignment: .center) {
            let shape = RoundedRectangle(cornerRadius: 20)
            if(isFaceUp){
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(displayText)
            }
            else{
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }

    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .preferredColorScheme(.dark)
                .previewInterfaceOrientation(.portraitUpsideDown)
            ContentView()
                .preferredColorScheme(.light)
        }
    }
}
