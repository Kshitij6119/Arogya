import SwiftUI

// Sample data for the fitness app
var postData: [PostData] = [
    .init(id: 0, Image: "0", title: "Full Body Workout Routine", followers: 150, profileImage: "00"),
    .init(id: 1, Image: "0", title: "Yoga for Beginners", followers: 275, profileImage: "2"),
    .init(id: 2, Image: "0", title: "High-Intensity Interval Training", followers: 320, profileImage: "15"),
    .init(id: 3, Image: "0", title: "Pilates Core Strength", followers: 180, profileImage: "4"),
    .init(id: 4, Image: "0", title: "Strength Training Tips", followers: 210, profileImage: "5"),
    .init(id: 5, Image: "0", title: "Nutrition for Fitness", followers: 135, profileImage: "0"),
    .init(id: 6, Image: "0", title: "Running Form and Technique", followers: 250, profileImage: "7")
]

struct PostView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center) {
                ForEach(postData, id: \.id) { data in
                    PostCardView(data: data)
                    
                    HStack(alignment: .center, spacing: 45) {
                        ForEach(socialView, id: \.ids) { action in
                            VStack {
                                Image(systemName: action.image)
                                    .font(.system(size: 20))
                                Text(action.title)
                                    .font(.subheadline)
                            }
                            .foregroundColor(colorScheme == .dark ? .white : .black.opacity(0.8))
                        }
                        .padding(.horizontal)
                    }
                    .padding(.bottom, 8) // Added padding to separate action buttons
                    
                    Divider()
                        .background(colorScheme == .dark ? Color.white.opacity(0.6) : Color.gray.opacity(0.6))
                        .padding(.horizontal) // Added padding for the divider
                }
            }
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
            .preferredColorScheme(.dark) // Preview in dark mode
        PostView()
            .preferredColorScheme(.light) // Preview in light mode
    }
}
