import UIKit

class ViewController: UIViewController {

    class View: UIView {
        let picker: YearlessDatePicker
        let button: AYVibrantButton
        let intro: UILabel
        let blur: UIVisualEffectView

        required init(coder: NSCoder) {
            intro = UILabel()
            picker = YearlessDatePicker(frame: CGRectZero)
            blur = UIVisualEffectView(effect: UIBlurEffect(style: .Dark))
            button = AYVibrantButton(frame: CGRectZero, style: AYVibrantButtonStyleInvert)

            super.init(frame: CGRectZero)
            addSubview(blur)
            addSubview(intro)
            addSubview(picker)
            blur.contentView.addSubview(button)

            setupUI()  // @see ViewController.View.swift
        }
    }

    override func loadView() {
        let view = View(coder: NSCoder())
        view.button.addTarget(self, action: "draw", forControlEvents: .TouchUpInside)
        self.view = view
    }

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .BlackOpaque;
    }

    func draw() {
        let ticket = LotteryTicket(birthday: (view as View).picker.date)
        let alert = UIAlertView()

        if ticket.deployed {
            alert.title = "Congratulations"
            alert.message = "The 1969 draft lottery is complete. Your name was the \(ticket.order.ordinalizedString) to be pulled."
            alert.addButtonWithTitle("Report For Duty")
        } else {
            alert.title = "Close Call"
            alert.message = "The highest number that went to war was 195. Your ticket was \(ticket.order); you did not go to war."
            alert.addButtonWithTitle("Lucky")
        }
        alert.show()
    }
}
