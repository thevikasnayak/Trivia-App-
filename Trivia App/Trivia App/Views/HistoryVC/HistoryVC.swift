
import UIKit
import CoreData

class HistoryVC: GlobalFunctions {
    
    var history = [FetchHistory]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fatchHistoryOfGame()
        configureUI()
    }
    
    func configureUI() {
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        ConfigureNavBarTitle(title: GlobalString().results())
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: GlobalString().playAgain(), style: .done, target: self, action: #selector(navigate))
    }
    
    @objc func navigate() {
        let dest = ViewPresenter().HomeScreen()
        navigationController?.pushViewController(dest, animated: true)
    }
    
    func fatchHistoryOfGame() {
        history.removeAll()
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let manageContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: GlobalString().entityName())
        
        do {
            let result = try manageContext.fetch(fetchRequest)
            for data in result as! [NSManagedObject] {
                let name: String = data.value(forKey: DatabaseKeys.name.key) as! String
                let cricketerName: String = data.value(forKey: DatabaseKeys.cricketerName.key) as! String
                let colours: String = data.value(forKey: DatabaseKeys.colours.key) as! String
                let number: Int = data.value(forKey: DatabaseKeys.gameNumber.key) as! Int
                let date: String = data.value(forKey: DatabaseKeys.date.key) as! String
                
                let historyData = FetchHistory(name: name, cricketerName: cricketerName, date: date, colors: colours, number: number)
                self.history.append(historyData)
                
                self.tableView.reloadData()
            }
        } catch {
            print("Failed")
        }
    }
}

extension HistoryVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = HistoryCell.identifier
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as! HistoryCell
        
        let historyList : FetchHistory
        historyList = history[indexPath.row]
        
        let count = (historyList.number! - 1)
        
        cell.lbl_GameNo.text = "Game: \(count)"
        cell.lbl_FlagAns.text = historyList.colors
        cell.lbl_UserName.text = historyList.name
        cell.lbl_CricketerAns.text = historyList.cricketerName
        cell.lbl_DateAndTime.text = historyList.date
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return HistoryCell.cellHeight
    }
}
