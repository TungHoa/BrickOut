

import UIKit

class Ball: UIView {

    var radius: CGFloat!
    var vx: CGFloat = 1
    var vy: CGFloat = -1
    convenience init(R: CGFloat) {
        self.init(frame: CGRect(x: 0.0, y: 0.0, width: R * 2.0, height: R * 2.0))
        radius = R
        backgroundColor = UIColor.red
        self.layer.cornerRadius = R
    }

}
