//#-hidden-code

import UIKit
import PlaygroundSupport
var mylabel = UILabel()
var scene: Scenes?

let viewteste = UIView(frame: CGRect(x: 0, y: 0, width: 700, height: 400))
mylabel.frame = CGRect(x: 30, y: 30, width: 400, height: 150)
scene = Scenes(view: viewteste, label: mylabel)
scene?.sceneSequency(i: 0)


//class MyViewController : UIViewController {
//    override func loadView() {
//        mylabel.frame = CGRect(x: 30, y: 30, width: 400, height: 150)
//
//        let view = UIView()
//        self.view = view
//        self.view.frame = CGRect(x: 0, y: 0, width: 320, height: 480)
//
//        scene = Scenes(view: self.view, label: mylabel)
//
//    }
//}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = viewteste
PlaygroundPage.current.needsIndefiniteExecution = true
//#-end-hidden-code
/*:
 ## Hi I'm Earth
 Hi, I'm Earth is a animation, that you will have a day by day conversation with earth.
 ## Prepare the popcorn and your hurt.
 You will need to get involved and Do something in the end
 try and have some fun!
 */

