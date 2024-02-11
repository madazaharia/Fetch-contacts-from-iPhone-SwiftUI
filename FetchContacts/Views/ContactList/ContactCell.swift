//
//  ContactCell.swift
//  FetchContacts
//
//  Created by Madalin Zaharia on 11.02.2024.
//

import Contacts
import SwiftUI

struct ContactCell: View {
    
    let contact: CNContact
    
    @State private var showContact: Bool = false
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
            showContact = true
        } label: {
            if contact.contactType == .person {
                HStack {
                    Image(systemName: "person.crop.circle")
                        .foregroundColor(.accentColor)
                    
                    Text(contact.givenName)
                        .fontWeight(.semibold)
                    + Text(" " + contact.familyName)
                }
            } else {
                HStack {
                    Image(systemName: "building.2.crop.circle")
                        .foregroundColor(.accentColor)
                    
                    Text(contact.organizationName)
                        .fontWeight(.bold)
                }
            }
        }
        .background(
            NavigationLink(
                isActive: $showContact,
                destination: {
                    ContactView(identifier: contact.identifier)
                },
                label: { EmptyView() }
            )
        )
    }
}
