import UIKit

class CricketerCell: UITableViewCell {
    
    // MARK: - Properties
    static let identifier = "cricketerCell"
    @IBOutlet weak var BGView: UIView!
    @IBOutlet weak var img_Image: UIImageView!
    @IBOutlet weak var lbl_Name: UILabel!
    
       // MARK: - Init
    override func awakeFromNib() {
        super.awakeFromNib()
        RoundedCorner().shadowEffectWithRoundedCornerUIView(UIView: BGView)
        RoundedCorner().imageInCircle(image: img_Image)
    }
}
