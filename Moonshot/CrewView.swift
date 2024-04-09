//
//  CrewView.swift
//  Moonshot
//
//  Created by Ahsan Qureshi on 4/2/24.
//

import SwiftUI

struct CrewView: View {
    let crew: [MissionView.CrewMember]

    @Binding var path: NavigationPath

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crew, id: \.role) { crewMember in
                    NavigationLink(value: crewMember) {
                        HStack {
                            Image(crewMember.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(.capsule)
                                .overlay(
                                    Capsule()
                                        .strokeBorder(.white, lineWidth: 1)
                                )

                            VStack(alignment: .leading) {
                                Text(crewMember.astronaut.name)
                                    .foregroundStyle(.white)
                                    .font(.headline)
                                Text(crewMember.role)
                                    .foregroundStyle(.white.opacity(0.5))
                            }
                        }
                        .padding(.horizontal)
                        .navigationDestination(for: MissionView.CrewMember.self) { crewMember in
                            AstronautView(astronaut: crewMember.astronaut)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let mission = missions[1]
    let astronauts : [String: Astronaut] = Bundle.main.decode("astronauts.json")

    let crewMembers = mission.crew.map { member in
        if let astronaut = astronauts[member.name] {
            return MissionView.CrewMember(role: member.role, astronaut: astronaut)
        } else {
            fatalError("Missing \(member.name)")
        }
    }

    @State var path = NavigationPath()
    return CrewView(crew: crewMembers, path: $path).preferredColorScheme(.dark)
}
