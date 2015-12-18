//
//  ViewController.swift
//  ShakeSoundDemo
//
//  Created by user11 on 18/12/2015.
//  Copyright © 2015 user11. All rights reserved.
//

import UIKit
import AVFoundation //TASK 5




class ViewController: UIViewController, AVAudioPlayerDelegate{//TASK 6
    
    
    
    var audioPlayer = AVAudioPlayer()//TASK 8
    
    
    //IBOutlet
    @IBOutlet weak var myLabel: UILabel!
    
    
    
    
    
    /////////////////////TASK 9/////////////////////////////////////////////////////
    //IBAction
    override func motionBegan(motion: UIEventSubtype, withEvent event: UIEvent?) {
        myLabel.text = "It's Shaking Bro.."
        do {
            try playSound("shakesound", fileExtension: "wav")
        }
        catch{
            return
        }
    }//end of func motionBegan
    
    /////////////////////END TASK 9/////////////////////////////////////////////////////

    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    
    
    /////////////////////TASK 7/////////////////////////////////////////////////////
    func playSound(fileName: String, fileExtension: String) throws{
        let dispatchQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
        
        dispatch_async(dispatchQueue, { let mainbundle = NSBundle.mainBundle()
            
            let filePath = mainbundle.pathForResource("\(fileName)", ofType: "\(fileExtension)")
            
            if let path = filePath{
                
                let fileData = NSData(contentsOfFile: path)
                
                do{
                    //start the media player
                    
                    self.audioPlayer = try AVAudioPlayer(data: fileData!)
                    
                    
                    guard let player : AVAudioPlayer? = self.audioPlayer else{
                        return
                    }//END OF GUARD
                    
                    player!.delegate = self
                    if player!.prepareToPlay() && player!.play(){
                    }else{
                        
                    }
                    
                }//end do
                catch{
                    //print("test")
                    return
                }
                
            }//end if
            })
        
        
    }//end of func playsound
    /////////////////////END OF TASK 7//////////////////////////////////////////////


}

