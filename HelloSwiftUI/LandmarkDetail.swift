//
//  ContentView.swift
//  HelloSwiftUI
//
//  Created by Dao on 2019/10/22.
//  Copyright © 2019 Fortune. All rights reserved.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var userData: UserData
    var landmark: Landmark

    var landmarkIndex: Int {
        userData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }

    var body: some View {
        VStack {
            MapView(coordinate: landmark.locationCoordinate)
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)

            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)

            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                        .foregroundColor(Color.red)

                    Button(action: {
                        self.userData.landmarks[self.landmarkIndex].isFavorite.toggle()
                    }) {
                        if self.userData.landmarks[self.landmarkIndex].isFavorite {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                        } else {
                            Image(systemName: "star")
                                .foregroundColor(.gray)
                        }
                    }
                }

                HStack {
                    Text(landmark.park)
                        .font(.subheadline)
                    Spacer()
                    Text(landmark.state)
                        .font(.subheadline)
                }
            }
            .padding()
        }
        // .padding()
        .navigationBarTitle(Text(landmark.name), displayMode: .inline)
    }
}

#if DEBUG
    struct LandmarkDetail_Previews: PreviewProvider {
        static var previews: some View {
            LandmarkDetail(landmark: landmarkData[0])
                .environmentObject(UserData())
        }
    }
#endif
