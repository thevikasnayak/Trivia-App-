
import UIKit
import CoreData

class SummaryVC: GlobalFunctions {
    
    var getUserName = String()
    var getCricketerName = String()
    var colourArray = [String]()
    
    @IBOutlet weak var lbl_UserName: UILabel!
    @IBOutlet weak var lbl_description: UILabel!
    @IBOutlet weak var lbl_cricketAnswer: UILabel!
    @IBOutlet weak var lbl_cricketQuestion: UILabel!
    @IBOutlet weak var lbl_flagQuestion: UILabel!
    @IBOutlet weak var lbl_flagAnswer: UILabel!
    @IBOutlet weak var btnFinish: UIButton!
    @IBOutlet weak var btnHistory: UIButton!
    
    @IBOutlet weak var BG_Name: UIView!
    @IBOutlet weak var BG_Flag: UIView!
    @IBOutlet weak var BG_Cricket: UIView!
    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        storeDataInCoreData()
    }
    
    func configureUI() {
        ConfigureNavBarTitle(title: GlobalString().summary())
        
        RoundedCorner().shadowEffectWithRoundedCornerUIView(UIView: BG_Flag)
        RoundedCorner().shadowEffectWithRoundedCornerUIView(UIView: BG_Name)
        RoundedCorner().shadowEffectWithRoundedCornerUIView(UIView: BG_Cricket)
        
        setButtonStyle(button: btnHistory, title: GlobalString().history())
        setButtonStyle(button: btnFinish, title: GlobalString().finish())
        
        lbl_UserName.text = "Name: \("\(getUserName)")"
        lbl_description.text = GlobalString().selectedAnswerDescription()
        lbl_flagQuestion.text =  GlobalString().colorsInIndianFlagQuestion()
        lbl_cricketQuestion.text = GlobalString().bestCricketQuestion()
        
        lbl_cricketAnswer.text = "Answer: \("\(getCricketerName)")"
        lbl_flagAnswer.text = "Answer: \(colourArray)"
    }
    
    func storeDataInCoreData() {
        
        //Getting date
        let date = Date()
        let df = DateFormatter()
        df.dateFormat = "dd MMM HH:mm a"
        let dateString = df.string(from: date)
        
        let convertedArray = "\"\(colourArray)\""
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let manageContext = appDelegate.persistentContainer.viewContext
        let gameEntity = NSEntityDescription.entity(forEntityName: GlobalString().entityName(), in: manageContext)!
        let gameDetails = NSManagedObject(entity: gameEntity, insertInto: manageContext)
        
        //Getting count of the previous data
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: GlobalString().entityName())
        do {
            let count = try manageContext.count(for: fetchRequest)
            gameDetails.setValue(count + 1, forKey: DatabaseKeys.gameNumber.key)
        } catch {
            print(error.localizedDescription)
        }
        
        gameDetails.setValue(getUserName, forKey: DatabaseKeys.name.key)
        gameDetails.setValue(getCricketerName, forKey: DatabaseKeys.cricketerName.key)
        gameDetails.setValue(convertedArray, forKey: DatabaseKeys.colours.key)
        gameDetails.setValue(dateString, forKey: DatabaseKeys.date.key)
        
        do {
            try manageContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo) ")
        }
    }
    
    @IBAction func btnAction_Finish(_ sender: UIButton) {
        let dest = ViewPresenter().HomeScreen()
        navigationController?.pushViewController(dest, animated: true)
    }
    @IBAction func btnAction_History(_ sender: UIButton) {
        let dest = ViewPresenter().HistoryVC()
        navigationController?.pushViewController(dest, animated: true)
    }
}
