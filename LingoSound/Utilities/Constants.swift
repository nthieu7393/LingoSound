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

enum AvatarName: String {
    
    case avatar_1
    case avatar_2
    case avatar_3
    case avatar_4
    case avatar_5
    case avatar_6
    case avatar_7
    case avatar_8
    case avatar_9
    case avatar_10
}

enum LayoutDimention {
    
    case padding
    
    var value: CGFloat {
        switch self {
            case .padding: return 20
        }
    }
}
