
import UIKit

class HomeVC: GlobalFunctions {
    
    // MARK: - Properties
    @IBOutlet weak var lbl_Question: UILabel!
    @IBOutlet weak var txt_Answer: UITextField!
    @IBOutlet weak var btnNext: UIButton!
    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        ConfigureNavBarTitle(title: GlobalString().enterName())
        lbl_Question.text = GlobalString().yourNameQuestion()
        txt_Answer.underlined()
        setButtonStyle(button: btnNext, title:GlobalString().next())
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(navigate))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: GlobalString().history(), style: .done, target: self, action: #selector(navigate))
    }
    
    @objc func navigate() {
        let dest = ViewPresenter().HistoryVC()
        navigationController?.pushViewController(dest, animated: true)
    }
    
    @IBAction func btnAction_Next(_ sender: UIButton) {
        
        if txt_Answer.text?.isEmpty == true {
            Alert().showErrorAlert(VC: self, message: GlobalString().enterNameErrorDescription(), OK: nil)
        } else {
            let cricketerVC = ViewPresenter().CricketerVC()
            cricketerVC.name = txt_Answer.text ?? ""
            navigationController?.pushViewController(cricketerVC, animated: true)
        }
    }
}
