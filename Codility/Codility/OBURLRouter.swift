//
//  OBURLRouter.swift
//  Codility
//
//  Created by Кирилл Володин on 15.09.17.
//  Copyright © 2017 Кирилл Володин. All rights reserved.
//

import Foundation

class OBURLRouter {
    
    static let baseURL = "https://api.open.ru"
    
    static let getCreditCardsInfoURL = "\(baseURL)/creditcardinfo/1.0.0/CreditCards/info"
    static let getCreditCardsCallbackURL = "\(baseURL)/creditcardinfo/1.0.0/CreditCards/callback"
    
    static let getCreditsInfoURL = "\(baseURL)/creditinfo/1.0.0/Credits/info"
    
    static let getDepositsInfoURL = "\(baseURL)/getdepositinfo/1.0.0/Deposits/info"
    
}
