import Foundation
import UIKit

public class Controller{
    
    private var scenes: Scenes
    private var intro: Intro
    private var view: UIView
    private var viewScene: UIView
    private var viewIntro: UIView
    
    public init(view: UIView){
        self.view = view
        self.intro = Intro()
        self.scenes = Scenes()
        self.viewIntro = UIView()
        self.viewScene = UIView()
        self.startIntro()
        self.scenes.goToQuestions = {
            print(#function,"deu certooooo")
        }
        self.intro.goToScenes = {
            print(#function,"vai pra cena")
            self.changeToScenes()
        }
        
    }
    
    func startScene(){
        viewScene = scenes.getView()
        self.scenes.startScene(i: 16)
        self.view.addSubview(viewScene)
    }
    
    func startIntro(){
        viewIntro = intro.getView()
        self.intro.startIntro()
        self.view.addSubview(viewIntro)
    }
    
    func changeToScenes(){
        viewIntro.removeFromSuperview()
        startScene()
    }
    

}


