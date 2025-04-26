import SwiftUI

struct NavigationBarView: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    Button(action: {
                        path.append("automation")
                    }) {
                        VStack {
                            Image(systemName: "bolt.circle")
                            Text("Automation")
                        }
                    }
                    Spacer()
                    Button(action: {
                        path.append("control")
                    }) {
                        VStack {
                            Image(systemName: "slider.horizontal.3")
                            Text("Control")
                        }
                    }
                    Spacer()
                    Button(action: {
                        path.append("room")
                    }) {
                        VStack {
                            Image(systemName: "house.fill")
                            Text("Room")
                        }
                    }
                    Spacer()
                    Button(action: {
                        path.append("location")
                    }) {
                        VStack {
                            Image(systemName: "map.fill")
                            Text("Location")
                        }
                    }
                    Spacer()
                    Button(action: {
                        path.append("storage")
                    }) {
                        VStack {
                            Image(systemName: "archivebox.fill")
                            Text("Storage")
                        }
                    }
                    Spacer()
                }
                .padding()
                .background(Color(.systemGray6))
            }
            .navigationDestination(for: String.self) { page in
                
                VStack {
                            if page == "automation" {
                                AutomationView()
                            } else if page == "control" {
                                ControlView()
                            } else if page == "room" {
                                RoomControlView()
                            } else if page == "location" {
                                HomeLocationView()
                            } else if page == "storage" {
                                DataStorageView()
                            }
                        }
                .padding()
                }
            }
        }
    }
