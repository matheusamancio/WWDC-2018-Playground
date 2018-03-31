import Foundation
import UIKit
public class Intro{
    
    private var view: UIView
    private var label: UILabel
    
    
    public init(){
        self.view = UIView()
        self.label = UILabel()
    }
    
    public func startIntro(view: UIView){
        self.buildIntro(view: view)
    }
    private func buildIntro(view: UIView){
        self.view = view
        let centerWidth = view.frame.width/2
        let centerHeight = view.frame.height/2
        self.label.frame = CGRect(x: 30, y: 30, width: 400, height: 150)
        self.label.text = "teste"
        self.label.tintColor = UIColor.black
        self.view.backgroundColor = UIColor.yellow
        self.view.addSubview(self.label)
        
        //        DispatchQueue.main.asyncAfter(deadline: .now() + 1 + delay) {
        //            //chamar pra trocar de tela
        //        }

    }
    

}
