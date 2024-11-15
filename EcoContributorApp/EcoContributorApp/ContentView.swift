//
//  ContentView.swift
//  EcoContributorApp
//
//  Created by Kiah Epperson on 11/14/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userAuth: UserAuth
    
    var body: some View {
        VStack {
            if userAuth.isLogged || userAuth.isGuest {
                HomeView()
            } else {
                LoginView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(UserAuth())
    }
}

#Preview {
    ContentView()
}
