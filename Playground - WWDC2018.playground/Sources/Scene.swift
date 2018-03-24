import Foundation
import UIKit
public class Scenes{
    
    private var view: UIView
    private var label: UILabel
    private var story: Story
    var changeBackground = 3
    
    
    public init(view: UIView, label: UILabel){
        self.view = view
        self.label = label
        self.story = Story(i: 0)
    }
    
    public func sceneSequency(i: Int){
        let delay = story.chooseDelay(i: i)
        let text = story.chooseTest(i: i)
        self.whichbackgroundColor(i: story.chooseBack(i: i))
        self.fadeOutInLabel(text:text, delay: delay)
        let id = i + 1
        DispatchQueue.main.asyncAfter(deadline: .now() + 4 + delay) {
            self.sceneSequency(i: id)
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

    
    
    func fadeOutInLabel(text: String, delay: TimeInterval){
        UIView.animate(withDuration: 1, animations: {
            self.label.alpha = 0
        }) { (true) in
            self.label.text = text
            UIView.animate(withDuration: 1, delay: delay, options: UIViewAnimationOptions.curveEaseIn, animations: {
                self.label.alpha = 1
            }, completion: nil)
        }
    }
    
}
