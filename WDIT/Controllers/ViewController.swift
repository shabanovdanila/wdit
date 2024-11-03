import UIKit

class ViewController: UIViewController {

    var dateDay = DateDay(date: "12.10.2003", info: "LVALLLBLALBAL")
    
    let dateClient = DateClient()
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var infoDateLabel: UILabel!
    
    @IBAction func buttonTap(_ sender: UIButton) {
        Task { @MainActor in
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd-MM-yyyy"
            dateDay.date = dateFormatter.string(from: datePicker.date)
            dateDay.info = try await dateClient.getDate(date: dateDay.date)
            displayDate(date: dateDay)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    func displayDate(date: DateDay) {
        dateLabel.text = date.date
        infoDateLabel.text = date.info
    }

}

