import SwiftUI

// Sample data for the fitness app
var fitnessData: [NetworkModel] = [
    .init(id: 0, name: "Alex Johnson", position: "Yoga Instructor", mutual: 12, image: "01"),
    .init(id: 1, name: "Jamie Lee", position: "Personal Trainer", mutual: 8, image: "02"),
    .init(id: 2, name: "Jordan Smith", position: "Nutritionist", mutual: 15, image: "03"),
    .init(id: 3, name: "Taylor Brown", position: "Fitness Coach", mutual: 20, image: "04"),
    .init(id: 4, name: "Casey Davis", position: "Pilates Instructor", mutual: 25, image: "05"),
    .init(id: 5, name: "Morgan Lee", position: "Strength Trainer", mutual: 18, image: "00"),
    .init(id: 6, name: "Riley Martin", position: "Cardio Specialist", mutual: 22, image: "01"),
    .init(id: 7, name: "Avery King", position: "Rehabilitation Therapist", mutual: 10, image: "02"),
    .init(id: 8, name: "Taylor Brown", position: "CrossFit Coach", mutual: 30, image: "04"),
    .init(id: 9, name: "Jordan Wilson", position: "Functional Fitness Trainer", mutual: 12, image: "05")
]

struct MyNetworkScreen: View {
    var body: some View {
        VStack {
            // Search Bar
            SearchBar()
                .background(Color.white) // Ensures the search bar stands out
            
            // Title and Divider
            VStack {
                HStack {
                    Text("Fitness Tutors")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)
                
                Rectangle()
                    .fill(Color.gray.opacity(0.2))
                    .frame(height: 1)
                    .padding(.horizontal)
            }
            
            // ScrollView for Requests
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        Text("Requests")
                            .font(.headline)
                            .foregroundColor(.primary)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal)
                    
                    Divider()
                    
                    ForEach(fitnessData, id: \.id) { data in
                        InvitationView(Data: data)
                        Divider()
                    }
                }
            }
        }
        .background(Color(.systemGroupedBackground))
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct MyNetworkScreen_Previews: PreviewProvider {
    static var previews: some View {
        MyNetworkScreen()
    }
}
