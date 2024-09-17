import SwiftUI

struct ElderView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
              
                // Title and Introduction
                Text("Fitness for Elders")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                
                Text("Staying active is crucial at any age. Here are some exercises and tips tailored specifically for elders to maintain their fitness, flexibility, and strength.")
                    .font(.body)
                    .padding(.horizontal)
                    .foregroundColor(.secondary)
                
                // Cardio Section
                VStack(alignment: .leading, spacing: 15) {
                    HStack {
                        Image(systemName: "heart.circle")
                            .font(.title)
                            .foregroundColor(.red)
                        Text("Cardio Exercises")
                            .font(.headline)
                    }
                    Text("Low-impact cardio exercises like walking, swimming, or cycling are great for maintaining heart health.")
                        .font(.body)
                        .foregroundColor(.secondary)
                }
                .padding(.horizontal)
                .padding(.vertical, 10)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                
                // Strength Training Section
                VStack(alignment: .leading, spacing: 15) {
                    HStack {
                        Image(systemName: "figure.walk.circle")
                            .font(.title)
                            .foregroundColor(.green)
                        Text("Strength Training")
                            .font(.headline)
                    }
                    Text("Light weight lifting or resistance band exercises help in maintaining muscle mass and bone density.")
                        .font(.body)
                        .foregroundColor(.secondary)
                }
                .padding(.horizontal)
                .padding(.vertical, 10)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                
                // Flexibility & Balance Section
                VStack(alignment: .leading, spacing: 15) {
                    HStack {
                        Image(systemName: "figure.cooldown.circle")
                            .font(.title)
                            .foregroundColor(.blue)
                        Text("Flexibility & Balance")
                            .font(.headline)
                    }
                    Text("Incorporate stretching, yoga, or Tai Chi to improve flexibility and balance, reducing the risk of falls.")
                        .font(.body)
                        .foregroundColor(.secondary)
                }
                .padding(.horizontal)
                .padding(.vertical, 10)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                
                // Additional Tips Section
                VStack(alignment: .leading, spacing: 15) {
                    HStack {
                        Image(systemName: "lightbulb.circle")
                            .font(.title)
                            .foregroundColor(.yellow)
                        Text("Additional Tips")
                            .font(.headline)
                    }
                    Text("• Stay hydrated and maintain a balanced diet to support your fitness routine.\n• Ensure to warm up before and cool down after exercises.\n• Listen to your body and avoid overexertion.")
                        .font(.body)
                        .foregroundColor(.secondary)
                }
                .padding(.horizontal)
                .padding(.vertical, 10)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                
                Spacer()
            }
            .padding(.vertical)
        }
        .background(Color("BackgroundColor").edgesIgnoringSafeArea(.all))
        .foregroundColor(.primary)
        .navigationBarTitle("Elder Fitness", displayMode: .inline)
    }
}

struct ElderView_Previews: PreviewProvider {
    static var previews: some View {
        ElderView()
            .preferredColorScheme(.dark) // Preview in dark mode
        ElderView()
            .preferredColorScheme(.light) // Preview in light mode
    }
}
