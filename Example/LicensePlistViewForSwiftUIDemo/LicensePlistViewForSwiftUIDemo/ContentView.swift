//
//  ContentView.swift
//  LicensePlistViewForSwiftUIDemo
//
//  Created by HIROKI IKEUCHI on 2023/08/18.
//

import SwiftUI
import Algorithms  // Import Sample

struct ContentView: View {
    
    @Environment(\.openWindow) private var openWindow
        
    var body: some View {
        VStack {
            Button("Show License...") {
                openWindow(id: WindowID.licensePlistWindow)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
