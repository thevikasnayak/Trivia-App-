
import Foundation
import UIKit

class GlobalFunctions: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        configureGradientNavBar()
        
        let dismissKeyboard: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboards))
        view.addGestureRecognizer(dismissKeyboard)
        navigationItem.setHidesBackButton(true, animated: true)
    }
    
    @objc func hideKeyboards() {
        view.endEditing(true)
    }
    
    func configureGradientNavBar() {
        guard
            let navigationController = navigationController,
            let flareGradientImage = CAGradientLayer.gradientColour(on: navigationController.navigationBar)
            else {
                print("Error creating gradient color!")
                return
        }
        navigationController.navigationBar.barTintColor = UIColor(patternImage: flareGradientImage)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    func ConfigureNavBarTitle(title: String) {
        let name = UILabel()
        name.text = title.uppercased()
        name.textColor =  .white
        name.textAlignment = .center
        name.font = UIFont.boldSystemFont(ofSize: 20)
        navigationItem.titleView = name
    }
    
    //Making Button rounded corner
    func roundedCornerButton(button: UIButton) {
        button.layer.cornerRadius = button.layer.frame.size.height/2
        button.clipsToBounds = true
        button.layer.borderWidth = 0.8
        button.layer.borderColor = Colors.buttonDark.cgColor
    }
    
    //Making Button Style & Text
    func setButtonStyle(button: UIButton, title: String) {
        button.setTitleColor(.white, for: .normal)
        button.setTitle(title, for: .normal)
        roundedCornerButton(button: button)
        button.layer.borderColor = UIColor.clear.cgColor
        button.setButtonGradientColor()
    }
}

extension CAGradientLayer {
    //applying gradient color on navigation bar
    class func gradientColour(on view: UIView) -> UIImage? {
        let gradient = CAGradientLayer()
        let darkGreen = Colors.buttonDark
        let lightGreen = Colors.buttonLight
        var bounds = view.bounds
        let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        bounds.size.height += window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        
        gradient.frame = bounds
        gradient.colors = [darkGreen.cgColor, lightGreen.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1, y: 0.5)
        return gradient.createGradientImage(on: view)
    }
    
    private func createGradientImage(on view: UIView) -> UIImage? {
        var gradientImage: UIImage?
        UIGraphicsBeginImageContext(view.frame.size)
        if let context = UIGraphicsGetCurrentContext() {
            render(in: context)
            gradientImage = UIGraphicsGetImageFromCurrentImageContext()?.resizableImage(withCapInsets: UIEdgeInsets.zero, resizingMode: .stretch)
        }
        UIGraphicsEndImageContext()
        return gradientImage
    }
}

extension UIView {
    func setGradientBackground(colorOne: UIColor, colorTwo: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        gradientLayer.cornerRadius = 16
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func setButtonGradientColor() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [Colors.buttonDark.cgColor, Colors.buttonLight.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        layer.insertSublayer(gradientLayer, at: 0)
    }
}

//To create UnderLine for Textfield
extension UITextField{
    func underlined(){
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.lightGray.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
}
