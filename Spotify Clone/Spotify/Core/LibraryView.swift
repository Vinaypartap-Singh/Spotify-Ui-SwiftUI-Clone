import SwiftUI

struct LibraryView: View {
    @State private var playlists = [
        "Favorites",
        "Top Hits 2024",
        "Morning Vibes",
        "Chill Beats",
        "Workout Mix"
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.ignoresSafeArea()
                VStack {
                    Text("Your Library")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.top, 20)
                    
                    ScrollView {
                        ForEach(playlists, id: \.self) { playlist in
                            HStack {
                                Image(systemName: "music.note.list")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.white)
                                    .padding(.trailing, 10)
                                
                                Text(playlist)
                                    .font(.system(size: 14))
                                    .foregroundColor(.white)
                                
                                Spacer()
                            }
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                            .padding(.horizontal)
                        }
                    }
                }
            }
        }
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}
