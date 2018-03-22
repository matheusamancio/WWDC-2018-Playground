import Foundation
import UIKit

public class Scene{
    
    private var backgroundColor: UIColor
    private var labelTextColor: UIColor

    
    public init(){
        self.backgroundColor = UIColor()
        self.labelTextColor = UIColor()
        
        self.firstScene()
    }
    
    public func getBackgroundColor() ->UIColor{
        return self.backgroundColor
    }
    public func getLabelTextColor() ->UIColor{
        return self.backgroundColor
    }
    
    public func firstScene(){
        self.backgroundColor = UIColor.white
        self.labelTextColor = UIColor.black
    }
    public func secondScene(view: UIView){
        UIView.animate(withDuration: 2, delay: 0, options: .curveEaseIn, animations: {
            view.backgroundColor = UIColor.airPolutionBackgroundColor()
            self.labelTextColor = UIColor.white
        }, completion: nil)
        
    }
    
    public func thirdScene(view: UIView){
        UIView.animate(withDuration: 2, delay: 0, options: .curveEaseIn, animations: {
            view.backgroundColor = UIColor.scarcityBackgroundColor()
            self.labelTextColor = UIColor.white
        }, completion: nil)
    }
    
    
    
}
