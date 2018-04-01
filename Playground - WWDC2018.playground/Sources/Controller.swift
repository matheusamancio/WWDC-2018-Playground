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
        viewScene = scenes.getView()
        viewIntro = intro.getView()
        viewQuiz = quiz.getView()
        viewTheEnd = theEnd.getView()


        self.view.addSubview(viewTheEnd)
        self.view.addSubview(viewQuiz)
        self.view.addSubview(viewScene)
        self.view.addSubview(viewIntro)

    }
    //start pages
    func startScene(){
        viewScene = scenes.getView()
        viewIntro = intro.getView()
        viewQuiz = quiz.getView()
        viewTheEnd = theEnd.getView()
        
        self.view.addSubview(viewTheEnd)
        self.view.addSubview(viewQuiz)
        self.view.addSubview(viewScene)
        self.view.addSubview(viewIntro)
        
        self.scenes.startScene(i: 0)
        self.view.bringSubview(toFront:viewScene)
    }
    
    func startIntro(){
        self.intro.startIntro()
        self.view.bringSubview(toFront:viewIntro)
    }
    
    func startQuiz(){
        self.quiz.startQuiz()
        self.view.bringSubview(toFront:viewQuiz)
    }
    
    func startTheEnd(){
        let sup = self.quiz.getSuplement()
        self.theEnd.startTheEnd(sup: sup)
        self.view.bringSubview(toFront:viewTheEnd)
    }
    
    //change pages
    func changeToScenes(){
        UIView.animate(withDuration: 0.7, animations: {
            self.viewIntro.alpha = 0
        }) { (true) in
        self.viewIntro.removeFromSuperview()
            
            self.startScene()
        }
    }
    
    func changeToQuiz() {
            startQuiz()
    }
    
    func changeToScenesEnd(){
        UIView.animate(withDuration: 0.7, animations: {
            self.viewQuiz.alpha = 0
        }) { (true) in
        self.view.addSubview(self.viewScene)
        self.viewQuiz.removeFromSuperview()
        self.scenes.savingEarth()
            
        }
    }
    
    func changeToTheEnd(){
        UIView.animate(withDuration: 0.7, animations: {
            self.viewScene.alpha = 0
        }) { (true) in
            self.viewScene.removeFromSuperview()
            self.startTheEnd()
        }
    }
    
    func restartScenes(){
        self.viewTheEnd.removeFromSuperview()
        self.startScene()
    }

}


