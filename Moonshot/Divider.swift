//
//  Divider.swift
//  Moonshot
//
//  Created by Ahsan Qureshi on 4/2/24.
//

import SwiftUI

struct Divider: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundStyle(.lightBackground)
            .padding(.vertical)
    }
}

#Preview {
    Divider()
}
