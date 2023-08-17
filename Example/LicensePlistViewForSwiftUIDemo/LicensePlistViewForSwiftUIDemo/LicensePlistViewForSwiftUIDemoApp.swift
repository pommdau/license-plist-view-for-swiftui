//
//  LicensePlistViewForSwiftUIDemoApp.swift
//  LicensePlistViewForSwiftUIDemo
//
//  Created by HIROKI IKEUCHI on 2023/08/18.
//

import SwiftUI
import LicensePlistViewForSwiftUI

@main
struct LicensePlistViewForSwiftUIDemoApp: App {
    
    @Environment(\.openWindow) private var openWindow
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .commands {
            CommandGroup(replacing: .help) {
                Button("License") {
                    openWindow(id: WindowID.licensePlistWindow)
                }
            }
        }
                    
        Window("License", id: WindowID.licensePlistWindow) {
            LicensePlistView(bundle: Bundle(url: Bundle.main.url(forResource: "Settings", withExtension: "bundle")!)!)
                .frame(minWidth: 740, minHeight: 650)
        }        
    }
}
