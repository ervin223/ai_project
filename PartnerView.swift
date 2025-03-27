import SwiftUI

struct PartnerView: View {
    var onStartChat: () -> Void

    // Данные, которые можно позже получать из модели или @AppStorage
    let userName = "Brad Pitt"
    let age = 25
    let hobbies = ["Traveling", "Yoga", "Dancing", "Movies", "Animals", "Photography"]
    let imageName = "appearance1"

    var body: some View {
        TabView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.black, Color(red: 0.1, green: 0.1, blue: 0.2)]),
                               startPoint: .top,
                               endPoint: .bottom)
                    .ignoresSafeArea()

                VStack(spacing: 0) {
                    // Навигационная панель
                    HStack {
                        Text("Partner")
                            .font(.title2.bold())
                            .foregroundColor(.white)

                        Spacer()

                        Button(action: {}) {
                            Text("UNLIMITED")
                                .font(.caption.bold())
                                .foregroundColor(.black)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 6)
                                .background(Color.yellow)
                                .cornerRadius(8)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 50)

                    // Аватар и имя
                    VStack(spacing: 8) {
                        Image(imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 120, height: 120)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 2))

                        Text(userName)
                            .font(.title3.bold())
                            .foregroundColor(.white)

                        Text("\(age) years old")
                            .foregroundColor(.gray)

                        // Хобби
                        Text(hobbies.joined(separator: "  "))
                            .font(.caption)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }

                    Divider().background(Color.gray.opacity(0.3))
                        .padding(.horizontal)
                        .padding(.top, 10)

                    // Фото
                    HStack {
                        Text("Photos")
                            .foregroundColor(.white)
                            .font(.headline)
                        Spacer()
                        Text("SEE ALL")
                            .foregroundColor(.gray)
                            .font(.caption.bold())
                    }
                    .padding(.horizontal)
                    .padding(.top, 10)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            ForEach(0..<3) { _ in
                                Image(imageName)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height: 140)
                                    .cornerRadius(12)
                            }
                        }
                        .padding(.horizontal)
                    }

                    Spacer()

                    // Кнопка как нижняя панель
                    VStack(spacing: 0) {
                        Divider().background(Color.gray.opacity(0.3))

                        Button(action: {
                            onStartChat()
                        }) {
                            Text("Start a conversation")
                                .font(.headline.bold())
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.red)
                                .cornerRadius(15)
                                .padding(.horizontal, 20)
                                .padding(.top, 8)
                        }
                        .padding(.bottom, 30)
                    }
                    .background(Color(red: 15/255, green: 20/255, blue: 45/255).ignoresSafeArea())
                }
            }
            .tabItem {
                Image(systemName: "heart.fill")
                Text("Partner")
            }

            Text("Assistant")
                .tabItem {
                    Image(systemName: "person.fill.questionmark")
                    Text("Assistant")
                }

            Text("Articles")
                .tabItem {
                    Image(systemName: "doc.text.image")
                    Text("Articles")
                }

            Text("Profile")
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Profile")
                }
        }
        .accentColor(.red)
    }
}
