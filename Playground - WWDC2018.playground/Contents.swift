//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
        
        let scene = Scenes()
        
        
        let view = UIView()
        view.backgroundColor = scene.getBackgroundColor()
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
        earth.moveToLeft(image: cloud1)
        earth.moveToRight(image: cloud2)
        
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
