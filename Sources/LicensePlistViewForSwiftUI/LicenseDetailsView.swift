//
//  LicenseDetailsView.swift
//  
//
//  Created by HIROKI IKEUCHI on 2023/08/18.
//

import SwiftUI

struct LicenseDetailsView: View {
    
    let text: String
    
    var body: some View {
        ScrollView {
            HStack {
                Text(text)
                    .foregroundColor(.secondary)
                    .padding()
                    .textSelection(.enabled)
                Spacer()
            }
        }
    }
}

struct LicenseDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        LicenseDetailsView(text: sampleText)
    }
}

private let sampleText = """
MIT License

Copyright (c) 2017 Masayuki Ono

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

"""
