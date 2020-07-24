
import UIKit

class HistoryCell: UITableViewCell {
    
    static let identifier = "historyCell"
    static let cellHeight: CGFloat = 230
    @IBOutlet weak var BGView: UIView!
    @IBOutlet weak var lbl_GameNo: UILabel!
    @IBOutlet weak var lbl_DateAndTime: UILabel!
    @IBOutlet weak var lbl_UserName: UILabel!
    @IBOutlet weak var lbl_CricketerAns: UILabel!
    @IBOutlet weak var lbl_FlagAns: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        RoundedCorner().shadowEffectWithRoundedCornerUIView(UIView: BGView)
    }
}
