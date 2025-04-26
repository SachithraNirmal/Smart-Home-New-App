import SwiftUI

struct DataStorageView: View {
    var body: some View {
        VStack(spacing: 30) {
            Text("Data Storage")
                .font(.title2)
                .bold()
                .padding()
            
            VStack(spacing: 20) {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Video 1")
                            .font(.headline)
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.gray.opacity(0.5))
                            .frame(height: 50)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Video 2")
                            .font(.headline)
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.gray.opacity(0.5))
                            .frame(height: 50)
                    }
                }
                .padding()
                .background(Color.purple.opacity(0.2))
                .cornerRadius(20)
                .padding(.horizontal)
            }
            
            VStack(spacing: 15) {
                StorageButton(title: "Photos")
                StorageButton(title: "Files")
                StorageButton(title: "Videos")
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .background(Color(.systemGray6))
    }
}

struct StorageButton: View {
    var title: String
    
    var body: some View {
        Button(action: {
            
        }) {
            Text(title)
                .bold()
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue.opacity(0.5))
                .foregroundColor(.white)
                .cornerRadius(20)
        }
    }
}

#Preview {
    DataStorageView()
}
