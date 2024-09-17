import SwiftUI

struct SearchBar: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var isDarkMode: Bool = false
    @State private var searchText: String = "" // State variable for search text

    var body: some View {
        HStack(alignment: .center) {
            // Profile Image
            Image("demo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .frame(width: 50, height: 50) // Adjusted size for responsiveness
                .padding(.leading)
            
            // Search bar with TextField
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(colorScheme == .dark ? Color(.systemGray5) : Color(.systemGray6)) // Adapt based on dark mode
                .frame(width: 270, height: 30) // Adjusted width and height for a smaller box
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray) // Gray color for the icon
                        TextField("Search...", text: $searchText) // Simplified placeholder text
                            .font(.body)
                            .foregroundColor(.primary) // Text color for better readability
                            .padding(.leading, 8)
                        Spacer()
                    }
                    .padding(.horizontal, 8)
                )
            
            // Light/Dark mode toggle button
            Button(action: {
                // Toggle the dark/light mode
                isDarkMode.toggle()
                UIApplication.shared.windows.first?.rootViewController?.overrideUserInterfaceStyle = isDarkMode ? .dark : .light
            }) {
                Image(systemName: isDarkMode ? "sun.max.fill" : "moon.fill")
                    .resizable()
                    .foregroundColor(.gray) // Gray color for the icon
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20) // Adjust size for responsiveness
                    .scaleEffect(1.1) // Slightly enlarged on tap
                    .animation(.easeInOut, value: isDarkMode) // Smooth animation for scale change
            }
            .buttonStyle(PlainButtonStyle()) // Ensures the button does not have default button styling
            .padding(.trailing)
        }
        .padding(.top)
        .background(Color(.systemBackground)) // Background color that adapts to dark mode
        .cornerRadius(10) // Rounded corners for visual appeal
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SearchBar()
                .preferredColorScheme(.light) // Light mode preview
            SearchBar()
                .preferredColorScheme(.dark) // Dark mode preview
        }
    }
}
