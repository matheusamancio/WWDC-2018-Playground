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
        let earth = Earth()
        let globe = earth.getGlobe()
        let water = earth.getWater()
        let cloud1 = earth.getCloud1()
        let cloud2 = earth.getCloud2()
        let continent1 = earth.getContinent1()
        let continent2 = earth.getContinent2()
        
        
        globe.center = CGPoint(x: 190, y: 300)
        water.center = CGPoint(x: 190, y: 300)
        cloud1.center = CGPoint(x: 260, y: 245)
        cloud2.center = CGPoint(x: 120, y: 380)
        continent1.center = CGPoint(x: 190, y: 220)
        continent2.center = CGPoint(x: 120, y: 360)
        
        view.addSubview(globe)
        view.addSubview(water)
        view.addSubview(continent1)
        view.addSubview(continent2)
        view.addSubview(cloud1)
        view.addSubview(cloud2)
        view.addSubview(mylabel)
        
        earth.moveToLeft(image: cloud1)
        earth.moveToRight(image: cloud2)
        
        scene = Scenes(view: self.view, label: mylabel)
        scene?.sceneSequency(i: 0)
    }

}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
