//
//  ProfileView.swift
//  iOS
//
//  Created by Stefan Cimander on 01.01.21.
//

import SwiftUI

struct ProfileView: View {
    
    @State
    private var showLoginModal = false
    
    var body: some View {
        NavigationView {
            Button("Log In") { self.showLoginModal.toggle() }
                .sheet(isPresented: self.$showLoginModal) { LoginView() }
                .navigationTitle("Profile")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
