//#-hidden-code
import AVFoundation
import UIKit
import PlaygroundSupport
public var screenWidth: CGFloat {
    return UIScreen.main.bounds.width
}
public var screenHeight: CGFloat {
    return UIScreen.main.bounds.height
}
let myView = UIView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
myView.backgroundColor = .white
var controller: Controller?
controller = Controller(view:myView)

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

PlaygroundPage.current.liveView = myView

//#-end-hidden-code
/*:
 ## Hi I'm Earth
 "Hi, I'm Earth" is an animation, that you will have a day-by-day conversation with earth.
 ## Prepare the popcorn, prepare your heart, and watch it.

 
 */

