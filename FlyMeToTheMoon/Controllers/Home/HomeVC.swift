// ViewController
import UIKit
import Firebase

class HomeVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    var tickets: [Ticket] = []
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ref = Firestore.firestore().collection("tickets")
        
        ref.getDocuments { (querySnapshot, error) in
            guard error == nil else
            {
                print("ERROR OCCURED WHILE FETCHING DATA")
                return
            }
            
            guard let query = querySnapshot else
            {
                print("There is no query!")
                return
            }
            // There is query snapshot here
            var tickets: [Ticket] = []
            for doc in query.documents
            {
                print("🎟 Ticket: ", doc.data())
                let dic = doc.data()
                guard let startDate = dic["startDate"] as? String else {return}
                guard let startTime = dic["startTime"] as? String else {return}
                guard let endDate = dic["endDate"] as? String else {return}
                guard let endTime = dic["endTime"] as? String else {return}
                guard let price = dic["price"] as? Double else {return}
                guard let currency = dic["currency"] as? String else {return}


                let ticket = Ticket(startDate: startDate,
                                    startTime: startTime,
                                    endDate: endDate,
                                    endTime: endTime,
                                    price: price,
                                    currency: currency,
                                    ticketDetails: nil)
                tickets.append(ticket)
            }
            self.tickets = tickets
            DispatchQueue.main.async{
                self.tableView.reloadData()
            }
        }
        
        
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tickets.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TicketCell
        cell.configure(ticket: tickets[indexPath.row])
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        190
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView(frame: .zero)
        header.backgroundColor = .clear
        return header
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You have selected \(indexPath.row)")
        performSegue(withIdentifier: "toDetail", sender: indexPath.row)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let vc = segue.destination as? DetailTicketVC{
            if let index = sender as? Int
            {
                vc.ticket = tickets[index]
            }
        }
    }
    
}

