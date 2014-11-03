import UIKit


extension ViewController.View {

    func setupUI() {
        intro.numberOfLines = 0
        intro.textColor = UIColor.militarySand()
        intro.attributedText = text()
        intro.font = UIFont(name: FontName, size: 16)

        picker.calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        picker.datePickerMode = .Date
        picker.date = { (calendar: NSCalendar) in
            let components = calendar.components(.YearCalendarUnit | .MonthCalendarUnit | .DayCalendarUnit, fromDate: NSDate())
            components.year = 2012  // a valid leap year
            return calendar.dateFromComponents(components)!
            }(picker.calendar)

        button.cornerRadius = 5
        button.font = UIFont.boldSystemFontOfSize(16)
        button.text = "Start Lottery"
        button.vibrancyEffect = UIVibrancyEffect(forBlurEffect: blur.effect as UIBlurEffect)

        layer.contents = UIImage.launchImage().CGImage
    }

    private func text() -> NSAttributedString {
        let para = NSMutableParagraphStyle()
        para.alignment = .Justified
        para.firstLineHeadIndent = 0.01  // without this the alignment doesn’t take effect

        let txt = "In December 1969 the USA held a lottery to determine which men born between 1944 and 1950 would go to war in Vietnam. Young men were sorted into groups based on their birthdates. Would you have gone to war?"

        return NSAttributedString(string: txt, attributes: [NSParagraphStyleAttributeName: para])
    }

    override func layoutSubviews() {
        let margin: CGFloat = 20.0
        let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.size.height

        let extra = { ()->(CGFloat) in switch UIDevice.model() {
            case .iPhone4: return -7
            case .iPhone6: return 30
            case .iPhone6Plus: return 75
        default:
            return 0
        }}()

        intro.frame = CGRectInset(bounds, margin + 10, margin + statusBarHeight + extra)
        intro.sizeToFit()

        picker.frame.origin.y = CGRectGetMaxY(intro.frame) + margin

        button.center.x = center.x
        button.frame.origin.y = CGRectGetMaxY(picker.frame) + margin
        button.bounds.size.width = picker.width - 40
        button.bounds.size.height = 44

        blur.frame = bounds
    }
}
