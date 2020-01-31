//
//  Ticket.swift
//  FlyMeToTheMoon
//
//  Created by Omar Alibrahim on 1/29/20.
//  Copyright © 2020 Omsi. All rights reserved.
//

import Foundation


struct Ticket
{
    var startDate: String
    var startTime: String
    var endDate: String
    var endTime: String
    var price: Double
    var currency: String
    
    var ticketDetails: TicketDetails?
    
}

struct TicketDetails
{
    var assemblyPoint: String
}
