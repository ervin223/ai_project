import SwiftUI

struct NameQuestionView: View {
    @Binding var userName: String
    var currentQuestion: Int
    var totalQuestions: Int
    var nextAction: () -> Void
    @State private var isTermsAccepted = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Welcome to\nSoulMate - AI Chat")
                .font(.title2.bold())
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.bottom, 5)
            
            HStack {
                ForEach(1...totalQuestions, id: \.self) { index in
                    Image(systemName: index <= currentQuestion ? "heart.fill" : "heart")
                        .foregroundColor(index <= currentQuestion ? .red : .gray)
                }
            }
            .padding(.bottom, 10)
            
            Text("What to call the AI partner?")
                .foregroundColor(.white)
                .font(.title3.bold())
            
            TextField("Enter the name of your AI partner", text: $userName)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .foregroundColor(.white)
                .padding(.horizontal, 20)
                .onChange(of: userName) { // ✅ Новый синтаксис для iOS 17+
                    if userName.count > 20 {
                        userName = String(userName.prefix(20))
                    }
                }
            
            Toggle(isOn: $isTermsAccepted) {
                Text("By joining the chat, I accept the app’s terms and confirm that I am over 18 years old.")
                    .foregroundColor(.gray)
                    .font(.caption)
            }
            .padding(.horizontal, 20)
            
            Button(action: {
                if isTermsAccepted && !userName.isEmpty {
                    nextAction()
                }
            }) {
                Text("Continue")
                    .font(.headline.bold())
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background((userName.isEmpty || !isTermsAccepted) ? Color.gray : Color.red)
                    .cornerRadius(12)
                    .padding(.horizontal, 20)
            }
            .disabled(userName.isEmpty || !isTermsAccepted)
            .padding(.top, 20)
        }
        .padding(.vertical, 40)
    }
}
