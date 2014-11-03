import UIKit

extension UIColor {
    convenience init(_ hex: Int) {
        let red = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((hex & 0xFF00) >> 8) / 255.0
        let blue = CGFloat(hex & 0xFF) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }

    class func militaryDarkGreen() -> UIColor {
        return UIColor(0x414d0b)
    }

    class func militaryLightGreen() -> UIColor {
        return UIColor(0x727a17)
    }

    class func militarySand() -> UIColor {
        return UIColor(red: 0.97, green: 0.86, blue: 0.71, alpha: 1)
    }

    class func militaryOrange() -> UIColor {
        return UIColor(red: 0.66, green: 0.49, blue: 0.36, alpha:1)
    }
}
