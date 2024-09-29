//
//  MapView.swift
//  Thien-codev-self-learning
//
//  Created by Nguyen Thien on 29/9/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @Environment(MapViewModel.self) private var viewModel
    let cor = CLLocationCoordinate2D(latitude: 10.78248, longitude: 106.688)
    let cor2 = CLLocationCoordinate2D(latitude: 10.79248, longitude: 106.688)
    @State var openView: Bool = false
    @State var lookAround: MKLookAroundScene?
    var body: some View {
        ZStack {
            Map(position: Bindable(viewModel).cameraPos)
            {
                Marker(coordinate: cor) {
                    Text("My house")
                }
                .tint(.blue)
                
                MapPolyline(coordinates: [cor, cor2])
                    .stroke(.red, lineWidth: 4)
            }
            .mapControls({
                MapCompass()
                MapScaleView()
                MapPitchToggle()
            })
            .mapControlVisibility(.visible)
            .mapStyle(.hybrid)
//            .ignoresSafeArea()
            .onMapCameraChange { context in
                viewModel.cameraPos = .region(context.region)
            }
            
            VStack {
                Spacer()
                LookAroundPreview(initialScene: lookAround)
                    .frame(height: 200)
                    .padding()
                Button {
                    if let region = viewModel.cameraPos.region {
                        Task {
                            let request = MKLookAroundSceneRequest(coordinate: region.center)
                            if let scene = try? await request.scene {
                                lookAround = scene
                                openView = true
                            }
                        }
                    }
                } label: {
                    Text("Look around")
                }

                HStack {
                    if viewModel.cameraPos.region?.center.latitude != nil {
                        Group {
                            Text(String(viewModel.cameraPos.region?.center.latitude ?? 0))
                            Text(String(viewModel.cameraPos.region?.center.longitude ?? 0))
                        }.font(.system(size: 17, weight: .bold))
                            .foregroundColor(.white)
                    }
                }
            }
        }
    }
}

#Preview {
    MapView().environment(MapViewModel())
}
