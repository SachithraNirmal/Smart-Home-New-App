import SwiftUI

struct NavigationBarView: View {
    var body: some View {
        TabView {
            AutomationView()
                .tabItem {
                    Image(systemName: "bolt.circle")
                    Text("Automation")
                }

            ControlView()
                .tabItem {
                    Image(systemName: "slider.horizontal.3")
                    Text("Control")
                }

            RoomControlView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Room")
                }

            HomeLocationView()
                .tabItem {
                    Image(systemName: "map.fill")
                    Text("Location")
                }

            DataStorageView()
                .tabItem {
                    Image(systemName: "archivebox.fill")
                    Text("Storage")
                }
            SmartLightView()
                .tabItem {
                    Image(systemName: "archivebox.fill")
                    Text("Control Light")
                }
            WidgetView()
                .tabItem {
                    Image(systemName: "archivebox.fill")
                    Text("Widget")
                }
        }
    }
}
