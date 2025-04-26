import SwiftUI

struct WidgetView: View {
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
                        Button(action: {
                         
                        }) {
                            Text("Turn On")
                                .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(.borderedProminent)
                        
                        Button(action: {
                            
                        }) {
                            Text("Turn Off")
                                .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(.bordered)
                    }
                    .padding()
                    
                }
                .background(Color(.systemGray6))
                .cornerRadius(20)
                .padding()
                
                Text("Main Bed Room")
                
                Spacer()
                
                
            }
            .navigationTitle("Widget")
            .padding(10)
            .frame(height: 1)
        }
    }
}

#Preview {
    WidgetView()
}
