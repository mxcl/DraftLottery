import UIKit

extension UIView {
    func allSubviews() -> [UIView] {
        var stack = [self]
        var views = [UIView]()
        while !stack.isEmpty {
            let subviews = stack[0].subviews as [UIView]
            views += subviews
            stack += subviews
            stack.removeAtIndex(0)
        }
        return views
    }
}
