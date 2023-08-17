//
//  File.swift
//  
//
//  Created by HIROKI IKEUCHI on 2023/08/18.
//

import Foundation

struct LicenseItem: Hashable {
    private let uuid = UUID().uuidString
    let file: String
    let title: String
    let text: String
}

extension LicenseItem: Identifiable {
    var id: String { uuid }
}
