import SwiftUI

struct ChatView: View {
    var userName: String
    var userImage: String // Фото, выбранное пользователем

    @State private var messages: [String] = [
        "The site rybaxet will help a designer, layout designer, webmaster generate several paragraphs of more or less meaningful text rybaxet in Russian, and a novice speaker to hone the skill of public.",
        "You: The site rybaxet will help a designer, layout designer, webmaster generate several paragraphs of more or less meaningful text rybaxet in Russian, and a novice speaker to hone the skill of public."
    ]
    @State private var newMessage = ""
    @State private var isBlurred = true

    var body: some View {
        VStack(spacing: 0) {
            // 🔵 Верхняя панель навигации (тёмно-синий фон)
            HStack {
                Button(action: {
                    // Действие кнопки "Назад"
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.white)
                        .padding()
                }

                Spacer()

                Text("Chat")
                    .font(.headline)
                    .foregroundColor(.white)

                Spacer()

                Button(action: {
                    // Действие для кнопки "Unlimited"
                }) {
                    Text("UNLIMITED")
                        .foregroundColor(.black)
                        .font(.caption.bold())
                        .padding(.vertical, 6)
                        .padding(.horizontal, 12)
                        .background(Color.yellow)
                        .cornerRadius(8)
                }
            }
            .background(Color(red: 15/255, green: 20/255, blue: 45/255)) // Цвет как на макете
            .padding(.horizontal)

            // 📜 Чат с прокруткой
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(messages, id: \.self) { message in
                        if message.starts(with: "You:") {
                            HStack {
                                Spacer()
                                Text(message)
                                    .padding()
                                    .background(Color.gray.opacity(0.6))
                                    .cornerRadius(12)
                            }
                        } else {
                            HStack {
                                Text(message)
                                    .padding()
                                    .background(Color.gray.opacity(0.3))
                                    .cornerRadius(12)
                                Spacer()
                            }
                        }
                    }

                    // 🖼 Блок с фото AI-партнера
                    VStack(alignment: .leading, spacing: 5) {
                        Text("\(userName):")
                            .font(.headline)
                            .foregroundColor(.white)
                            .bold()

                        ZStack {
                            Image(userImage)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 200)
                                .cornerRadius(12)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.white, lineWidth: 2)
                                )
                                .blur(radius: isBlurred ? 8 : 0) // Размытие

                            if isBlurred {
                                Button(action: {
                                    isBlurred = false
                                }) {
                                    Text("Show")
                                        .font(.headline.bold())
                                        .foregroundColor(.white)
                                        .padding()
                                        .frame(width: 100)
                                        .background(Color.red)
                                        .cornerRadius(8)
                                }
                            }
                        }
                        .padding(.top, 10)
                    }
                    .padding(.horizontal)
                }
                .padding()
            }
            .background(Color.black)

            // 🔵 Нижняя панель (синий фон)
            VStack(spacing: 8) {
                HStack(spacing: 10) {
                    Button(action: {
                        // Действие "Ask for a photo"
                    }) {
                        HStack {
                            Image(systemName: "camera.fill")
                            Text("Ask for a photo")
                        }
                        .font(.caption)
                        .foregroundColor(.white)
                        .padding(.vertical, 6)
                        .padding(.horizontal, 12)
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(8)
                    }

                    Button(action: {
                        // Действие "Generate question"
                    }) {
                        HStack {
                            Image(systemName: "lightbulb.fill")
                            Text("Generate question")
                        }
                        .font(.caption)
                        .foregroundColor(.white)
                        .padding(.vertical, 6)
                        .padding(.horizontal, 12)
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(8)
                    }
                }

                // Поле ввода сообщения
                HStack {
                    TextField("Type a message...", text: $newMessage)
                        .padding()
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(10)
                        .foregroundColor(.white)

                    Button(action: {
                        if !newMessage.isEmpty {
                            messages.append("You: \(newMessage)")
                            newMessage = ""
                        }
                    }) {
                        Image(systemName: "paperplane.fill")
                            .foregroundColor(.red)
                            .padding()
                    }
                }
                .padding(.horizontal)
            }
            .background(Color(red: 15/255, green: 20/255, blue: 45/255)) // Цвет как на макете
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}
