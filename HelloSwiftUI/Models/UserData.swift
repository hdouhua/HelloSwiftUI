//
//  UserData.swift
//  HelloSwiftUI
//
//  Created by Dao on 2019/10/28.
//  Copyright © 2019 Fortune. All rights reserved.
//

import Combine

final class UserData: ObservableObject {
    @Published var showFavoritesOnly = false
    @Published var landmarks = landmarkData
}
