

import UIKit

class Brick: UIView {
    var hardness: Int!
    convenience init(){
        self.init(frame: CGRect.zero)
        hardness = Int.random(in: 1...2)
        alpha = CGFloat(hardness)/2.0
       
        
    }
}
