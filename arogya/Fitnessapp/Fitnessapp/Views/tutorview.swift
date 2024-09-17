import SwiftUI

// Sample Data for the fitness app
let sampleData = NetworkModel(id: 1, name: "Alex Johnson", position: "Personal Trainer", mutual: 8, image: "01")

struct InvitationView: View {
    var Data: NetworkModel
    
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            // Profile Image
            Image(Data.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .frame(width: 70, height: 70, alignment: .leading)
            
            // User Information
            VStack(alignment: .leading) {
                Text(Data.name)
                    .font(.body)
                    .foregroundColor(.primary) // Adapts to light/dark mode
                Text(Data.position)
                    .font(.subheadline)
                    .foregroundColor(.secondary) // Adapts to light/dark mode
                Text("⚭ \(Data.mutual) mutual connections")
                    .font(.caption)
                    .foregroundColor(.secondary) // Adapts to light/dark mode
            }
            .frame(width: 150, height: 70, alignment: .leading) // Adjusted height
            
            Spacer()
            
            // Follow Button
            Button(action: {
                // Action for following the user
            }) {
                Text("Follow")
                    .font(.body)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .padding(.trailing)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.horizontal)
        .background(Color(UIColor.systemBackground)) // Adapts to light/dark mode
        .clipShape(RoundedRectangle(cornerRadius: 10)) // Rounded corners for a polished look
    }
}

struct InvitationView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            InvitationView(Data: sampleData)
                .preferredColorScheme(.light) // Light mode preview
            InvitationView(Data: sampleData)
                .preferredColorScheme(.dark) // Dark mode preview
        }
    }
}
