import Foundation
import UIKit
public class Scenes{
    
    private var view: UIView
    private var label: UILabel
    private var story: Story
    private var earth: Earth
    var changeBackground = 3
    
    
    public init(view: UIView, label: UILabel){
        self.view = view
        self.label = label
        self.story = Story(i: 0)
        self.earth = Earth()
        buildEarth()
    }
    
    private func buildEarth(){
        let border = self.earth.getBorder()
        let globe = self.earth.getGlobe()
        let water = self.earth.getWater()
        let cloud1 = self.earth.getCloud1()
        let cloud2 = self.earth.getCloud2()
        let continent1 = self.earth.getContinent1()
        let continent2 = self.earth.getContinent2()
        
        border.center = CGPoint(x: 190, y: 300)
        globe.center = CGPoint(x: 190, y: 300)
        water.center = CGPoint(x: globe.frame.height/2, y: globe.frame.width/2)
        cloud1.center = CGPoint(x: 260, y: 245)
        cloud2.center = CGPoint(x: 120, y: 380)
        continent1.center = CGPoint(x: 190, y: 220)
        continent2.center = CGPoint(x: 120, y: 360)
        
        globe.layer.masksToBounds = true
        self.view.addSubview(border)
        self.view.addSubview(globe)
        globe.addSubview(water)
        self.view.addSubview(continent1)
        self.view.addSubview(continent2)
        self.view.addSubview(cloud1)
        self.view.addSubview(cloud2)
        self.view.addSubview(self.label)
        
        earth.moveToLeft(image: cloud1)
        earth.moveToRight(image: cloud2)

                
    }
    
    public func sceneSequency(i: Int){
        let delay = story.chooseDelay(i: i)
        let text = story.chooseText(i: i)
        let textColor = story.chooseTextColor(i:i)
        let backgroundColor = story.chooseBack(i: i)
        self.whichbackgroundColor(i:backgroundColor)
        self.fadeOutInLabel(text:text, textColor: textColor, delay: delay)
        let id = i + 1
        event(i: i)
        DispatchQueue.main.asyncAfter(deadline: .now() + 4 + delay) {
            self.sceneSequency(i: id)
        }
    }
    func event(i: Int){
        switch i {
        case 5:
            earth.removeWater()
        case 10:
            print(#function,"case 10")
        case 14:
            print(#function,"case 14")
        default:
            print(#function,"default")
        }
        
    }
    func whichbackgroundColor(i:Int){
        if changeBackground !=  i{
            switch i {
            case 0:
                self.view.fadeInColor(duration: 2, color: UIColor.white)
                changeBackground = 0
            case 1:
                self.view.fadeInColor(duration: 2, color: UIColor.scarcityBackgroundColor())
                changeBackground = 1
            case 2:
                self.view.fadeInColor(duration: 2, color: UIColor.airPolutionBackgroundColor())
                changeBackground = 2
            default:
                self.view.fadeInColor(duration: 2, color: UIColor.white)
            }
        }
    }
    
    
    
    func fadeOutInLabel(text: String, textColor: UIColor, delay: TimeInterval){
        UIView.animate(withDuration: 1, animations: {
            self.label.alpha = 0
        }) { (true) in
            self.label.text = text
            UIView.animate(withDuration: 1, delay: delay, options: UIViewAnimationOptions.curveEaseIn, animations: {
                self.label.alpha = 1
                self.label.textColor = textColor
            }, completion: nil)
        }
    }
    
}
