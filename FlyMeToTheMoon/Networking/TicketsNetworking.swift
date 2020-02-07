//
//  TicketsNetworking.swift
//  FlyMeToTheMoon
//
//  Created by Omar Alibrahim on 2/5/20.
//  Copyright © 2020 Omsi. All rights reserved.
//

import Foundation
import Firebase
import CodableFirebase


class N{
    static func getAllTickets(success: @escaping ([Ticket]) -> (), fail: @escaping ()->())
    {
        let ref = Firestore.firestore().collection("tickets")
        
        
        
        ref.getDocuments { (querySnapshot, error) in
            guard error == nil else {
                // error happens
                fail()
                return
            }
            guard let querySnapshot = querySnapshot else {
                // data doesn't exist
                fail()
                return
            }
            
            let data = querySnapshot.documents.map{$0.data()}
            
            //
            // 100% sure it is success
            // prepare tickets
            
            let decodedData = try! FirebaseDecoder().decode([Ticket].self, from: data)
            
            success(decodedData)
            
        }
    }
}
