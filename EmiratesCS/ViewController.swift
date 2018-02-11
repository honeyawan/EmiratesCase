//
//  ViewController.swift
//  EmiratesCS
//
//  Created by Haneef Habib on 2/11/18.
//  Copyright © 2018 SIVVI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let scorer = BowlingScrorer(bowlerName: "haneef")
        scorer.insertBall(10)
        scorer.insertBall(3)
        scorer.insertBall(4)
        
        let frameNumber = scorer.getFrameNumber()
        let totalScore = scorer.getScoreSoFar()
        
        print("Current Frame : \(frameNumber)")
        print("Current Score : \(totalScore)")


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


