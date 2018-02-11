//
//  EmiratesCSTests.swift
//  EmiratesCSTests
//
//  Created by Haneef Habib on 2/11/18.
//  Copyright © 2018 SIVVI. All rights reserved.
//

import XCTest
@testable import EmiratesCS

class EmiratesCSTests: XCTestCase {
    
    var scorer : BowlingScrorer!
    override func setUp() {
        super.setUp()
         scorer = BowlingScrorer(bowlerName: "haneef")
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testScorer() {
        
        XCTAssertTrue(scorer.getFrameNumber() == 1)
        XCTAssertTrue(scorer.getScoreSoFar() == 0)
        XCTAssertTrue(!scorer.isGameOver())
//        XCTAssertTrue(scorer.getRoll().count == 0)

        scorer.insertBall(2)
        scorer.insertBall(5)


        
        XCTAssertTrue(scorer.getFrameNumber() == 1)
        XCTAssertTrue(scorer.getScoreSoFar() == 0)
        XCTAssertTrue(!scorer.isGameOver())
//        XCTAssertTrue(scorer.getRoll().count == 1)
        
        scorer.insertBall(2)
        scorer.insertBall(8)
        scorer.insertBall(3)

        
        XCTAssertTrue(scorer.getFrameNumber() == 1)
        XCTAssertTrue(scorer.getScoreSoFar() == 0)
        XCTAssertTrue(!scorer.isGameOver())
//        XCTAssertTrue(scorer.getRoll().count == 2)

        
        
        
        scorer.insertBall(10)
        scorer.insertBall(9)
        scorer.insertBall(3)
        
        XCTAssertTrue(scorer.getFrameNumber() == 1)
        XCTAssertTrue(scorer.getScoreSoFar() == 0)
        XCTAssertTrue(!scorer.isGameOver())
//        XCTAssertTrue(scorer.getRoll().count == 3)

    }
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
