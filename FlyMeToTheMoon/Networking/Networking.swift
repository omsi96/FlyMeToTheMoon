//
//  Networking.swift
//  FlyMeToTheMoon
//
//  Created by Omar Alibrahim on 2/5/20.
//  Copyright © 2020 Omsi. All rights reserved.
//

import Foundation
import Firebase
class Networking
{
    
    static func getAllTickets(success: @escaping(([[String: Any]])->Void), fail: @escaping(()->Void)){
        
        let ref = Firestore.firestore().collection("tickets")
        
        ref.getDocuments { querySnapshot, error in
            // Work in another thread
            // 1, Getting rid of errors
            guard error == nil else {
                fail()
                return
            }
            // 2. Making sure there exists a query
            guard let query = querySnapshot else {
                fail()
                return
            }
            // 3. HERE WE ARE ALL SET!
            
            let data = query.documents.map{$0.data()}
            
            success(data)
            
        }
        // success()
        
        // fail()
    }

}
