//
//  SwiftUIView.swift
//  
//
//  Created by HIROKI IKEUCHI on 2023/08/18.
//

import SwiftUI

public struct LicensePlistView: View {
    
    @State private var licenseItems = [LicenseItem]()
    @State private var selectedLicenseItem: LicenseItem?
    
    let bundle: Bundle
    
    public var body: some View {
        NavigationSplitView {
            List(licenseItems, selection: $selectedLicenseItem) { item in
                NavigationLink(value: item) {
                    Text(item.title)
                        .padding(4)
                }
            }
        } detail: {
            LicenseDetailsView(text: selectedLicenseItem?.text ?? "")
                .navigationTitle("License")
        }
        .onAppear() {
            guard let licenseItems = Self.load(withSettingsBundle: bundle) else {
                return
            }
            self.licenseItems = licenseItems
            self.selectedLicenseItem = licenseItems.first
        }
    }
    
    public init(bundle: Bundle) {
        self.bundle = bundle        
    }
}


extension LicensePlistView {
    private static func load(withSettingsBundle bundle: Bundle) -> [LicenseItem]? {
        guard
            let licensePlist = bundle.url(forResource: "com.mono0926.LicensePlist", withExtension: "plist"),  // 各ライセンスの名前と詳細のパスの情報の一覧
            let licensePlistContents = NSDictionary(contentsOf: licensePlist),
            let licenseList = licensePlistContents["PreferenceSpecifiers"] as? [[AnyHashable: Any]]
        else {
            return nil
        }

        return licenseList.compactMap { (license) -> LicenseItem? in
            guard
                let licenseDetailsPlistPath = license["File"] as? String,  // e.g. "com.mono0926.LicensePlist/APIKit"
                let licenseTitle = license["Title"] as? String,  // e.g. "APIKit"
                let licenseDetailsPlist = bundle.url(forResource: licenseDetailsPlistPath, withExtension: "plist"),
                let licenseDetailsPlistContents = NSDictionary(contentsOf: licenseDetailsPlist),
                let licenseDetailsPlistDict = licenseDetailsPlistContents["PreferenceSpecifiers"] as? [[AnyHashable: Any]],
                let licenseText = licenseDetailsPlistDict.first?["FooterText"] as? String
            else {
                return nil
            }
            return LicenseItem(file: licenseDetailsPlistPath,
                               title: licenseTitle,
                               text: licenseText)
        }
    }
}
