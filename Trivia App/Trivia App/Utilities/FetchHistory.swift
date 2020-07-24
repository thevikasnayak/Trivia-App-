
import Foundation
import UIKit

class FetchHistory {
    
    var name: String?
    var cricketerName: String?
    var date: String?
    var colors: String?
    var number: Int?
    
    internal init(name: String? = nil, cricketerName: String? = nil, date: String? = nil, colors: String? = nil, number: Int? = nil) {
        self.name = name
        self.cricketerName = cricketerName
        self.date = date
        self.colors = colors
        self.number = number
    }
}
