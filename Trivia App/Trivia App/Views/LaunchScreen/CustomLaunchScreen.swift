
import UIKit

class CustomLaunchScreen: UIViewController {
    
    // MARK: - Properties
    @IBOutlet weak var img_appIcon: UIImageView!
    @IBOutlet weak var lbl_appTitle: UILabel!
    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Calling dealy function on particular given time.
        Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(dealy), userInfo: nil, repeats: false)
        
        navigationController?.isNavigationBarHidden = true
        configureUI()
    }
    
    // configuring the UI
    func configureUI() {
        img_appIcon.image = UIImage(named: "AppLogo")
        lbl_appTitle.text = GlobalString().appName()
        view.setButtonGradientColor()
    }
    
    // MARK: - Handlers
    @objc func dealy() {
        let homeVC = ViewPresenter().HomeScreen()
        navigationController?.isNavigationBarHidden = false
        navigationController?.pushViewController(homeVC, animated: true)
    }
}

