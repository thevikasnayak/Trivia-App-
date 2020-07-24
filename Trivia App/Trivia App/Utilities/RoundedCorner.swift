
import Foundation
import UIKit

class RoundedCorner: NSObject {
     // MARK: - Rounded corner with Shadow for UIView
    func shadowEffectWithRoundedCornerUIView(UIView: UIView) {
        UIView.layer.cornerRadius = 10.0
        UIView.layer.masksToBounds = false
        UIView.layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
        UIView.layer.shadowOffset = CGSize(width: 3, height: 3)
        UIView.layer.shadowOpacity = 0.8
    }
     // MARK: - For making image in circle
    func imageInCircle(image: UIImageView) {
        image.layer.cornerRadius = image.frame.size.width/2
        image.clipsToBounds = true
    }
}
