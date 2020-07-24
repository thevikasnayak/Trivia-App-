import Foundation

enum DatabaseKeys : String {
    case colours
    case cricketerName
    case date
    case gameNumber
    case name
    
    var key : String {
        switch self {
        // Use Internationalization, as appropriate.
        case .colours: return "colours"
        case .cricketerName: return "cricketerName"
        case .date: return "date"
        case .gameNumber: return "gameNumber"
        case .name: return "name"
            
        }
    }
}
