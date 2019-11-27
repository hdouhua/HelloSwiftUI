//
//  CircleImage.swift
//  HelloSwiftUI
//
//  Created by Dao on 2019/10/22.
//  Copyright © 2019 Fortune. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var image: Image

    var body: some View {
        image
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.gray, lineWidth: 2))
            .shadow(radius: 10)
    }
}

#if DEBUG
    struct CircleImage_Preview: PreviewProvider {
        static var previews: some View {
            CircleImage(image: Image("Garfield"))
        }
    }
#endif
