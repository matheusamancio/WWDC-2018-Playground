import Foundation
import UIKit

public class Controller{
    
    private var scenes: Scenes
    private var intro: Intro
    private var quiz: Quiz
    private var view: UIView
    private var viewScene: UIView
    private var viewIntro: UIView
    private var viewQuiz: UIView

    
    public init(view: UIView){
        self.view = view
        self.intro = Intro()
        self.quiz = Quiz()
        self.scenes = Scenes()
        self.viewIntro = UIView()
        self.viewScene = UIView()
        self.viewQuiz = UIView()

        self.startIntro()
        self.scenes.goToQuestions = {
            print(#function,"deu certooooo")
            self.changeToQuiz()
        }
        self.intro.goToScenes = {
            print(#function,"vai pra cena")
            self.changeToScenes()
        }
        self.quiz.goToTheEnd = {
            print(#function,"vai pra cena")
            self.changeToScenesEnd()
        }
        
    }
    
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
    
    func changeToScenes(){
        viewIntro.removeFromSuperview()
        startScene()
    }
    
    func changeToQuiz() {
        viewScene.removeFromSuperview()
        startQuiz()
    }
    
    func changeToScenesEnd(){
        self.view.addSubview(viewScene)
        viewQuiz.removeFromSuperview()
        scenes.savingEarth()
    }

}


