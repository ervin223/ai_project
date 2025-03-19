import SwiftUI

struct HobbiesQuestionView: View {
    @Binding var selectedHobbies: Set<String>
    var currentQuestion: Int
    var totalQuestions: Int
    var nextAction: () -> Void
    
    let options: [String] = [
        "Traveling", "Movies", "Animals", "Photography",
        "Yoga", "Art & Drawing", "Dancing", "Reading", "Cooking"
    ]
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 15) {
                // Заголовок
                VStack(spacing: 5) {
                    Text("Welcome to\nSoulMate - AI Chat")
                        .foregroundColor(.white)
                        .font(.title.bold())
                        .multilineTextAlignment(.center)
                        .padding(.top, 40)
                    
                    HStack(spacing: 5) {
                        ForEach(1...totalQuestions, id: \.self) { index in
                            Image(systemName: index <= currentQuestion ? "heart.fill" : "heart")
                                .foregroundColor(index <= currentQuestion ? .red : .gray)
                        }
                    }
                    .padding(.top, 5)
                    
                    Text("Questions \(currentQuestion)/\(totalQuestions)")
                        .foregroundColor(.gray)
                        .font(.subheadline)
                        .padding(.bottom, 10)
                }
                
                // Вопрос
                Text("What are your hobbies?")
                    .foregroundColor(.white)
                    .font(.title2.bold())
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 10)
                
                // Варианты ответов
                VStack(spacing: 10) {
                    ForEach(options, id: \.self) { option in
                        Button(action: {
                            if selectedHobbies.contains(option) {
                                selectedHobbies.remove(option)
                            } else {
                                selectedHobbies.insert(option)
                            }
                        }) {
                            HStack {
                                Text(option)
                                    .foregroundColor(.white)
                                    .padding()
                                
                                Spacer()
                                
                                Image(systemName: selectedHobbies.contains(option) ? "checkmark.circle.fill" : "circle")
                                    .foregroundColor(.white)
                            }
                            .frame(maxWidth: .infinity, minHeight: 55)
                            .background(selectedHobbies.contains(option) ? Color.white.opacity(0.2) : Color.gray.opacity(0.2))
                            .cornerRadius(15)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(selectedHobbies.contains(option) ? Color.white : Color.clear, lineWidth: 2)
                            )
                            .padding(.horizontal, 20)
                        }
                    }
                }
                
                // Кнопка "Continue"
                Button(action: nextAction) {
                    HStack {
                        Text("Continue")
                            .font(.headline.bold())
                        Image(systemName: "chevron.right")
                    }
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(selectedHobbies.isEmpty ? Color.gray : Color.red)
                    .cornerRadius(15)
                    .padding(.horizontal, 20)
                }
                .disabled(selectedHobbies.isEmpty)
                .padding(.top, 20)
            }
            .padding(.vertical, 30)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
    }
}
