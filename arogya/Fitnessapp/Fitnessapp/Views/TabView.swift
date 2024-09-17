import SwiftUI

struct TabScreen: View {
    var body: some View {
        TabView {
            // Home Tab
            HomeScreen()
                .tabItem {
                    VStack {
                        Image(systemName: "house.fill")
                            .font(.system(size: 24))
                        Text("Home")
                            .font(.caption)
                    }
                }
            
            // Network Tab
            MyNetworkScreen()
                .tabItem {
                    VStack {
                        Image(systemName: "person.2.fill")
                            .font(.system(size: 24))
                        Text("Tutor")
                            .font(.caption)
                    }
                }
            
            // Elder Tab
            ElderView()
                .tabItem {
                    VStack {
                        Image(systemName: "figure.mind.and.body")
                            .font(.system(size: 24))
                        Text("Elder")
                            .font(.caption)
                    }
                }
            
            // Fitness Tracker Tab
            FitnessView()
                .tabItem {
                    VStack {
                        Image(systemName: "waveform.path.ecg")
                            .font(.system(size: 24))
                        Text("Fitness Tracker")
                            .font(.caption)
                    }
                }
            
            // Profile Tab
            
            ProfileView()
                .tabItem {
                    VStack {
            Image(systemName: "person.fill")
        .font(.system(size: 24))
        Text("Profile")
        .font(.caption)
                              }
                          }
                  }
        .accentColor(.blue) // Unified color for the selected tab
        .background(Color.white) // Background color of the TabView
        .clipShape(RoundedRectangle(cornerRadius: 10)) // Rounded corners for the TabView
        .shadow(color: Color.gray.opacity(0.2), radius: 10, x: 0, y: 5) // Shadow
    }
}

struct FitnessTrackerView: View {
    var body: some View {
        Text("Fitness Tracker")
            .font(.largeTitle)
            .fontWeight(.bold)
            .padding()
    }
}

struct TabScreen_Previews: PreviewProvider {
    static var previews: some View {
        TabScreen()
    }
}
