import UIKit.UILabel
import ObjectiveC.runtime


extension UILabel {
    @objc public override class func load() {
        func swizzle(# from: String, # to: String) {
            let sel1 = NSSelectorFromString(from)
            let sel2 = NSSelectorFromString(to)
            var meth1: Method = class_getInstanceMethod(self, sel1)
            var meth2: Method = class_getInstanceMethod(self, sel2)
            method_exchangeImplementations(meth1, meth2)
        }
        swizzle(from: "setTextColor:", to: "swizzledSetTextColor:")
        swizzle(from: "setFont:", to: "swizzledSetFont:")
    }

    private func shouldOverride() -> Bool {
        let classes = ["UIDatePicker", "UIDatePickerWeekMonthDayView", "UIDatePickerContentView"]

        var view = self.superview
        while view != nil {
            if let className = NSStringFromClass(view!.dynamicType) {
                if contains(classes, className) {
                    return true
                }
            }
            view = view!.superview
        }

        return false
    }

    /**
      Interestingly, making this private prevents swizzling
      which is in fact what you would expect, it’s just that
      us objc devs aren’t used to *real* access control.
     */
    func swizzledSetTextColor(newTextColor: UIColor) {
        swizzledSetTextColor(shouldOverride() ? UIColor.militarySand() : newTextColor)
    }

    func swizzledSetFont(newfont: UIFont!) {
        swizzledSetFont(UIFont(name: FontName, size: newfont?.pointSize ?? 16))
    }
}
