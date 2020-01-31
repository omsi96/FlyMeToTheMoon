//
//  DetailTicketVC.swift
//  FlyMeToTheMoon
//
//  Created by Omar Alibrahim on 1/29/20.
//  Copyright © 2020 Omsi. All rights reserved.
//

import UIKit

class DetailTicketVC: UIViewController {

    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var startTimeLabel: UILabel!
    @IBOutlet weak var endDateLabel: UILabel!
    @IBOutlet weak var endTimeLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    
    @IBOutlet weak var assemblyPoint: UILabel!

    
    var ticket: Ticket!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure(ticket: ticket)
    
    }
    
    func configure(ticket: Ticket)
    {
        startDateLabel.text = ticket.startDate
        startTimeLabel.text = ticket.startTime
        endDateLabel.text = ticket.endDate
        endTimeLabel.text = ticket.endTime
        priceLabel.text = "\(ticket.price)"
        currencyLabel.text = ticket.currency
        
        assemblyPoint.text = ticket.ticketDetails?.assemblyPoint
        

    }
    


}
