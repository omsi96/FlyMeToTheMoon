//
//  NewTicketVC.swift
//  FlyMeToTheMoon
//
//  Created by Omar Alibrahim on 2/1/20.
//  Copyright © 2020 Omsi. All rights reserved.
//

import UIKit

class NewTicketVC: UIViewController {

    @IBOutlet weak var startDateTextField: UITextField!
    @IBOutlet weak var startTimeTextField: UITextField!
    @IBOutlet weak var endDateTextField: UITextField!
    @IBOutlet weak var endTimeTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fields = [startDateTextField, startTimeTextField, endDateTextField, endTimeTextField]
        let pickers: [(UITextField, UIDatePicker)] = fields.map{($0!, UIDatePicker(mode: .date))}
        
        
        pickers.forEach { (field, picker) in
            chainFieldToPicker(field: field, picker: picker)
            picker.addTarget(self, action: #selector(self.datePickerValueChange(_:)), for: .valueChanged)
        }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    @objc func datePickerValueChange(_ sender: UIDatePicker)
    {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        print(sender.date)
    }
}

extension UIDatePicker
{
    convenience init(mode: UIDatePicker.Mode) {
        self.init()
        self.datePickerMode = mode
    }
}

func chainFieldToPicker(field: UITextField, picker: UIDatePicker)
{
     field.inputView = picker
}
