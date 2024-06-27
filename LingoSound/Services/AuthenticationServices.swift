//
//  AuthenticationServices.swift
//  LingoSound
//
//  Created by hieu nguyen on 21/06/2024.
//

import Combine

protocol Authenticationservices {
    
    func getAccounts() -> AnyPublisher<[Account], AuthenticationError>
    func signInByAccountMail() -> AnyPublisher<Account, AuthenticationError>
    func signInByPhone() -> AnyPublisher<Account, AuthenticationError>
    func signInByGmail() -> AnyPublisher<Account, AuthenticationError>
}

class LocalAuthenticationServices: Authenticationservices {
    
    func getAccounts() -> AnyPublisher<[Account], AuthenticationError> {
        return Just([
            Account(id: "1", name: "Nguyen", age: 9, avatar: "avatar_1"),
            Account(id: "2", name: "Trung", age: 9, avatar: "avatar_1"),
            Account(id: "3", name: "Hieu", age: 9, avatar: "avatar_1")])
        .setFailureType(to: AuthenticationError.self)
        .eraseToAnyPublisher()
    }
    
    func signInByAccountMail() -> AnyPublisher<Account, AuthenticationError> {
        return Just(Account(id: "1", name: "Nguyen", age: 9, avatar: "avatar_1"))
            .setFailureType(to: AuthenticationError.self)
            .eraseToAnyPublisher()
    }
    
    func signInByGmail() -> AnyPublisher<Account, AuthenticationError> {
        return Just(Account(id: "1", name: "Nguyen", age: 9, avatar: "avatar_1"))
            .setFailureType(to: AuthenticationError.self)
            .eraseToAnyPublisher()
    }
    
    func signInByPhone() -> AnyPublisher<Account, AuthenticationError> {
        return Just(Account(id: "1", name: "Nguyen", age: 9, avatar: "avatar_1"))
            .setFailureType(to: AuthenticationError.self)
            .eraseToAnyPublisher()
    }
}
