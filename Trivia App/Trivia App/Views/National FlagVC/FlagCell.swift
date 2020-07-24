
import UIKit

class FlagCell: UITableViewCell {
    
    // MARK: - Properties
    static let identifier = "flagCell"
    @IBOutlet weak var lbl_Name: UILabel!
    
       // MARK: - Init
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }    
}
