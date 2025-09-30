//
//  ContentView.swift
//  Riseon
//
//  Created by wessal hashim alharbi on 03/04/1447 AH.
//

import SwiftUI

struct ContentView: View {
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

struct ContentView2: View {
    var body: some View {
        
        ZStack
        {
            Image("background")
            
            ZStack {
                
                Image("Circle").resizable()
                    .scaledToFit()
                    .frame(width: 600)
                
             
                
                Text("Hello, ana RAG! and hegggre ")
                    .foregroundColor(.white).font(.system(size: 20, weight: .bold, design: .default))
                
                
            }
                
        }
   
        .padding()
    }
}




#Preview {
    
  ContentView2()


    
   // ContentView()
}
