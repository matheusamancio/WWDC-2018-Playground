import Foundation
import UIKit


public class Earth{
    
    private var border: UIView
    private var globe: UIView
    private var water: UIView
    private var cloud1: UIImageView
    private var cloud2: UIImageView
    private var continent1: UIImageView
    private var continent2: UIImageView


    
    public init(){
        self.border = UIView()
        self.globe = UIView()
        self.water = UIView()
        self.cloud1 = UIImageView()
        self.cloud2 = UIImageView()
        self.continent1 = UIImageView()
        self.continent2 = UIImageView()
        
        self.setBorder()
        self.setGlobe()
        self.setWater()
        self.setCloud(cloud: self.cloud1)
        self.setCloud(cloud: self.cloud2)
        self.setContinent(continent: self.continent1, flag: 1)
        self.setContinent(continent: self.continent2, flag: 2)
    }
    
    
    func setBorder(){
        self.globe.frame.size.height = 350
        self.globe.frame.size.width = 350
        self.globe.backgroundColor = UIColor.globeColor()
        self.globe.layer.cornerRadius = self.globe.frame.size.height/2
    }

    func setGlobe(){
        self.globe.frame.size.height = 328
        self.globe.frame.size.width = 328
        self.globe.backgroundColor = UIColor.globeColor()
        self.globe.layer.cornerRadius = self.globe.frame.size.height/2
    }
    
    func setWater(){
        self.water.frame.size.height = 500
        self.water.frame.size.width = 500
        self.water.backgroundColor = UIColor.waterColor()
//        self.water.layer.cornerRadius = self.water.frame.size.height/2
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
    
    public func getBorder() -> UIView{
        return self.border
    }
    public func getGlobe() -> UIView{
        return self.globe
    }
    public func getWater() -> UIView{
        return self.water
    }
    public func getCloud1() -> UIImageView{
        return self.cloud1
    }
    public func getCloud2() -> UIImageView{
        return self.cloud2
    }
    public func getContinent1() -> UIImageView{
        return self.continent1
    }
    public func getContinent2() -> UIImageView{
        return self.continent2
    }
    
    public func moveToRight(image: UIImageView) {
        
        UIView.animate(withDuration: 10.3, delay: 0.0, options: [.curveLinear],
                       animations: {image.center.x += 120},
                       completion: {_ in self.moveToLeft(image: image)})
    }
    
    
    
    public func moveToLeft(image: UIImageView) {
        
        UIView.animate(withDuration: 10.7, delay: 0.3, options: [.curveLinear],
                       animations: {image.center.x -= 120},
                       completion: {_ in self.moveToRight(image: image)})
    }
    
    public func removeWater() {
        UIView.animate(withDuration: 15) {
            self.water.center.y += 500
        }
    }
}
