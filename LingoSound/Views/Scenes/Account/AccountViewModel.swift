//
//  AccountViewModel.swift
//  LingoSound
//
//  Created by hieu nguyen on 21/06/2024.
//

import Foundation
import Combine

class AccountViewModel: ObservableObject {
    
    private var authenticationService: Authenticationservices?
    
    private var cancelables = Set<AnyCancellable>()
    
    init(authenticationService: Authenticationservices) {
        self.authenticationService = authenticationService
    }
    
    @Published var accounts: [Account] = []
    
    func getAccounts() {
        authenticationService?.getAccounts().sink(receiveCompletion: { completion in
            switch completion {
            case .finished:
                print("")
            case .failure(let error) :
                print("")
            }
        }, receiveValue: { accounts in
            self.accounts = accounts
        }).store(in: &cancelables)
        
    }
}
