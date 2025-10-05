//
//  ContentView.swift
//  Riseon
//
//  Created by wessal hashim alharbi on 03/04/1447 AH.
//

import SwiftUI

// MARK: - Data Arrays
let EmotionalIntelligenceCh = ["Don’t react when angry — take a deep breath first.", "Your body language speaks louder than your words.", "Understanding others starts with understanding yourself.", "Write down how you truly felt at the end of each day.", "Listen to someone for 5 minutes without interrupting.", "When something negative happens, list 3 positives about it."]






let ConfidenceCh = ["Watch your self-talk your mind believes what you repeat. Replace", "Replace I always mess up with I’m learning", "Focus on progress not perfection", "See yourself as a student", "Catch one negative thought today and rewrite it into something empowering", "Wear something slightly outside your comfort zone and own it confidently"]





let DisciplineCh = ["Discipline means staying consistent even without motivation.", "Reduce daily decisions by creating a clear morning routine.", "Focus on consistency, not perfection — one small step daily.", "Wake up on the first alarm for 7 days straight.", "Plan your next day before bed and follow it fully.", "Pick one small habit (like reading 5 min) and stick to it for a week."]

// MARK: - Wessal Splash Screen
struct WessalContentView: View {
    @State private var isActive = false
    
    var body: some View {
        ZStack {
            if isActive {
                NedaaContentView()
            } else {
                LinearGradient(
                    gradient: Gradient(colors: [Color.yellow.opacity(0.4), Color.white]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                VStack {
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 400)
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        withAnimation(.easeInOut) {
                            isActive = true
                        }
                    }
                }
            }
        }
    }
}

// MARK: - Nouf Content View
struct NoufContentView: View {
    @State private var cloudOffsetY: CGFloat = 0
    @State private var cloudOffset5: CGFloat = -200
    
    @State private var selectedChallenge: String? = nil
    @State private var selectedCategory: String? = nil
    @State private var goToRuba = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.yellow.opacity(0.4), Color.white]),
                               startPoint: .top,
                               endPoint: .bottom)
                    .ignoresSafeArea()
                
                // Animated clouds
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
                
                VStack(spacing: 40) {
                    Spacer()
                    
                    Text("Begin Your Journey")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.brown)
                        .multilineTextAlignment(.center)
                    
                    VStack(spacing: 30) {
                        JourneyButton(title: "EMOTIONAL INTELLIGENCE") {
                            selectedChallenge = EmotionalIntelligenceCh.randomElement()
                            selectedCategory = "EI"
                            goToRuba = true
                        }
                        JourneyButton(title: "CONFIDENCE") {
                            selectedChallenge = ConfidenceCh.randomElement()
                            selectedCategory = "Confidence"
                            goToRuba = true
                        }
                        JourneyButton(title: "DISCIPLINE") {
                            selectedChallenge = DisciplineCh.randomElement()
                            selectedCategory = "Discipline"
                            goToRuba = true
                        }
                    }
                    
                    Spacer()
                }
            }
            .navigationDestination(isPresented: $goToRuba) {
                if let challenge = selectedChallenge, let category = selectedCategory {
                    RubaContentView(initialChallengeText: challenge, category: category)
                }
            }  .navigationBarBackButtonHidden(true)
        }
        .tint(.brown)
    }
}

// MARK: - Ruba View (Tap to Rise)
// MARK: - Ruba View (Tap to Rise)
struct RubaContentView: View {
    let initialChallengeText: String
    let category: String

    @State private var goToWessal = false
    @State private var goToRaghad = false
    @State private var goToNouf = false // 👈 جديد

    @AppStorage("tapCountToday") private var tapCountToday = 0
    @AppStorage("lastOpenDate") private var lastOpenDate = ""
    
    @State private var currentChallenge: String = ""

    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [Color.yellow.opacity(0.4), Color.white]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()

                VStack {
                    Spacer()

                    Image("sun")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)

                    Spacer()

                    Text("Tap to Rise")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.brown)
                        .padding(.bottom, 90)

                    HStack(spacing: 8) {
                        ForEach(0..<3) { _ in
                            Circle()
                                .fill(Color(red: 0.9, green: 0.6, blue: 0.4))
                                .frame(width: 10, height: 10)
                        }
                    }
                    .padding(.bottom, 40)
                }
                .onAppear {
                    resetTapCountIfNewMinute()
                    currentChallenge = initialChallengeText
                }
                .onTapGesture(count: 2) {
                    if tapCountToday < 3 {
                        switch category {
                        case "EI":
                            currentChallenge = EmotionalIntelligenceCh.randomElement() ?? initialChallengeText
                        case "Confidence":
                            currentChallenge = ConfidenceCh.randomElement() ?? initialChallengeText
                        case "Discipline":
                            currentChallenge = DisciplineCh.randomElement() ?? initialChallengeText
                        default:
                            currentChallenge = initialChallengeText
                        }
                        
                        goToWessal = true
                        tapCountToday += 1
                    } else {
                        goToRaghad = true
                    }
                }

                // الروابط
                NavigationLink(
                    destination: WessalContentView2(challengeText: currentChallenge, category: category)
                        .id(UUID()),
                    isActive: $goToWessal
                ) { EmptyView() }
                .hidden()

                NavigationLink(destination: RagContentView(), isActive: $goToRaghad) {
                    EmptyView()
                }
                .hidden()
                
                NavigationLink(destination: NoufContentView(), isActive: $goToNouf) {
                    EmptyView()
                }
                .hidden()
            }
            // 👇 Toolbar مخصصة لزر الباك
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        goToNouf = true
                    }) {
                        HStack {
                            Image(systemName: "chevron.backward")
                            Text("Back")
                        }
                        .foregroundColor(.brown)
                    }
                }
            }
            .navigationBarBackButtonHidden(true) // نخفي الزر الافتراضي
        }
        .tint(.brown)
    }

    func resetTapCountIfNewMinute() {
        let now = Date()
        if let lastDate = ISO8601DateFormatter().date(from: lastOpenDate) {
            let diff = Calendar.current.dateComponents([.minute], from: lastDate, to: now).minute ?? 0
            if diff >= 1 {
                tapCountToday = 0
                lastOpenDate = ISO8601DateFormatter().string(from: now)
            }
        } else {
            tapCountToday = 0
            lastOpenDate = ISO8601DateFormatter().string(from: now)
        }
    }
}


// MARK: - Wessal Challenge Screen
struct WessalContentView2: View {
    let challengeText: String
    let category: String
    
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
                
                VStack {
                    Spacer()
                    
                    ZStack {
                        Image("Circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 600, height: 600)
                        
                        Text(challengeText)
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .bold))
                            .multilineTextAlignment(.center)
                            .padding().frame(width: 300, height: 300)
                    }
                    .onTapGesture(count: 2) {
                        goToRuba = true
                    }
                    
                    Spacer()
                }
                
                NavigationLink(
                    "",
                    destination: RubaContentView(initialChallengeText: challengeText, category: category).id(UUID()),
                    isActive: $goToRuba
                )
                .hidden()
            }  .navigationBarBackButtonHidden(true)
        }
        .tint(.brown)
    }
}

// MARK: - Raghad (End of Challenges)
struct RagContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color.yellow.opacity(0.4), Color.white]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack(spacing: 30) {
                Text("All Done For Today!")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0.6, green: 0.3, blue: 0.1))
                
                Image("happysun")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 350, height: 350)
                
                Text("But don’t worry, new challenges await tomorrow!")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
                    .padding(.horizontal, 40)
                
                HStack(spacing: 8) {
                    ForEach(0..<3) { _ in
                        Circle()
                            .fill(Color(red: 0.9, green: 0.6, blue: 0.4))
                            .frame(width: 10, height: 10)
                    }
                }
            }
        }  .navigationBarBackButtonHidden(true)
    }
}

// MARK: - Nedaa Intro View
struct NedaaContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [Color.yellow.opacity(0.4), Color.white]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                VStack(spacing: 24) {
                    Spacer().frame(height: 60)
                    
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
                    
                    ZStack {
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
                    
                    NavigationLink(destination: NoufContentView()) {
                        Text("GET STARTED")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.brown)
                            .padding(.vertical, 14)
                            .padding(.horizontal, 120)
                            .background(
                                Capsule()
                                    .fill(Color.white)
                                    .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 3)
                            )
                            .contentShape(Capsule())
                    }
                    .padding(.horizontal, 32)
                    .padding(.bottom, 40)
                }
            }
        }
        .tint(.brown)
    }
}

// MARK: - Journey Button
struct JourneyButton: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.brown)
                .frame(maxWidth: .infinity)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 40)
                        .fill(Color.white)
                        .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 3)
                )
                .padding(.horizontal, 32)
        }
    }
}

// MARK: - Preview
#Preview {
    WessalContentView()
}
