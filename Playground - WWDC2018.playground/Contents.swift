//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
let scene = Scene()


public class LabelStyle{

    private var text: Texts
    private var label: UILabel
    
    public init(text: Texts){
        self.text = text
        self.label = UILabel()
        buildLabel()
    }

    private func buildLabel() {
        self.label.text = self.text.getTexts()
        self.label.textColor = self.text.getColor()
        self.label.font = UIFont.systemFont(ofSize: self.text.getSize())
//        label.font = UIFont.systemFont(ofSize: textSize)
//        let amountText = NSMutableAttributedString.init(string: self.text)
//        amountText.setAttributes([NSAttributedStringKey.font: UIFont.systemFont(ofSize: textImpactSize ?? textSize),
//                                  NSAttributedStringKey.foregroundColor: self.textInfoColor ?? textColor],
//                                 range: NSMakeRange(rangetTextInfo?.0 ?? 0, rangetTextInfo?.1 ?? 0))

//        label.attributedText = amountText
    }
    
    public func getLabel() -> UILabel{
        return self.label
    }
}

class MyViewController : UIViewController {
    override func loadView() {
        
        
        let mytext = Texts(i: 1)
        
        let mylabel = LabelStyle(text: mytext).getLabel()
        mylabel.frame = CGRect(x: 30, y: 30, width: 100, height: 100)
        
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
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(MyViewController.goToSecondScene), userInfo: nil, repeats: false)
        Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(MyViewController.goToThirdScene), userInfo: nil, repeats: false)
    }
    @objc func goToSecondScene() {
        scene.secondScene(view: view)
    }
    @objc func goToThirdScene() {
        scene.thirdScene(view: view)
    }
    
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
