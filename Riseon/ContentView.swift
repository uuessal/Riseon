//
//  ContentView.swift
//  Riseon
//
//  Created by wessal hashim alharbi on 03/04/1447 AH.
//

import SwiftUI

struct WessalContentView: View {
    var body: some View {
        
        ZStack
        {
            Image("background")
            
            VStack {
                
                Image("logo").resizable()
                    .scaledToFit()
                    .frame(width: 400)
            }
                
        }
   
        .padding()
    }
}

struct WessalContentView2: View {
    var body: some View {
        
        ZStack
        {
            Image("background")
            
            ZStack {
                
                Image("Circle").resizable()
                    .scaledToFit()
                    .frame(width: 600)
                
             
                
                Text("Hello, World!")
                    .foregroundColor(.white).font(.system(size: 20, weight: .bold, design: .default))
                
                
            }
                
        }
   
        .padding()
    }
}


struct NoufContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.yellow.opacity(0.4), Color.white]), startPoint: .top, endPoint: .bottom)
                            .ignoresSafeArea()
            
            VStack(spacing: 40){
                Spacer()
                
                Text("Begin Your Journey")
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(.brown)
                    .multilineTextAlignment(.center)
                
                
                
                
                VStack(spacing: 30) {
                         
                    JourneyButton(title: "EMOITONAL INTELLIGENCE")
                    JourneyButton(title: "CONFIDENCE")
                    JourneyButton(title: "DISCIPLINE",  isSelected: true)
                    
                               }
                
                Spacer()
                
            }
            }
            
            
        }
    }



struct RagContentView: View {
   
        var body: some View {
            ZStack {
                // الخلفية بالألوان (بدون صورة)
                LinearGradient(
                    gradient: Gradient(colors: [Color.yellow.opacity(0.4), Color.white]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                VStack(spacing: 30) {
                    
                    // النص العلوي
                    Text("All Done For Today!")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 0.6, green: 0.3, blue: 0.1))
                    // الصوره
                    Image("happysun")
                                       .resizable()
                                       .scaledToFit()
                                       .frame(width: 350, height: 350)
                                   
                    
                    // النص السفلي
                    Text("But don’t worry, new challenges await tomorrow!")
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                        .padding(.horizontal, 40)
                    
                    // الـ page indicator
                    HStack(spacing: 8) {
                        ForEach(0..<3) { _ in
                            Circle()
                                .fill(Color(red: 0.9, green: 0.6, blue: 0.4))
                                .frame(width: 10, height: 10)
                        }
                    }
                }
            }
        }
    }










struct JourneyButton: View {
    var title: String
    var isSelected: Bool = false
    
    var body: some View {
        Text(title)
            .font(.system(size: 16, weight: .medium))
            .foregroundColor(.brown)
            .frame(maxWidth: .infinity)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 40)
                    .stroke(isSelected ? Color.blue : Color.clear, lineWidth: 2)
                    .background(RoundedRectangle(cornerRadius: 40).fill(Color.white))
            )
            .padding(.horizontal, 32)
    }
}



#Preview {
    
  // NoufContentView()


 //  WessalContentView2()

  //WessalContentView()
    
  RagContentView()

}

