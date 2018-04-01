import Foundation
import UIKit
public class Scenes{
    
    private var view: UIView
    private var label: UILabel
    private var labelR: UILabel
    private var story: Story
    private var earth: Earth
    public var goToQuestions: (()->())?
    public var goToTheEnd: (()->())?
    var identifier: Int{
        didSet {
            if identifier == 23{
                goToQuestions?()
            }
            if identifier == 30{
                goToTheEnd?()
            }
        }
    }
    
    var changeBackground = 3
    var screenWidth: CGFloat 
    var screenHeight: CGFloat

    
    public init(){
        self.screenWidth = UIScreen.main.bounds.width
        self.screenHeight = UIScreen.main.bounds.height
        self.identifier = Int()
        self.view = UIView(frame: CGRect(x: 0, y: 0, width: self.screenWidth, height: self.screenHeight))
        self.label = UILabel()
        self.labelR = UILabel()
        self.story = Story(i: 0)
        self.earth = Earth()
        self.view.backgroundColor = UIColor.white
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

        
        let centerWidth = view.center.x
        let centerHeight = view.center.y
        
        border.center = CGPoint(x: centerWidth, y: centerHeight/2)
        globe.center = CGPoint(x: centerWidth, y: centerHeight/2)
        water.center = CGPoint(x: globe.frame.width/2, y: globe.frame.height/2)
        cloud1.center = CGPoint(x: centerWidth + 60, y: centerHeight/2 + 15)
        cloud2.center = CGPoint(x: centerWidth - 60, y: centerHeight/2 - 50)
        continent1.center = CGPoint(x: centerWidth, y: centerHeight/2 - 35)
        continent2.center = CGPoint(x: centerWidth - 40, y: centerHeight/2 + 30)
        continentSmoked1.center = CGPoint(x: centerWidth, y: centerHeight/2 - 35)
        continentSmoked2.center = CGPoint(x: centerWidth - 40, y: centerHeight/2 + 30)
        moon.center = CGPoint(x: centerWidth - 100, y: centerHeight - 100)

        
        self.label.frame = CGRect(x: 50, y: 50, width: 600, height: 150)
        self.labelR.frame = CGRect(x: centerWidth + 100, y: centerHeight/2 + 100, width: 250, height: 150)

        self.label.numberOfLines = 2
        
        border.alpha = 0
        globe.alpha = 0
        water.alpha = 0
        continent1.alpha = 0
        continent2.alpha = 0
        cloud1.alpha = 0
        cloud2.alpha = 0
        moon.alpha = 0


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
        self.view.addSubview(self.labelR)


        earth.moveToLeft(image: cloud1)
        earth.moveToRight(image: cloud2)
        earth.moveMoon(center: globe.center)

        UIView.animate(withDuration: 3) {
            border.alpha = 1
            globe.alpha = 1
            water.alpha = 1
            continent1.alpha = 1
            continent2.alpha = 1
            cloud1.alpha = 1
            cloud2.alpha = 1
            moon.alpha = 1
        }
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
        if i <= 23{
            let delay = story.chooseDelay(i: i)
            let text = story.chooseText(i: i)
            let ref = story.chooseReferences(i: i)
            let textColor = story.chooseTextColor(i:i)
            let backgroundColor = story.chooseBack(i: i)
            self.whichbackgroundColor(i:backgroundColor)
            self.fadeOutInLabel(text:text, textColor: textColor, delay: delay, ref: ref)
            let id = i + 1
            event(i: i)
//            DispatchQueue.main.asyncAfter(deadline: .now() + 4 + delay) {
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                self.sceneSequency(i: id)
            }
        }
    }
    
    public func savingEarth(){
        self.label.alpha = 0
        self.labelR.alpha = 0
        DispatchQueue.main.asyncAfter(deadline: .now() + 3){
            self.earth.saveEarth()
            DispatchQueue.main.asyncAfter(deadline: .now() + 6){
                self.whichbackgroundColor(i:0)
                let text = self.story.chooseText(i: 0)
                let ref = self.story.chooseReferences(i: 0)
                let textColor = self.story.chooseTextColor(i:0)
                self.fadeOutInLabel(text:text, textColor: textColor, delay: 3, ref: ref)
                DispatchQueue.main.asyncAfter(deadline: .now() + 8){
                    self.identifier = 30
                }
            }
        }
    }
    
    func event(i: Int){
        switch i {
        case 7:
            print(#function,"Remove Water")
            earth.removeWater()
        case 13:
            print(#function,"smoke the Continents")
            earth.SmokeContinents()
        case 17:
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
    
    
    
    func fadeOutInLabel(text: String, textColor: UIColor, delay: TimeInterval, ref: String){
        UIView.animate(withDuration: 1, animations: {
            self.label.alpha = 0
            self.labelR.alpha = 0
        }) { (true) in
            self.label.text = text
            self.labelR.text = ref
            UIView.animate(withDuration: 1, delay: delay, options: UIViewAnimationOptions.curveEaseIn, animations: {
                self.label.alpha = 1
                self.labelR.alpha = 1
                self.label.textColor = textColor
                self.labelR.textColor = textColor
            }, completion: nil)
        }
    }
    

    
    
}

    

