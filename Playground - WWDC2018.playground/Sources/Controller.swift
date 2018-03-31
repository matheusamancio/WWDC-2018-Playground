import Foundation
import UIKit

public class Controller{
    
    private var scenes: Scenes
    private var intro: Intro
    private var quiz: Quiz
    private var theEnd: TheEnd
    private var view: UIView
    private var viewScene: UIView
    private var viewIntro: UIView
    private var viewQuiz: UIView
    private var viewTheEnd: UIView

    
    public init(view: UIView){

        self.view = UIView()
        self.view.frame.size.height = view.frame.size.height
        self.view.frame.size.width = view.frame.size.width

        self.view = view
        self.intro = Intro()
        self.quiz = Quiz()
        self.theEnd = TheEnd()
        self.scenes = Scenes()
        self.viewIntro = UIView()
        self.viewScene = UIView()
        self.viewQuiz = UIView()
        self.viewTheEnd = UIView()


        self.startIntro()
        self.scenes.goToQuestions = {
            print(#function,"deu certooooo")
            self.changeToQuiz()
        }
        self.scenes.goToTheEnd = {
            print(#function,"go To The End")
            self.changeToTheEnd()
        }
        self.intro.goToScenes = {
            print(#function,"vai pra cena")
            self.changeToScenes()
        }
        self.quiz.goFinalScene = {
            print(#function,"vai pra cena")
            self.changeToScenesEnd()
        }
        self.theEnd.goToScenes = {
            print(#function,"restart scene")
            self.restartScenes()
        }
        
    }
    //start pages
    func startScene(){
        viewScene = scenes.getView()
        self.scenes.startScene(i: 0)
        self.view.addSubview(viewScene)
    }
    
    func startIntro(){
        viewIntro = intro.getView()
        self.intro.startIntro()
        self.view.addSubview(viewIntro)
    }
    
    func startQuiz(){
        viewQuiz = quiz.getView()
        self.quiz.startQuiz()
        self.view.addSubview(viewQuiz)
    }
    
    func startTheEnd(){
        viewTheEnd = theEnd.getView()
        self.theEnd.startTheEnd()
        self.view.addSubview(viewTheEnd)
    }
    
    //change pages
    func changeToScenes(){
        self.viewIntro.removeFromSuperview()
        self.startScene()
    }
    
    func changeToQuiz() {
        startQuiz()
    }
    
    func changeToScenesEnd(){
        self.view.addSubview(viewScene)
        viewQuiz.removeFromSuperview()
        scenes.savingEarth()
    }
    
    func changeToTheEnd(){
        viewScene.removeFromSuperview()
        self.startTheEnd()
    }
    
    func restartScenes(){
        self.viewTheEnd.removeFromSuperview()
        self.startScene()
    }

}


