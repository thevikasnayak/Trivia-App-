
import Foundation
import UIKit

class Alert: NSObject {
     // MARK: - Error Alert
    func showErrorAlert(VC : UIViewController, message: String, OK: ((UIAlertAction) -> Void)? ) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: OK))
        alert.view.backgroundColor = UIColor.white
        alert.view.layer.cornerRadius = 10
        VC.present(alert, animated: true)
    }
}
