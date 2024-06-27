//
//  CaptionText.swift
//  LingoSound
//
//  Created by hieu nguyen on 23/06/2024.
//

import SwiftUI

struct CaptionText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.custom("NerkoOne-Regular", size: 16))
    }
}

#Preview {
    CaptionText(text: "Preview")
}
