import Foundation
import UIKit

public class Scenes{
    
    private var backgroundColor: UIColor
    
    public init(){
        self.backgroundColor = UIColor()
        self.backgroundColor = UIColor.airPolutionBackgroundColor()
    }
    
    public func getBackgroundColor() ->UIColor{
        return self.backgroundColor
    }
    
    public func changeScene(){
        backgroundColor = UIColor.airPolutionBackgroundColor()
    }
    
    
    
    
}
