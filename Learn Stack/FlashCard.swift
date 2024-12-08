//
//  FlashCard.swift
//  Informatik Stack
//
//  Created by Fabian Meixner on 03.12.24.
//

import SwiftUI

struct FlashCard: View {
    
    let question: String
    let answer: String
    @State var checked: Bool
    
    @State private var isFlipped = false
    
    var body: some View {
        VStack(){
            if isFlipped {
                VStack{
                    Text(answer)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.customCream)
                }
                .frame(width: 320, height: 300)
                .background(.customGreen)
                .cornerRadius(10)
                .onTapGesture {
                    withAnimation {
                        isFlipped.toggle()
                    }
                }
                .padding()
                
                Text("Tippe um die Frage zu sehen")
                    .foregroundStyle(.secondary)
                
                HStack {
                    Spacer()
                    
                    Button {
                        checked = false
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundStyle(.customRed)
                    }

                    Spacer()
                    
                    Button {
                        checked = true
                    } label: {
                        Image(systemName: "checkmark.circle.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundStyle(.customGreen)
                            
                    }
                    Spacer()
                }
                .padding(30)
                .offset(y: 80)
            } else {
                VStack{
                    Text(question)
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.center)
                }
                .frame(width: 320, height: 300)
                .background(.customBlue)
                .cornerRadius(10)
                .onTapGesture {
                    withAnimation {
                        isFlipped.toggle()
                    }
                }
                .padding()
            
            Text("Tippe um die Antwort zu sehen")
                .foregroundStyle(.secondary)
                
                VStack {
                    Image(systemName: (checked ? "checkmark.circle.fill" : "xmark.circle.fill"))
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundStyle(.customBlue)
                        .padding()
                        
                    Text(checked ? "Bereits richtig geübt" : "Noch nicht geübt oder bisher falsch")
                        
                }
                .offset(y: 70)
            }
        }
        .frame(width: 370, height: 250)
        .shadow(radius: 10)
    }
}

#Preview {
    FlashCard(question: "Was ist ein Bit?", answer: "Dies ist die kleinstmögliche Einheit der Information.", checked: false)
}
