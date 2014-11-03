import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // we have to run our load() manually, as seemingly there's a bug
        // or something and the runtime doesn't run the Swift equivalent
        // even though we declare it @objc
        UILabel.load()

        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window!.rootViewController = ViewController()
        window!.backgroundColor = UIColor.militaryDarkGreen()
        window!.tintColor = UIColor.militarySand()
        window!.makeKeyAndVisible()
        return true
    }
}


let FontName = "AmericanTypewriter"


extension UIFont {
    class func systemFontOfSize(size: CGFloat) -> UIFont {
        return UIFont(name: FontName, size: size)!
    }
    class func boldSystemFontOfSize(size: CGFloat) -> UIFont {
        return UIFont(name: "\(FontName)-Bold", size: size)!
    }
}
