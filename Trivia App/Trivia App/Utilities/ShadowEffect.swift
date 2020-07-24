
import Foundation
import UIKit

class RoundedCorner: NSObject {
    
    func shadowEffectWithRoundedCornerUIView(UIView: UIView) {
        UIView.layer.cornerRadius = 10.0
        UIView.layer.masksToBounds = false
        UIView.layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
        UIView.layer.shadowOffset = CGSize(width: 3, height: 3)
        UIView.layer.shadowOpacity = 0.8
    }
    
    //Making ImageView round
    func imageInCircle(image: UIImageView) {
        image.layer.cornerRadius = image.frame.size.width/2
        image.clipsToBounds = true
    }
}
