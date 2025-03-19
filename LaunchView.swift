import SwiftUI

struct LaunchView: View {
    @State private var progress: Double = 0.0
    @State private var isActive = false
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack(spacing: 20) {
                Spacer()
                
                Image("soulmate_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .padding(.top, 50)
                
                Text("Welcome to\nSoulMate - AI Chat")
                    .foregroundColor(.white)
                    .font(.title.bold())
                    .multilineTextAlignment(.center)
                    .padding()
                
                Text("Find your best friend or partner\nand share what you want")
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Spacer()
                
                ProgressView(value: progress, total: 1.0)
                    .progressViewStyle(LinearProgressViewStyle(tint: .red))
                    .frame(width: 200)
                    .padding()
                
                Text("Loading...")
                    .foregroundColor(.white)
                    .padding(.bottom, 20)
                
                Spacer()
            }
        }
        .onAppear {
            withAnimation(Animation.linear(duration: 5)) {
                progress = 1.0
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                isActive = true
            }
        }
        .fullScreenCover(isPresented: $isActive) {
            OnboardingView()
        }
    }
}
