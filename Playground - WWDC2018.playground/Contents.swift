//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
var mylabel = UILabel()
var scene: Scenes?


class MyViewController : UIViewController {
    override func loadView() {
        
        mylabel.frame = CGRect(x: 30, y: 30, width: 400, height: 150)

        
        let view = UIView()
        self.view = view

        scene = Scenes(view: self.view, label: mylabel)
        scene?.sceneSequency(i: 0)
    }

}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
