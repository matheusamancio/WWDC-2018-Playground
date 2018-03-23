//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
let scene = Scene()
var mylabel = UILabel()
let text = Texts(i: 0)



class MyViewController : UIViewController {
    override func loadView() {
        
        mylabel.frame = CGRect(x: 30, y: 30, width: 400, height: 150)
        
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
        view.addSubview(mylabel)
        
        earth.moveToLeft(image: cloud1)
        earth.moveToRight(image: cloud2)
        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(MyViewController.goToFirstSentence), userInfo: nil, repeats: false)
        startAnimation()
    }
    
    
    func startAnimation(){
        var time: TimeInterval = 6
        Timer.scheduledTimer(timeInterval: time, target: self, selector: #selector(MyViewController.goToPatternSentence), userInfo: nil, repeats: false)
        time = time + 4
    }
    
    
    @objc func goToFirstSentence() {
        fadeOutIn(text: text)
    }
    @objc func goToPatternSentence() {
       text.nextSentence()
        fadeOutIn(text: text)
        
    }

    @objc func goToSixthScene() {
        mylabel.fadeOut(duration: 1)
        scene.secondScene(view: view)
    }
    
    func fadeOutIn(text: Texts){
//        mylabel.fadeOut(duration: 1)
//        let lbl = LabelBuilder(text: text)
//        mylabel.attributedText = lbl.getLabel().attributedText
//        mylabel.textColor = lbl.getLabel().textColor
//        mylabel.fadeIn(duration: 1)

        UIView.animate(withDuration: 1, animations: {
            mylabel.alpha = 0
        }) { (true) in
            let lbl = LabelBuilder(text: text)
            mylabel.attributedText = lbl.getLabel().attributedText
            mylabel.textColor = lbl.getLabel().textColor
            UIView.animate(withDuration: 1) {
                mylabel.alpha = 1
                self.startAnimation()
            }
        }
    }
    
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
