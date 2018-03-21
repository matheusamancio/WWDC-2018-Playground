//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport


public class Earth{
    
    var globe: UIView
    var water: UIView
    var cloud1: UIView
    var cloud2: UIView
    var continent1: UIView
    var continent2: UIView
    
    public init(){
        self.globe = UIView()
        self.water = UIView()
        self.cloud1 = UIView()
        self.cloud2 = UIView()
        self.continent1 = UIView()
        self.continent2 = UIView()
        
        self.setGlobe()
        self.setWater()
        self.setCloud(cloud: self.cloud1)
        self.setCloud(cloud: self.cloud2)
        self.setContinent(continent: self.continent1)
        self.setContinent(continent: self.continent2)
    }
    
    func setGlobe(){
        self.globe.frame.size.height = 200
        self.globe.frame.size.width = 200
        self.globe.backgroundColor = UIColor.lightGray
        self.globe.layer.cornerRadius = self.globe.frame.size.height/2
    }
    func setWater(){
        self.water.frame.size.height = 180
        self.water.frame.size.width = 180
        self.water.backgroundColor = UIColor.blue
        self.water.layer.cornerRadius = self.water.frame.size.height/2
    }
    func setCloud(cloud: UIView){
        cloud.frame.size.height = 100
        cloud.frame.size.width = 100
        cloud.backgroundColor = UIColor.red
        cloud.layer.cornerRadius = cloud.frame.size.height/2
    }
    
    func setContinent(continent: UIView){
        continent.frame.size.height = 50
        continent.frame.size.width = 50
        continent.backgroundColor = UIColor.yellow
        continent.layer.cornerRadius = continent.frame.size.height/2
    }
}

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        self.view = view
        let earth = Earth()
        earth.globe.center = CGPoint(x: 190, y: 300)
        earth.water.center = CGPoint(x: 190, y: 300)
        earth.cloud1.center = CGPoint(x: 120, y: 330)
        earth.cloud2.center = CGPoint(x: 260, y: 250)
        earth.continent1.center = CGPoint(x: 260, y: 250)
        earth.continent2.center = CGPoint(x: 120, y: 330)
        
        view.addSubview(earth.globe)
        view.addSubview(earth.water)
        view.addSubview(earth.cloud1)
        view.addSubview(earth.cloud2)
        view.addSubview(earth.continent1)
        view.addSubview(earth.continent2)
        
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
