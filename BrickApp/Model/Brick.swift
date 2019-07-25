

import UIKit

class Brick: UIView {
    var hardness: Int!
    convenience init(){
        self.init(frame: CGRect.zero)
        hardness = Int.random(in: 2...3)
        alpha = CGFloat(hardness)/3.0
       
        
    }
}
