import UIKit

extension UIImage {
    class func launchImage() -> UIImage {
        func name() -> String {
            switch UIScreen.mainScreen().bounds.height {
                case 480: return "LaunchImage-700"
                case 568: return "LaunchImage-700-568h"
                case 667: return "LaunchImage-800-667h"
                case 736: return "LaunchImage-800-Portrait-736h"
            default:
                abort()
            }
        }
        return UIImage(named: name()) ?? UIImage()
    }
}
