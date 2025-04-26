import SwiftUI
import Firebase

struct WidgetView: View {
    
    @State private var isLightOn = false  // Track light state locally
    
    // Function to update light state in Firebase
    func updateLightState(isOn: Bool) {
        let db = Database.database().reference()
        db.child("lights").setValue(["isOn": isOn]) { error, _ in
            if let error = error {
                print("Failed to update light state: \(error.localizedDescription)")
            } else {
                print("Light state updated successfully")
            }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                
                VStack(alignment: .leading) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Tiburon")
                                .font(.headline)
                            Text("65°")
                                .font(.largeTitle)
                                .bold()
                        }
                        Spacer()
                        VStack {
                            Image(systemName: "sun.max.fill")
                                .foregroundColor(.yellow)
                            Text("Sunny")
                                .font(.caption)
                        }
                    }
                    .padding(.top, 50)
                    Divider()
                    
                    HStack {
                        ForEach(["9AM", "10AM", "11AM", "12PM", "1PM", "2PM"], id: \.self) { time in
                            VStack {
                                Text(time)
                                    .font(.caption2)
                                Image(systemName: "sun.max.fill")
                                    .font(.caption)
                                    .foregroundColor(.yellow)
                                Text("65°")
                                    .font(.caption2)
                            }
                        }
                    }
                    
                    Divider()
                    
                    VStack(alignment: .leading) {
                        ForEach(["Tue", "Wed", "Thu", "Fri", "Sat"], id: \.self) { day in
                            HStack {
                                Text(day)
                                    .frame(width: 30)
                                ProgressView(value: 0.5)
                                    .progressViewStyle(LinearProgressViewStyle(tint: .blue))
                                Spacer()
                                Text("68°")
                            }
                        }
                    }
                    
                }
                .padding()
                .background(Color.blue.opacity(0.8))
                .cornerRadius(20)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                
                Text("Weather")
                
                VStack {
                    Image("bedroom")
                        .resizable()
                        .scaledToFill()
                        .frame(height: 150)
                        .clipped()
                    
                    VStack(spacing: 10) {
                        Text("Control Lights")
                            .font(.headline)
                        
                        // Turn On Button
                        Button(action: {
                            updateLightState(isOn: true)
                            isLightOn = true   // Set light ON
                        }) {
                            Text("Turn On")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(isLightOn ? Color.blue : Color.gray.opacity(0.3))  // Change color based on light state
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        
                        // Turn Off Button
                        Button(action: {
                            updateLightState(isOn: false)
                            isLightOn = false  // Set light OFF
                        }) {
                            Text("Turn Off")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(!isLightOn ? Color.blue : Color.gray.opacity(0.3))  // Change color based on light state
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        
                    }
                    .padding()
                    
                }
                .background(Color(.systemGray6))
                .cornerRadius(20)
                .padding()
                
                Text("Main Bed Room")
                
                Spacer()
                
            }
            .navigationTitle("")
            .padding(10)
            .frame(height: 1)
        }
    }
}

#Preview {
    WidgetView()
}
