//
//  LandmarkList.swift
//  HelloSwiftUI
//
//  Created by Dao on 2019/10/27.
//  Copyright © 2019 Fortune. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var userData: UserData
    // @State var showFavoritesOnly = true
    // use $ prefix to access

    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $userData.showFavoritesOnly) {
                    Text("Favorites Only")
                }

                ForEach(userData.landmarks) { element in
                    if !self.userData.showFavoritesOnly || element.isFavorite {
                        NavigationLink(destination: LandmarkDetail(landmark: element).environmentObject(self.userData)) {
                            LandmarkRow(landmark: element)
                        }
                    }
                }

            }.navigationBarTitle(Text("Landmarks"))
        }
    }
}

#if DEBUG
    struct LandmarkList_Previews: PreviewProvider {
        static var previews: some View {
            ForEach(["iPhone 8", "iPhone 11 Pro"], id: \.self) { deviceName in
                LandmarkList()
                    .previewDevice(PreviewDevice(rawValue: deviceName))
                    .previewDisplayName(deviceName)
            }.environmentObject(UserData())
        }
    }
#endif
