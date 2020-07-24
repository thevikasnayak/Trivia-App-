import Foundation
import UIKit

class ViewPresenter: NSObject {
    
    var storyBoard = UIStoryboard(name: "Main", bundle: nil)
    
    func HomeScreen() -> HomeVC {
        return storyBoard.instantiateViewController(withIdentifier: "homeVC") as! HomeVC
    }
    func CricketerVC() -> CricketerVC {
        return storyBoard.instantiateViewController(withIdentifier: "cricketerVC") as! CricketerVC
    }
    func FlagVC() -> FlagVC {
        return storyBoard.instantiateViewController(withIdentifier: "flagVC") as! FlagVC
    }
    func summaryVC() -> SummaryVC {
        return storyBoard.instantiateViewController(withIdentifier: "summaryVC") as! SummaryVC
    }
    func HistoryVC() -> HistoryVC {
        return storyBoard.instantiateViewController(withIdentifier: "historyVC") as! HistoryVC
    }
}
