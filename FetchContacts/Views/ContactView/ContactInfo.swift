//
//  ContactInfo.swift
//  FetchContacts
//
//  Created by Madalin Zaharia on 11.02.2024.
//

import Contacts
import SwiftUI

struct ContactInfo: View {
    let label: String
    let value: String

    var body: some View {
        if !value.isEmpty {
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(CNLabeledValue<NSString>.localizedString(forLabel: label))
                        .font(.footnote)
                        .foregroundColor(.primary.opacity(0.8))
                    
                    Text(value)
                }
                .padding(.vertical, 5)

                Spacer(minLength: 0)
            }
        }
    }
}

struct ContactRow_Previews: PreviewProvider {
    static var previews: some View {
        ContactInfo(label: "label", value: "value")
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
