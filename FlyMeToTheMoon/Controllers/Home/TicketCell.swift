//
//  TicketCell.swift
//  FlyMeToTheMoon
//
//  Created by Omar Alibrahim on 1/29/20.
//  Copyright © 2020 Omsi. All rights reserved.
//

import UIKit

class TicketCell: UITableViewCell {

    
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var startTimeLabel: UILabel!
    @IBOutlet weak var endDateLabel: UILabel!
    @IBOutlet weak var endTimeLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    
    func configure(ticket: Ticket)
    {
        startDateLabel.text = ticket.startDate
        startTimeLabel.text = ticket.startTime
        endDateLabel.text = ticket.endDate
        endTimeLabel.text = ticket.endTime
        priceLabel.text = "\(ticket.price)"
        currencyLabel.text = ticket.currency
        
    }

}
