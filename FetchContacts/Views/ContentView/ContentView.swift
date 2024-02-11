//
//  ContentView.swift
//  FetchContacts
//
//  Created by Madalin Zaharia on 11.02.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showContactList = false
    
    var body: some View {
        NavigationView {
            Button {
                showContactList = true
            } label: {
                Text("Show contact list")
            }
            .background(contactListLink)

        }
        .navigationViewStyle(.stack)
    }
    
    private var contactListLink: some View {
        NavigationLink(
            isActive: $showContactList,
            destination: {
                ContactList()
            }, label: {
                EmptyView()
            }
        )
    }
}

#Preview {
    ContentView()
}
