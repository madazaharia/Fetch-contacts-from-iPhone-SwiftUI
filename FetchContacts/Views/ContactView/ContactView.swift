//
//  ContactView.swift
//  FetchContacts
//
//  Created by Madalin Zaharia on 11.02.2024.
//

import Contacts
import SwiftUI

struct ContactView: View {

    // Use the property wrapper ensures our view is dismissed if the contact is deleted
    @FetchContact var contact: CNContact?
    @State private var promptForDeletion: Bool = false
    @State private var error: Error?

    // We just pass along the identifier and then lets the property wrapper handle the fetch and observation
    init(identifier: String) {
        _contact = FetchContact(
            idenfifier: identifier,
            keysToFetch: .allExcludingNote
        )
    }

    var body: some View {
        if let contact = contact {
            List {
                ContactInfo(label: "given name", value: contact.givenName)
                ContactInfo(label: "middle name", value: contact.middleName)
                ContactInfo(label: "family name", value: contact.familyName)
                ContactInfo(label: "nickname", value: contact.nickname)
                ContactInfo(label: "company", value: contact.organizationName)
                ContactInfo(label: "department", value: contact.departmentName)
                ContactInfo(label: "job title", value: contact.jobTitle)
            }
            .navigationBarTitle(title)
        } else {
            Text("No contact found.")
                .foregroundColor(.secondary)
        }
    }
    
    private var title: String {
        guard let contact = contact else {
            return "Details"
        }

        return CNContactFormatter.string(from: contact, style: .fullName) ?? "Details"
    }
}

#Preview {
    ContactView(identifier: "")
}
