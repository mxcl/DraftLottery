import UIKit

class YearlessDatePicker: UIDatePicker {
    override func layoutSubviews() {
        super.layoutSubviews()
        removeYearColumn()  // here’s the HACK
        translate()
    }

    private var columns: [UIView] {
        return allSubviews().filter{ NSStringFromClass($0.dynamicType) == "UIPickerColumnView" }
    }

    private func removeYearColumn() {
        if columns.count == 3 {
            columns[2].hidden = true
        }
    }

    var width: CGFloat {
        return columns[0...1].map{ $0.subviews[0].subviews[0].bounds.size.width }.reduce(0, +)
    }

    private func translate() {
        if columns.count >= 2 {
            var t = CGAffineTransformMakeTranslation((bounds.size.width - width) / 4, 0)
            columns[0].transform = t
            columns[1].transform = t
        }
    }
}
