
import UIKit

class CricketerVC: GlobalFunctions {
    
     // MARK: - Array to populate data in tableview
    var cricketerNames = ["Sachin Tendulkar", "Virat Kohli", "Adam Gilchirst", "Jacques Kallis"]
    var cricketerImages = ["SachinTendulkar", "ViratKohli", "AdamGilchirst", "JacquesKallis"]
    
    // MARK: - Properties
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lbl_Question: UILabel!
    @IBOutlet weak var btnNext: UIButton!
    var name = String()
    var selectedCricketerName = String()
    
       // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        ConfigureNavBarTitle(title: "Select any one")
        lbl_Question.text = GlobalString().bestCricketQuestion()
        setButtonStyle(button: btnNext, title:GlobalString().next())
        tableView.separatorStyle = .none
    }
    
    @IBAction func btnAction_Next(_ sender: UIButton) {
        
        if selectedCricketerName.isEmpty {
            Alert().showErrorAlert(VC: self, message: GlobalString().cricketerErrorDescription(), OK: nil)
        } else {
            let flagVC = ViewPresenter().FlagVC()
            flagVC.name = name
            flagVC.cricketerNme = selectedCricketerName
            navigationController?.pushViewController(flagVC, animated: true)
        }
    }
}

// MARK: - UITableView
extension CricketerVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cricketerNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = CricketerCell.identifier
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as! CricketerCell
        cell.img_Image.image = UIImage(named: cricketerImages[indexPath.row])
        cell.lbl_Name.text = cricketerNames[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexPath = tableView.indexPathForSelectedRow!
        let currentCell = tableView.cellForRow(at: indexPath) as! CricketerCell
        selectedCricketerName = currentCell.lbl_Name.text!
    }
}
