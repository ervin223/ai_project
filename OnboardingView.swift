import SwiftUI

struct OnboardingView: View {
    @State private var navigateToSurvey = false
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack(spacing: 20) {
                Spacer()
                
                Image("soulmate_birds")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 180, height: 180)
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
                
                Text("Let's create our own AI friend! To do this, answer a few questions.")
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Button(action: {
                    navigateToSurvey = true
                }) {
                    Text("Let's Start!")
                        .font(.headline.bold())
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.red)
                        .cornerRadius(12)
                        .padding(.horizontal, 20)
                }
                .padding(.bottom, 40)
            }
        }
        .fullScreenCover(isPresented: $navigateToSurvey) {
            SurveyView()
        }
    }
}
