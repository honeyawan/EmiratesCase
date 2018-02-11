//
//  ETScorer.swift
//  EmiratesCS
//
//  Created by Haneef Habib on 2/11/18.
//  Copyright © 2018 SIVVI. All rights reserved.
//

import Foundation

class BowlingFrame {
    
    enum Bonus {
        case  strike
        case spare
        case miss
    }
    
    init(startScore: Int, frameNumber: Int, ballScores: [Int]) {
        
        self.startScore = startScore
        self.frameNumber = frameNumber
        self.ballScores = ballScores
    }
    
    let startScore : Int
    let frameNumber : Int
    var ballScores : [Int]
    
    var totalScores : Int {
        return ballScores.reduce(0, +)
    }
    
     func insertScore(score : Int) {
        ballScores.append(score)
    }
    
    var commolativeScore : Int {
        return totalScores + startScore
    }
    
    var frameIsOver : Bool {
        switch bonus {
        case .strike:
            return ballScores.count == 3
        case .spare:
            return ballScores.count == 3
        default:
            return ballScores.count == 2
        }
    }
    
    var bonus : Bonus {
        
        if (ballScores[0] == 10) {
            return Bonus.strike
        }
        else if ballScores[0]+ballScores[1] == 10 {
            return Bonus.spare
        }
        else {
            return Bonus.miss
        }
    }
    
}

class BowlingScrorer {
    
    private var frames = [BowlingFrame]()
    private let bowlerName : String
    var currentFrame = BowlingFrame(startScore: 0, frameNumber: 1, ballScores: [])
    
    init(bowlerName : String) {
        self.bowlerName = bowlerName
        frames.append(currentFrame)
    }
    
    
    func insertBall(_ score : Int) {
        
        currentFrame.insertScore(score: score)
        if currentFrame.ballScores.count > 1 && currentFrame.frameIsOver {
            currentFrame =  BowlingFrame(startScore: currentFrame.commolativeScore, frameNumber: currentFrame.frameNumber + 1, ballScores: [])
            frames.append(currentFrame)
        }
    }
    
    
    func getFrameNumber() -> Int{
        return currentFrame.frameNumber
    }
    
    func getScoreSoFar()-> Int {
        
        var total = 0
        for  frame in frames {
            total = total + frame.totalScores
        }
        return total
    }
    
    
    func isGameOver() -> Bool {
        return (currentFrame.frameNumber == 10 && currentFrame.frameIsOver)
    }
    
    
    func getRoll() -> [Int] {
        if frames.count > 0 {
            let completeFrames = frames.filter{$0.frameIsOver}
            return completeFrames.map{return $0.commolativeScore}
        }
        else {
            return [0]
        }
    }
}
