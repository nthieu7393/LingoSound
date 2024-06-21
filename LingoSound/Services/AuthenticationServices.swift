//
//  AuthenticationServices.swift
//  LingoSound
//
//  Created by hieu nguyen on 21/06/2024.
//

import Combine

protocol Authenticationservices {
    
    func getAccounts() -> AnyPublisher<[Account], AuthenticationError>
}

class LocalAuthenticationServices: Authenticationservices {
    
    func getAccounts() -> AnyPublisher<[Account], AuthenticationError> {
        return Just([Account(name: "Nguyen"), Account(name: "Trung"), Account(name: "Hieu")])
            .setFailureType(to: AuthenticationError.self)
            .eraseToAnyPublisher()
    }
}
