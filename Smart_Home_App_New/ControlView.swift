import SwiftUI
import FirebaseDatabase

struct ControlView: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    @State private var airConditionOn = true
    @State private var washingMachineOn = false
    @State private var airPurifierOn = true
    @State private var dyerOn = false
    
   
    let ref = Database.database().reference()

    var body: some View {
        VStack(spacing: 0) {
            headerView
            
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    searchBar
                    
                    welcomeSection
                    
                    roomTabs
                    
                    LazyVGrid(columns: columns, spacing: 20) {
                        deviceCard(imageName: "air.conditioner", deviceName: "Air condition", location: "Main Bedroom", isOn: $airConditionOn)
                        deviceCard(imageName: "washer", deviceName: "Washing Machine", location: "1 device", isOn: $washingMachineOn)
                        deviceCard(imageName: "air.purifier", deviceName: "Air purifier", location: "4 devices", isOn: $airPurifierOn)
                        deviceCard(imageName: "hairdryer", deviceName: "Dyer", location: "2 Bedroom", isOn: $dyerOn)
                    }
                }
                .padding()
            }
            
        }
        .background(Color(.systemGroupedBackground))
        .ignoresSafeArea(edges: .bottom)
        .onChange(of: airConditionOn, sendDeviceStates)
        .onChange(of: washingMachineOn, sendDeviceStates)
        .onChange(of: airPurifierOn, sendDeviceStates)
        .onChange(of: dyerOn, sendDeviceStates)
    }
    
    func sendDeviceStates() {
        let data: [String: Bool] = [
            "AirCondition": airConditionOn,
            "WashingMachine": washingMachineOn,
            "AirPurifier": airPurifierOn,
            "Dyer": dyerOn
        ]
        
        ref.child("devices").setValue(data) { error, _ in
            if let error = error {
                print("❌ Failed to send device states: \(error.localizedDescription)")
            } else {
                print("✅ Device states updated in Firebase.")
            }
        }
    }
    
    var headerView: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("28°C  ☀️   70%  📅  Wed, May 24th")
                    .font(.caption)
                    .foregroundColor(.white)
                Text("Control")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
            }
            Spacer()
            Image(systemName: "person.crop.circle")
                .resizable()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
        }
        .padding()
        .background(Color.blue)
    }
    
    var searchBar: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            TextField("Search...", text: .constant(""))
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
    }
    
    var welcomeSection: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Welcome to Smart Living!")
                    .font(.headline)
                Text("Take control as you begin your seamless journey of home automation")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            Spacer()
            Button(action: {}) {
                HStack {
                    Image(systemName: "plus.circle.fill")
                    Text("Add device")
                }
                .padding(8)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
        }
    }
    
    var roomTabs: some View {
        HStack {
            ForEach(["My home", "Kitchen", "Bathroom", "Living room"], id: \.self) { room in
                Button(action: {}) {
                    Text(room)
                        .padding(.horizontal, 6)
                        .padding(.vertical, 10)
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(10)
                }
            }
        }
    }
    
    func deviceCard(imageName: String, deviceName: String, location: String, isOn: Binding<Bool>) -> some View {
        VStack(spacing: 12) {
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 50)
            Text(deviceName)
                .font(.headline)
            Text(location)
                .font(.caption)
                .foregroundColor(.gray)
            Toggle("", isOn: isOn)
                .labelsHidden()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 3)
    }
}

struct ControlView_Previews: PreviewProvider {
    static var previews: some View {
        ControlView()
    }
}
