//
//  HomeView.swift
//  EcoContributorApp
//
//  Created by Kiah Epperson on 11/14/24.
//
import SwiftUI

struct HomeView: View {
    @State private var searchText = ""
    @State private var projects: [Project] = [
        Project(name: "Plant Finder", subject: "Rare Plant Identification"),
        Project(name: "Grunion Greeters", subject: "Grunion Spawning on Coast")
    ]

    var filteredProjects: [Project] {
        projects.filter { project in
            searchText.isEmpty || project.name.localizedCaseInsensitiveContains(searchText)
        }
    }

    var body: some View {
        VStack {
            TextField("Search", text: $searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            List(filteredProjects) { project in
                VStack(alignment: .leading) {
                    Text(project.name).font(.headline)
                    Text(project.subject).font(.subheadline)
                }
            }
        }
        .navigationTitle("Home")
    }
}

struct Project: Identifiable {
    let id = UUID()
    let name: String
    let subject: String
}
