//#-hidden-code
import AVFoundation
import UIKit
import PlaygroundSupport

let viewteste = UIView(frame: CGRect(x: 0, y: 0, width: 700, height: 400))
var controller: Controller?
controller = Controller(view:viewteste)
viewteste.center



var backgroundMusicPlayer = AVAudioPlayer()

var player: AVAudioPlayer?
func playSound() {
    let url = Bundle.main.url(forResource: "PianoSolo", withExtension: "mp3")!
    
    do {
        player = try AVAudioPlayer(contentsOf: url)
        guard let player = player else { return }
        player.prepareToPlay()
        player.play()
        
    } catch let error {
        print(error.localizedDescription)
    }
}
playSound()


//class MyViewController : UIViewController {
//    override func loadView() {
//        mylabel.frame = CGRect(x: 30, y: 30, width: 400, height: 150)
//
//        let view = UIView()
//        self.view = view
//        self.view.frame = CGRect(x: 0, y: 0, width: 320, height: 480)
//
//        scene = Scenes(view: self.view, label: mylabel)
//
//    }
//}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = viewteste
PlaygroundPage.current.needsIndefiniteExecution = true
//#-end-hidden-code
/*:
 ## Hi I'm Earth
 Hi, I'm Earth is a animation, that you will have a day by day conversation with earth.
 ## Prepare the popcorn and your hurt.
 You will need to get involved and Do something in the end
 try and have some fun!
 */

