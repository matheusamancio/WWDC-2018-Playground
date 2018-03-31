import Foundation
import UIKit

public class Controller{
    
    private var scenes: Scenes
    private var intro: Intro
    private var view: UIView
    
    public init(view: UIView){
        self.view = view
        self.intro = Intro()
        self.scenes = Scenes()
        self.startIntro()
    }
    
    func startScene(){
        self.scenes.startScene(i: 0, view: view)
    }
    
    func startIntro(){
        self.intro.startIntro(view: view)
    }
    

}


