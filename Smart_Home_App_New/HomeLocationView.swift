import SwiftUI
import MapKit

struct HomeLocationView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194), // Example: San Francisco
        span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    )
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text("Home Location")
                    .font(.title2)
                    .bold()
                Spacer()
            }
            .padding()
            
            Map(coordinateRegion: $region, annotationItems: [MarkerLocation()]) { location in
                MapMarker(coordinate: location.coordinate, tint: .red)
            }
            .cornerRadius(20)
            .padding()
            
            Spacer()
        }
        .background(Color(.systemGray6))
    }
}

struct MarkerLocation: Identifiable {
    let id = UUID()
    var coordinate = CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194)
}

#Preview {
    HomeLocationView()
}
