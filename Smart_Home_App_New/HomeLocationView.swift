import SwiftUI
import MapKit
import FirebaseDatabase

struct HomeLocationView: View {
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 7.045868, longitude: -79.887901),
        span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    )
    
    @State private var markerLocation = MarkerLocation()
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text("Home Location")
                    .font(.title2)
                    .bold()
                Spacer()
            }
            .padding()
            
            Map(coordinateRegion: $region, annotationItems: [markerLocation]) { location in
                MapMarker(coordinate: location.coordinate, tint: .red)
            }
            .cornerRadius(20)
            .padding()
            
            Spacer()
        }
        .background(Color(.systemGray6))
        .onAppear {
            fetchHomeLocation()
        }
    }
    
    func fetchHomeLocation() {
        let db = Database.database().reference()
        
        db.child("homeLocation").observe(.value) { snapshot in
            if let value = snapshot.value as? [String: Any],
               let lat = value["latitude"] as? CLLocationDegrees,
               let lon = value["longitude"] as? CLLocationDegrees {
                
                let newCoordinate = CLLocationCoordinate2D(latitude: lat, longitude: lon)
                
                region.center = newCoordinate
                markerLocation.coordinate = newCoordinate
                
                print("Updated home location: \(lat), \(lon)")
            } else {
                print("Failed to fetch location data.")
            }
        }
    }
}

struct MarkerLocation: Identifiable {
    let id = UUID()
    var coordinate = CLLocationCoordinate2D(latitude: 7.045868, longitude: -79.887901)
}

#Preview {
    HomeLocationView()
}
