import SwiftUI

// Calendar View
struct CalendarView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    // Dismiss the calendar view
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "arrow.left")
                        .font(.system(size: 20))
                        .padding()
                        .foregroundColor(.blue)
                }
                Spacer()
                Text("Calendar")
                    .font(.largeTitle)
                    .padding()
                Spacer()
            }
            
           
            DatePicker("Select a date", selection: .constant(Date()), displayedComponents: .date)
                .padding()
            
            Spacer()
            
            Button(action: {
                // Action to close the calendar view
                // This will be handled by the Sheet presentation
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Done")
                    .font(.body)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .padding()
        }
    }
}

struct ProfileAndPostView: View {
    @State private var showCalendar = false
    
    var body: some View {
        VStack(alignment: .leading) {
            SearchBar()
                .padding(.horizontal)
            
            Divider()
                .background(Color.primary.opacity(0.2))
            
            HStack {
                Image(systemName: "plus.circle.fill")
                    .font(.system(size: 24))
                    .foregroundColor(.teal)
                
                Text("Share Your Fitness Journey")
                    .font(.headline)
                    .padding(.leading, 4)
                    .foregroundColor(.primary)
                Spacer()
            }
            .padding(.horizontal)
            
            Divider()
                .background(Color.primary.opacity(0.2))
            
            HStack {
                Button(action: {
                    // Action for photo
                }) {
                    VStack {
                        Image(systemName: "photo.fill")
                            .font(.system(size: 24))
                            .foregroundColor(.purple)
                        Text("Photo")
                            .font(.caption)
                            .foregroundColor(.primary)
                    }
                }
                Spacer()
                
                Button(action: {
                    // Action for video
                }) {
                    VStack {
                        Image(systemName: "video.fill")
                            .font(.system(size: 24))
                            .foregroundColor(.green)
                        Text("Video")
                            .font(.caption)
                            .foregroundColor(.primary)
                    }
                }
                Spacer()
                
                Button(action: {
                    // Show calendar view
                    showCalendar.toggle()
                }) {
                    VStack {
                        Image(systemName: "calendar.circle.fill")
                            .font(.system(size: 24))
                            .foregroundColor(.orange)
                        Text("Events")
                            .font(.caption)
                            .foregroundColor(.primary)
                    }
                }
                .sheet(isPresented: $showCalendar) {
                    CalendarView()
                }
            }
            .padding(.horizontal)
        }
        .padding(.top, 10)
        .background(Color.accentColor.opacity(0.1))
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct ProfileAndPostView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ProfileAndPostView()
                .preferredColorScheme(.light) // Light mode preview
            ProfileAndPostView()
                .preferredColorScheme(.dark) // Dark mode preview
        }
    }
}
