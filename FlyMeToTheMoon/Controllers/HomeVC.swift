// ViewController
import UIKit
import Firebase

class HomeVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    var tickets: [Ticket] = []
    
    
    @IBOutlet weak var tableView: UITableView!
    
    func successIfTicketIsAvailable(_ tickets : [Ticket])
    {
        print("These are the tickets!", tickets)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        N.getAllTickets(success: { tickets in
            // success
            DispatchQueue.main.async {
                self.tickets = tickets
                self.tableView.reloadData()
            }
        }) {
            // fails
            print("🔥 FAILED")
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

