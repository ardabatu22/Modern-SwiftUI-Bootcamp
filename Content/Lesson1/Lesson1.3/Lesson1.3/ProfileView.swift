//
//  ProfileView.swift
//  Lesson1.3
//
//  Created by Batuhan Arda on 22.08.2025.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                headerSection
                infoCardsSection
                aboutMeSection
                actionButtonsSection
            }
            .padding(.horizontal)
        }
    }

    private var headerSection: some View {
        ZStack {
            LinearGradient(
                colors: [.black, .gray],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .frame(height: 240)
            .ignoresSafeArea(edges: .top)

            VStack(spacing: 10) {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.white)
                    .background(Color.white.opacity(0.2))
                    .clipShape(Circle())

                Text("Batuhan Arda")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)

                Text("iOS Developer | SwiftUI Lover")
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.9))
            }
        }
        .clipShape(.rect(cornerRadius: 16))
    }

    private var infoCardsSection: some View {
        HStack(spacing: 16) {
            InfoCard(title: "Takipçi", value: "1.2K")
            InfoCard(title: "Takip", value: "250")
            InfoCard(title: "Beğeni", value: "4.5K")
        }
    }

    private var aboutMeSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Hakkımda")
                .font(.headline)
                .bold()

            ScrollView {
                Text("""
                Merhaba! Ben Batuhan, 2 yıldır iOS uygulamaları geliştiriyorum. SwiftUI ile uygulama tasarlamayı ve modern arayüzler geliştirmeyi çok seviyorum. Kod yazmak benim için bir tutku ve her gün yeni şeyler öğrenmeye çalışıyorum.
                """)
                    .font(.body)
                    .foregroundColor(.secondary)
            }
            .frame(height: 120)
        }
    }

    private var actionButtonsSection: some View {
        HStack(spacing: 16) {
            ProfileButton(title: "Mesaj Gönder", backgroundColor: .blue)
            ProfileButton(title: "Takip Et", backgroundColor: .blue)
        }
    }
}

struct InfoCard: View {
    let title: String
    let value: String

    var body: some View {
        VStack(spacing: 4) {
            Text(value)
                .font(.title2)
                .bold()
            Text(title)
                .font(.caption)
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color(UIColor.systemGray6))
        .cornerRadius(12)
    }
}

struct ProfileButton: View {
    let title: String
    let backgroundColor: Color

    var body: some View {
        Button(action: {
            print("\(title) butonuna tıklandı")
        }) {
            Text(title)
                .frame(maxWidth: .infinity)
                .padding()
                .background(backgroundColor)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
    }
}

#Preview {
    ProfileView()
}

