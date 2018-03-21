//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

extension UIColor{
    class func globeColor() -> UIColor{
        return UIColor(red: 82.0/255.0, green: 239.0/255.0, blue: 247.0/255.0, alpha: 0.14)
    }
    class func waterColor() -> UIColor{
        return UIColor(red: 82.0/255.0, green: 239.0/255.0, blue: 247.0/255.0, alpha: 1)
    }
    class func continentColor() -> UIColor{
        return UIColor(red: 230.0/255.0, green: 255.0/255.0, blue: 148.0/255.0, alpha: 1)
    }
    class func cloudColor() -> UIColor{
        return UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.8)
    }
}

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
        self.setContinent(continent: self.continent1, flag: 1)
        self.setContinent(continent: self.continent2, flag: 2)
    }
    
    func setGlobe(){
        self.globe.frame.size.height = 350
        self.globe.frame.size.width = 350
        self.globe.backgroundColor = UIColor.globeColor()
        self.globe.layer.cornerRadius = self.globe.frame.size.height/2
    }
    func setWater(){
        self.water.frame.size.height = 328
        self.water.frame.size.width = 328
        self.water.backgroundColor = UIColor.waterColor()
        self.water.layer.cornerRadius = self.water.frame.size.height/2
    }
    func setCloud(cloud: UIView){
        cloud.frame.size.height = 94
        cloud.frame.size.width = 242
        cloud.backgroundColor = UIColor.cloudColor()
        cloud.layer.cornerRadius = cloud.frame.size.height/2
    }
    
    func setContinent(continent: UIView, flag: Int){
        if flag == 1{
            continent.frame.size.height = 65
            continent.frame.size.width = 228
        }else{
            continent.frame.size.height = 96
            continent.frame.size.width = 132
        }
        continent.backgroundColor = UIColor.continentColor()
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
        earth.continent1.center = CGPoint(x: 190, y: 240)
        earth.continent2.center = CGPoint(x: 120, y: 360)
        
        view.addSubview(earth.globe)
        view.addSubview(earth.water)
        view.addSubview(earth.continent1)
        view.addSubview(earth.continent2)
        view.addSubview(earth.cloud1)
        view.addSubview(earth.cloud2)
        
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
