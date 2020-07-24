import Foundation
import UIKit

class GlobalString : NSObject {
    
    func appName() -> String {
        return String("Trivia App")
    }
    func next() -> String {
        return String("NEXT")
    }
    func yourNameQuestion() -> String {
        return String("What is your name?")
    }
    func bestCricketQuestion() -> String {
        return String("Who is the best cricketer in the world?")
    }
    func selectAnyOne() -> String {
        return String("Select any one.")
    }
    func colorsInIndianFlagQuestion() -> String {
        return String("What are the colors in the Indian national flag?")
    }
    func summary() -> String {
        return String("SUMMARY")
    }
    func selectedAnswerDescription() -> String {
        return String("Here are the answers selected:")
    }
    func enterName() -> String {
        return String("Enter Name")
    }
    func enterNameErrorDescription() -> String {
        return String("Please enter your name to continue")
    }
    func cricketerErrorDescription() -> String {
        return String("Please select any cricketer name to continue")
    }
    func colorErrorDescription() -> String {
        return String("Please select more then one colour to continue")
    }
    func history() -> String {
        return String("History")
    }
    func results() -> String {
        return String("Results")
    }
    func playAgain() -> String {
        return String("Play Again")
    }
    func entityName() -> String {
        return String("Game")
    }
    func finish() -> String {
        return String("Finish")
    }
}
