//
//  FlipView.swift
//  Moonshot
//
//  Created by Ahsan Qureshi on 4/3/24.
//

import SwiftUI

struct FlipView<Content: View>: View {
    var flip = false
    @ViewBuilder let children: Content

    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]

    var body: some View {
        if (flip) {
            List {
                children
            }
            .listStyle(.plain)
            .background(.darkBackground)
        } else {
            ScrollView {
                LazyVGrid(columns: columns) {
                    children
                }.padding([.horizontal, .bottom])
            }
        }
    }
}

#Preview {
    FlipView() {
        Text("Hello")
    }
}
