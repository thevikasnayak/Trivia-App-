
import UIKit

class FlagVC: GlobalFunctions {
    
    // MARK: - Array to set & get from the tableview
    var flagColor = ["White", "Yellow", "Orange", "Green"]
    var selectedArr = [String]()
    
    // MARK: - Properties
    @IBOutlet weak var lbl_Question: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnNext: UIButton!
    
    var name = String()
    var cricketerNme = String()
    
     // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        ConfigureNavBarTitle(title: "Flag Color")
        lbl_Question.text = GlobalString().colorsInIndianFlagQuestion()
        setButtonStyle(button: btnNext, title:GlobalString().next())
        tableView.tableFooterView = UIView()
        tableView.allowsMultipleSelection = true
        tableView.allowsMultipleSelectionDuringEditing = true
    }
    
    @IBAction func btnAction_Next(_ sender: UIButton) {
        if selectedArr.count <= 1 {
            Alert().showErrorAlert(VC: self, message: GlobalString().colorErrorDescription(), OK: nil)
        } else {
            let dest = ViewPresenter().summaryVC()
            dest.getUserName = name
            dest.getCricketerName = cricketerNme
            dest.colourArray = selectedArr
            navigationController?.pushViewController(dest, animated: true)
        }
    }
}

// MARK: - UITableView
extension FlagVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flagColor.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = FlagCell.identifier
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as! FlagCell
        cell.lbl_Name.text = flagColor[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cell = tableView.cellForRow(at: indexPath) as! FlagCell
        guard let item = cell.lbl_Name.text else { return }
        if cell.accessoryType == .checkmark {
            cell.accessoryType = .none
            // UnCheckmark to Remove from array
            if let index = selectedArr.firstIndex(of: item) {
                selectedArr.remove(at: index)
            }
        } else {
            // Checkmark to add in array
            cell.accessoryType = .checkmark
            self.selectedArr.append(item)
        }
    }
}
