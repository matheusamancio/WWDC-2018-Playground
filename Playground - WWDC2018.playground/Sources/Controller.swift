import Foundation
import UIKit

public class Controller{
    
    private var scenes: Scenes
    
    public init(view: UIView){
        self.scenes = Scenes(view: view)
        self.scenes.sceneSequency(i: 0)
    }

}


