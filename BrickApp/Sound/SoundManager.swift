

import Foundation
import AVFoundation

class SoundManager {
    
    var audioPlayer: AVAudioPlayer?
    
    func playSound(name: String){
        let path: String = Bundle.main.path(forResource: name, ofType: ".mp3")!
        
        let url: URL = URL(fileURLWithPath: path)
        
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        }catch {
            print("loi")
        }
    }
   
}
