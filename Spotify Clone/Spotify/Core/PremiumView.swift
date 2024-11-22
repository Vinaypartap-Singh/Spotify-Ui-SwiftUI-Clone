import SwiftUI

struct PremiumView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(spacing: 20) {
                Text("Go Premium")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.spotifyGreen)
                    .padding(.top, 40)
                
                Text("Enjoy uninterrupted music with no ads, high-quality sound, and offline listening.")
                    .font(.body)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                Spacer()
                
                Button(action: {
                    print("Upgrade to Premium")
                }) {
                    Text("Upgrade to Premium")
                        .bold()
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.spotifyGreen)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                
                Spacer()
            }
        }
    }
}

struct PremiumView_Previews: PreviewProvider {
    static var previews: some View {
        PremiumView()
    }
}
