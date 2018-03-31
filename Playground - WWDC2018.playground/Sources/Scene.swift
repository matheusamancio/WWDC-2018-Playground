import Foundation
import UIKit
public class Scenes{
    
    private var view: UIView
    private var label: UILabel
    private var story: Story
    private var earth: Earth
    public var goToQuestions: (()->())?
    var identifier: Int{
        didSet {
            if identifier == 19{
                goToQuestions?()
            }
        }
    }
    
    var changeBackground = 3
    
    public init(){
        self.identifier = Int()
        self.view = UIView(frame: CGRect(x: 0, y: 0, width: 700, height: 400))
        self.label = UILabel()
        self.story = Story(i: 0)
        self.earth = Earth()
    }
    
    private func buildEarth(){
        let border = self.earth.getBorder()
        let globe = self.earth.getGlobe()
        let water = self.earth.getWater()
        let cloud1 = self.earth.getCloud1()
        let cloud2 = self.earth.getCloud2()
        let continent1 = self.earth.getContinent1()
        let continent2 = self.earth.getContinent2()
        let continentSmoked1 = self.earth.getContinentSmoked1()
        let continentSmoked2 = self.earth.getContinentSmoked2()
        let moon = self.earth.getMoon()

        
        let centerWidth = view.frame.width/2
        let centerHeight = view.frame.height/2
        
        border.center = CGPoint(x: centerWidth, y: centerHeight)
        globe.center = CGPoint(x: centerWidth, y: centerHeight)
        water.center = CGPoint(x: globe.frame.width/2, y: globe.frame.height/2)
        cloud1.center = CGPoint(x: centerWidth + 60, y: centerHeight + 15)
        cloud2.center = CGPoint(x: centerWidth - 60, y: centerHeight - 50)
        continent1.center = CGPoint(x: centerWidth, y: centerHeight - 35)
        continent2.center = CGPoint(x: centerWidth - 40, y: centerHeight + 30)
        continentSmoked1.center = CGPoint(x: centerWidth, y: centerHeight - 35)
        continentSmoked2.center = CGPoint(x: centerWidth - 40, y: centerHeight + 30)
        moon.center = CGPoint(x: centerWidth - 100, y: centerHeight - 100)

        
        self.label.frame = CGRect(x: 30, y: 30, width: 400, height: 150)
        
        globe.layer.masksToBounds = true
        self.view.addSubview(border)
        self.view.addSubview(globe)
        globe.addSubview(water)
        self.view.addSubview(continent1)
        self.view.addSubview(continent2)
        self.view.addSubview(continentSmoked1)
        self.view.addSubview(continentSmoked2)
        self.view.addSubview(cloud1)
        self.view.addSubview(cloud2)
        self.view.addSubview(moon)
        self.view.addSubview(self.label)

        
        earth.moveToLeft(image: cloud1)
        earth.moveToRight(image: cloud2)
        earth.moveMoon(center: self.view.center)
    }
    public func getView() -> UIView{
        return self.view
    }
    
    public func startScene(i: Int){
        buildEarth()
        sceneSequency(i:i)
    }
    
    public func sceneSequency(i: Int){
        identifier = i
        if i <= 19{
            let delay = story.chooseDelay(i: i)
            let text = story.chooseText(i: i)
            let textColor = story.chooseTextColor(i:i)
            let backgroundColor = story.chooseBack(i: i)
            self.whichbackgroundColor(i:backgroundColor)
            self.fadeOutInLabel(text:text, textColor: textColor, delay: delay)
            let id = i + 1
            event(i: i)
            DispatchQueue.main.asyncAfter(deadline: .now() + 3 + delay) {
                self.sceneSequency(i: id)
            }
        }
    }
    
    public func savingEarth(){
        self.label.alpha = 0
        DispatchQueue.main.asyncAfter(deadline: .now() + 3){
            self.earth.saveEarth()
            DispatchQueue.main.asyncAfter(deadline: .now() + 9){
                self.whichbackgroundColor(i:0)
                let text = self.story.chooseText(i: 0)
                let textColor = self.story.chooseTextColor(i:0)
                self.fadeOutInLabel(text:text, textColor: textColor, delay: 3)
            }
        }
    }
    
    func event(i: Int){
        switch i {
        case 5:
            print(#function,"Remove Water")
            earth.removeWater()
        case 10:
            print(#function,"smoke the Continents")
            earth.SmokeContinents()
        case 14:
            print(#function,"Clouds Polution")
            earth.cloudPolution()
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

    

