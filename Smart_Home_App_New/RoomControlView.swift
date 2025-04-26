import SwiftUI

struct RoomControlView: View {
    @State private var getUpOn = false
    @State private var goodnightOn = false
    @State private var goOutOn = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                
                VStack(alignment: .leading, spacing: 5) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Hi, Hoang Trang")
                                .font(.title)
                                .bold()
                            Text("28°C | 70% | Wed, May 24th")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.blue)
                    }
                    .padding()
                }
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(20)
                .padding(.horizontal)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        AutomationCard(title: "Get up", systemImage: "sunrise.fill", isOn: $getUpOn)
                        AutomationCard(title: "Goodnight", systemImage: "moon.fill", isOn: $goodnightOn)
                        AutomationCard(title: "Go out", systemImage: "car.fill", isOn: $goOutOn)
                    }
                    .padding(.horizontal)
                }
                
                VStack(alignment: .leading) {
                    Text("Camera")
                        .font(.headline)
                        .padding(.horizontal)
                    
                    VStack {
                        Image("bedroom")
                            .resizable()
                            .scaledToFill()
                            .frame(height: 180)
                            .clipped()
                        
                        HStack {
                            Text("Living room")
                                .font(.subheadline)
                            Spacer()
                            Text("• Live")
                                .font(.caption)
                                .foregroundColor(.green)
                        }
                        .padding([.horizontal, .bottom])
                    }
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(radius: 5)
                    .padding(.horizontal)
                }
                
                VStack(alignment: .leading) {
                    Text("Loudspeaker")
                        .font(.headline)
                        .padding(.horizontal)
                    
                    VStack(alignment: .leading) {
                        Text("Playing on: Marshall Stanmore 3")
                            .font(.caption)
                            .foregroundColor(.gray)
                        Text("Bloody mary")
                            .font(.title3)
                            .bold()
                        Text("Lady Gaga")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(radius: 5)
                    .padding(.horizontal)
                }
            }
            .padding(.vertical)
        }
        .background(Color(.systemGray6))
    }
}

struct AutomationCard: View {
    var title: String
    var systemImage: String
    @Binding var isOn: Bool
    
    var body: some View {
        VStack {
            Image(systemName: systemImage)
                .font(.largeTitle)
                .foregroundColor(.yellow)
            Text(title)
                .font(.caption)
                .padding(.top, 5)
            Toggle("", isOn: $isOn)
                .labelsHidden()
        }
        .padding()
        .frame(width: 100, height: 130)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 3)
    }
}

#Preview {
    RoomControlView()
}
