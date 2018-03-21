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
    var cloud1: UIImageView
    var cloud2: UIImageView
    var continent1: UIImageView
    var continent2: UIImageView
    
    public init(){
        self.globe = UIView()
        self.water = UIView()
        self.cloud1 = UIImageView()
        self.cloud2 = UIImageView()
        self.continent1 = UIImageView()
        self.continent2 = UIImageView()

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
    func setCloud(cloud: UIImageView){
        cloud.frame.size.height = 94
        cloud.frame.size.width = 242
        cloud.image = #imageLiteral(resourceName: "icloud.png")
    }
    
    func setContinent(continent: UIImageView, flag: Int){
        if flag == 1{
            continent.frame.size.height = 65
            continent.frame.size.width = 228
            continent.image = #imageLiteral(resourceName: "icontinent1.png")
        }else{
            continent.frame.size.height = 96
            continent.frame.size.width = 132
            continent.image = #imageLiteral(resourceName: "icontnent2.png")
        }
    }
    
    
    
    func moveToRight(image: UIImageView) {

            UIView.animate(withDuration: 10.3, delay: 0.0, options: [.curveLinear],
                           animations: {image.center.x += 120},
                           completion: {_ in self.moveToLeft(image: image)})
    }
    


func moveToLeft(image: UIImageView) {
    
    UIView.animate(withDuration: 10.7, delay: 0.3, options: [.curveLinear],
                   animations: {image.center.x -= 120},
                   completion: {_ in self.moveToRight(image: image)})
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
        earth.cloud1.center = CGPoint(x: 260, y: 245)
        earth.cloud2.center = CGPoint(x: 120, y: 380)
        earth.continent1.center = CGPoint(x: 190, y: 220)
        earth.continent2.center = CGPoint(x: 120, y: 360)

        
        
        view.addSubview(earth.globe)
        view.addSubview(earth.water)
        view.addSubview(earth.continent1)
        view.addSubview(earth.continent2)
        view.addSubview(earth.cloud1)
        view.addSubview(earth.cloud2)
        earth.moveToRight(image: earth.cloud2)
        earth.moveToLeft(image: earth.cloud1)
        
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
