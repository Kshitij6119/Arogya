import SwiftUI

struct SocialView {
    var ids: Int
    var image: String
    var title: String
}

var socialView: [SocialView] = [
    .init(ids: 0, image: "hand.thumbsup", title: "Like"),
    .init(ids: 1, image: "text.bubble", title: "Comment"),
    .init(ids: 2, image: "arrow.turn.up.right", title: "Share"),
]

let samplePostData = PostData(id: 1, Image: "02", title: "Alex's Full Body Workout Routine", followers: 150, profileImage: "1")

struct PostCardView: View {
    var data: PostData
    
    var body: some View {
        VStack(alignment: .leading) {
            Rectangle()
                .fill(.gray.opacity(0.4))
                .frame(width: .infinity, height: 10)
                .ignoresSafeArea(.all)
            
            HStack(alignment: .center) {
                Image(data.profileImage)
                    .resizable()
                    .clipShape(Circle())
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 70, height: 70)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(data.title)
                        .font(.body)
                    Text("\(data.followers) followers")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text("8m ago")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                Spacer()
                Image(systemName: "ellipsis")
                    .foregroundColor(.orange)
            }
            .padding(.horizontal)
            
            Text("Get inspired by Alex’s intense full-body workout routine. Join now and boost your fitness journey!")
                .font(.body)
                .padding(.horizontal)
                .padding(.bottom, 8)
            
            Image(data.Image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity, maxHeight: 300)
                .cornerRadius(12)
                .clipped()
                .padding(.horizontal)
            
            Divider()
        }
    }
}

struct PostCardView_Previews: PreviewProvider {
    static var previews: some View {
        PostCardView(data: samplePostData)
    }
}
