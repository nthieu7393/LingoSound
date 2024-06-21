//
//  Constants.swift
//  LingoSound
//
//  Created by hieu nguyen on 21/06/2024.
//

import Foundation

enum AuthenticationError: Error {
    
    case accountNotFound
    
    var message: String {
        
        switch self {
            case .accountNotFound: return "Account not found"
        }
    }
}

enum LayoutDimention {
    
    case padding
    
    var value: CGFloat {
        switch self {
            case .padding: return 20
        }
    }
}
