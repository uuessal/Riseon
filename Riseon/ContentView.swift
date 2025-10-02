//
//  ContentView.swift
//  Riseon
//
//  Created by wessal hashim alharbi on 03/04/1447 AH.
//

import SwiftUI


// wessal

struct WessalContentView: View {
    
    
    @State private var isActive = false
    
    var body: some View {
        

        if isActive {
            // الشاشة الثانية بعد السبلاش
            NedaaContentView()
        } else {
            
            LinearGradient(
                gradient: Gradient(colors: [Color.yellow.opacity(0.4), Color.white]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            
            
            
            VStack {
                
                Image("logo").resizable()
                    .scaledToFit()
                    .frame(width: 400)
                
                
                
                
                
                
            }
            
            Spacer()
            
            
                .padding()
            
            
            
                .onAppear {
                              // بعد 3 ثواني ينتقل للشاشة الثانية
                              DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                  withAnimation(.easeInOut) {
                                      isActive = true
                                  }
                              }
                          }
            
        }
    }
    
}

struct WessalContentView2: View {
    
    @State private var goToRuba = false
    
    
    var body: some View {
        
        
        
        NavigationStack {
            
            
            ZStack {
                
                LinearGradient(
                    gradient: Gradient(colors: [Color.yellow.opacity(0.4), Color.white]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                Image("Circle").resizable()
                    .scaledToFit()
                    .frame(width: 600, height: 800)
                    .onTapGesture(count: 2) {
                        
                        goToRuba = true
                        
                    }
                
            }
            
            Text("Hellooooo World!")
                .foregroundColor(.white).font(.system(size: 20, weight: .bold, design: .default))
            
            
            
            
            
            
            
            
            
            
            
            
            
                .padding()
            
            
            NavigationLink("", destination: RubaContentView(), isActive: $goToRuba)
                .hidden()
        }
    }
    
}


struct NoufContentView: View {
   

    @State private var cloudOffsetX: CGFloat = 0
    @State private var cloudOffsetY: CGFloat = 0
    @State private var cloudOffset5: CGFloat = -200
  
    

    var body: some View {
        NavigationStack {
            
            
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.yellow.opacity(0.4), Color.white]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                // Animated cloud
                                 Image(systemName: "cloud.fill")
                                     .resizable()
                                     .frame(width: 160, height: 100)
                                     .foregroundColor(.white.opacity(0.7))
                                     .offset(x: cloudOffset5, y: -200)
                                     .onAppear {
                                         withAnimation(Animation.linear(duration: 40).repeatForever(autoreverses: false)) {
                                             cloudOffset5 = UIScreen.main.bounds.width + 200
                                         }
                                     }
                
               
                Image(systemName: "cloud.fill")
                       .resizable()
                       .frame(width: 160, height: 100)
                       .foregroundColor(.white.opacity(0.7))
                       .offset(x: 100, y: cloudOffsetY)
                       .onAppear {
                           withAnimation(Animation.linear(duration: 40).repeatForever(autoreverses: false)) {
                               cloudOffsetY = UIScreen.main.bounds.height + 200
                           }
                       }
                
                
                
                
                
                
                
                VStack(spacing: 40){
                    Spacer()
                    
                    Text("Begin Your Journey")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.brown)
                        .multilineTextAlignment(.center)
                    
                    
                    
                    
                    VStack(spacing: 30) {
                        
                        JourneyButton(title: "EMOITONAL INTELLIGENCE")
                        JourneyButton(title: "CONFIDENCE")
                        JourneyButton(title: "DISCIPLINE")
                        
                    }
                    
                    Spacer()
                    
                }
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


//Nedaaaaaaa cv

struct NedaaContentView: View {
    var body: some View {
        NavigationStack {
            
            ZStack {
                //  الخلفية
                LinearGradient(
                    gradient: Gradient(colors: [Color.yellow.opacity(0.4), Color.white]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                VStack(spacing: 24) {
                    Spacer().frame(height: 60)
                    
                    //الكلام
                    VStack(spacing: 6) {
                        Text("Keep Growing")
                            .font(.system(size: 32, weight: .bold))
                            .foregroundColor(.brown)
                        Text("Keep Rising")
                            .font(.system(size: 32, weight: .bold))
                            .foregroundColor(.brown)
                        
                        Text("Grow your mindset and rise higher")
                            .font(.system(size: 16))
                            .foregroundColor(.black.opacity(0.7))
                            .padding(.top, 7)
                    }
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 24)
                    ZStack{
                        // الصور
                        Image("cloud")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60)
                            .offset(x: -150, y: -150)
                        
                        Image("cloud")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 550, height: 60)
                            .offset(x: 150, y: -160)
                        
                        Image("sun")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 370, height: 370)
                            .padding(.top, 70)
                        
                    }
                    Spacer()
                    NavigationLink(destination: NoufContentView())  {
                        Text("GET STARTED")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.black)
                        //.frame(maxWidth: .infinity)
                        //.cornerRadius(30)
                            .padding(.vertical, 14)
                            .padding(.horizontal, 120)
                            .background(Capsule().fill(Color.white)
                                .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 3))
                            .contentShape(Capsule())
                    }
                    .padding(.horizontal, 32)
                    .padding(.bottom, 40)
                }
            }
        }
    }
}
//ruba



struct RubaContentView: View {
    @State private var goToWessal = false
    
    @State private var goToRaghad = false
    
   @AppStorage("tapCountToday") private var tapCountToday = 0
    
   // @State private var tapCountToday = 0
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background color
                LinearGradient(
                    gradient: Gradient(colors: [Color.yellow.opacity(0.4), Color.white]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                
                VStack {
                    // Top bar
                    HStack {
                        // Menu icon
                        Button(action: {
                            // TODO: Menu action
                        }) {
                            VStack(spacing: 4) {
                                HStack(spacing: 2) {
                                    Circle()
                                        .frame(width: 4, height: 4)
                                    Rectangle()
                                        .frame(width: 14, height: 3)
                                }
                                .foregroundColor(.brown)
                                
                                HStack(spacing: 2) {
                                    Circle()
                                        .frame(width: 4, height: 4)
                                    Rectangle()
                                        .frame(width: 14, height: 3)
                                }
                                .foregroundColor(.brown)
                            }
                        }
                        
                        Spacer()
                        
                        // Cloud (معلّق حالياً)
                        // Image(systemName: "cloud.fill")
                        //     .resizable()
                        //     .scaledToFit()
                        //     .frame(width: 40, height: 25)
                        //     .foregroundColor(.white)
                    }
                    .padding(.horizontal)
                    .padding(.top, 40)
                    
                    Spacer()
                    
                    // Sun image
                    Image("sun")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                    
                    Spacer()
                    
                    // Tap to Rise text
                    Text("Tap to Rise")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.brown)
                        .padding(.bottom, 90)
                    
                    // Page indicators
                    HStack(spacing: 12) {
                        Circle()
                            .fill(Color.brown)
                            .frame(width: 18, height: 18)
                        Circle()
                            .fill(Color.brown.opacity(0.6))
                            .frame(width: 10, height: 10)
                        Circle()
                            .fill(Color.brown.opacity(0.6))
                            .frame(width: 10, height: 10)
                    }
                    .padding(.bottom, 40)
                }
                // دبل كلك → يروح لصفحة وصال
                .onTapGesture(count: 2) {
                                        if tapCountToday < 3 {
                                            goToWessal = true
                                            tapCountToday += 1
                                        } else {
                                            goToRaghad = true
                                        }
                                    }
                
                
                NavigationLink("", destination: WessalContentView2(), isActive: $goToWessal)
                               .hidden()
                           
                           // NavigationLink لـ Raghad
                           NavigationLink("", destination: RagContentView(), isActive: $goToRaghad)
                               .hidden()
            }
        }
    }
}







// اشياء نوف مو واجهة
struct JourneyButton: View {
    var title: String
    var isSelected: Bool = false
    
    var body: some View {
        NavigationLink(destination: RubaContentView()) {
            
            Text(title)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.brown)
                .frame(maxWidth: .infinity)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(isSelected ? Color.brown : Color.clear, lineWidth: 2)
                        .background(RoundedRectangle(cornerRadius: 40).fill(Color.white))
                )
                .padding(.horizontal, 32)
        }
    }
}



#Preview {
    
  NoufContentView()


 // WessalContentView2()

//WessalContentView()
    
 // RagContentView()
  //  NedaaContentView()
    
   // rubaContentView()
}

