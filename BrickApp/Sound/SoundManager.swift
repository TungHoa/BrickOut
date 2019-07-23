

import Foundation
import AVFoundation

class SoundManager {
    
    var audioPlayer: AVAudioPlayer?
    
    func playSound(_ name: String){
        let path: String = Bundle.main.path(forResource: name, ofType: ".wav")!
        
        let url: URL = URL(fileURLWithPath: path)
        
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        }catch {
            print("loi")
        }
    }
    func gameTheme(){
        playSound("gametheme1")
        audioPlayer?.numberOfLoops = -1
    }
   
}
