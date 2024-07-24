import UIKit
extension UIView {
    func roundCorners(presentView: UIView, corners: UIRectCorner, radius: Int = 8) {
        presentView.clipsToBounds = true

        let maskPath1 = UIBezierPath(roundedRect: presentView.bounds,
                                     byRoundingCorners: corners,
                                     cornerRadii: CGSize(width: radius, height: radius))

        let maskLayer1 = CAShapeLayer()
        let rect = presentView.bounds
        maskLayer1.frame = rect
        maskLayer1.path = maskPath1.cgPath
        presentView.layer.mask = maskLayer1
    }
}
