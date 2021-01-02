//
//  LogInView.swift
//  Athlety
//
//  Created by Stefan Cimander on 01.01.21.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    
    @Environment(\.presentationMode)
    private var presentationMode
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 16) {
                withRoundedRectangleOverlay(emailTextField)
                withRoundedRectangleOverlay(passwordTextField)
                loginButton.padding(.top, 20)
            }
            .padding()
            .navigationTitle("Log In")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: cancelButton)
        }
    }
    
    private var emailTextField: some View {
        let image = Image(systemName: "person").foregroundColor(.gray)
        let textField = TextField("Email", text: $email)
            .textContentType(.emailAddress)
            .keyboardType(.emailAddress)
            .autocapitalization(.none)
            .padding(.leading, 4)
        
        return HStack { image; textField }
    }
    
    private var passwordTextField: some View {
        let image = Image(systemName: "lock").foregroundColor(.gray)
        let textField = SecureField("Password", text: $password)
            .padding(.leading, 4)
            .textContentType(.password)
        
        return HStack { image; textField }
    }
    
    private func withRoundedRectangleOverlay<T: View> (_ view: T) -> some View {
        let overlay = RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1)
        return view.padding().overlay(overlay)
    }
    
    private var loginButton: some View {
        Button("Log In") { } // TODO: SC - Call actual login functionality
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .foregroundColor(Color(UIColor.systemBackground))
            .background(Color.accentColor)
            .cornerRadius(10)
    }
    
    private var cancelButton: some View {
        Button("Cancel") { dismiss() }
    }
    
    private func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
}


// MARK: - Previews

struct LoginView_Previews: PreviewProvider {
    
    static var previews: some View {
        LoginView()
    }
}
