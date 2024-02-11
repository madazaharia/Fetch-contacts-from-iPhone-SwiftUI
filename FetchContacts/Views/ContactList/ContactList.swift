//
//  ContactList.swift
//  FetchContacts
//
//  Created by Madalin Zaharia on 11.02.2024.
//

import Contacts
import SwiftUI

struct ContactList: View {
    
    // This is the only code required to fetch your contacts list
    @FetchContactList private var contacts
    
    @State private var selectedContact: CNContact?
    
    init() {
        _contacts = FetchContactList(
            keysToFetch: [
                .type,
                .givenName,
                .familyName,
                .organizationName,
                .phoneNumbers
            ],
            sortOrder: .givenName
        )
    }
    
    var body: some View {
        Group {
            if contacts.isEmpty {
                Text("No contacts available")
                    .foregroundColor(.secondary)
            } else {
                List(contacts, id: \.self) { contact in
                    ContactCell(contact: contact) {
                        selectedContact = contact
                    }
                }
            }
        }
        .navigationBarTitle(Text("Contacts"), displayMode: .inline)
    }
}

#Preview {
    ContactList()
}
