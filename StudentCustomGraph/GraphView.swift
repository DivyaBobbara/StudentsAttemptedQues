//
//  GraphView.swift
//  StudentCustomGraph
//
//  Created by Naga Divya Bobbara on 26/08/22.
//

import Foundation
import UIKit
class GraphView : UIView{

    let greenColor : UIColor = .green
    let orangeColor : UIColor = .systemOrange
    let cyanColor : UIColor = .cyan
    let yellowColor : UIColor = .yellow
    let pinkColor : UIColor = .systemPink
    let defaultSize : Int = 40
    let correctAnsRectHeight : CGFloat = 60
    let remainingRectHeight : CGFloat = 50
    var  initialXPosition : CGFloat = 10
   
    let downHeight : CGFloat = 10

    var studentResult : Student?

    override func draw(_ rect: CGRect) {

        let correctAnswersRect = UIBezierPath()
        
        let drawSizeCorrectAnsRect = CGSize(width:  ((defaultSize + 10) + (studentResult?.correctAnswers ?? 0)), height: 100)
        let drawSize = CGSize(width: defaultSize + 10 + (studentResult?.correctAnswers ?? 0), height: 100)
        let drawSizeSkippedVisitedRect = CGSize(width:  defaultSize + (studentResult?.skippedVisited ?? 0), height: 100)
        let drawSizePartiallyCrtRect = CGSize(width:  defaultSize + (studentResult?.partiallyCorrect ?? 0), height: 100)
        let drawSizeSkippedNotVisitedRect = CGSize(width:  defaultSize + (studentResult?.skippedNotVisited ?? 0), height: 100)
        let drawSizeIncorrectAnsRect = CGSize(width:  defaultSize + (studentResult?.incorrectAnswers ?? 0), height: 100)
        
        
        
        
//        print(studentResult?.correctAnswers)
        correctAnswersRect.move(to: CGPoint(x: initialXPosition, y: drawSizeCorrectAnsRect.height))
        correctAnswersRect.addLine(to: CGPoint(x:drawSizeCorrectAnsRect.width, y: drawSizeCorrectAnsRect.height))
        correctAnswersRect.addLine(to: CGPoint(x: drawSizeCorrectAnsRect.width, y: (drawSizeCorrectAnsRect.height + correctAnsRectHeight)))
        correctAnswersRect.addLine(to: CGPoint(x: initialXPosition, y: (drawSizeCorrectAnsRect.height + correctAnsRectHeight)))
        correctAnswersRect.addLine(to: CGPoint(x: initialXPosition, y: drawSizeCorrectAnsRect.height))
        
        
        
        let skippedVisitedRect = UIBezierPath()
        skippedVisitedRect.move(to: CGPoint(x:drawSizeCorrectAnsRect.width , y: drawSizeCorrectAnsRect.height+downHeight))
        skippedVisitedRect.addLine(to: CGPoint(x: drawSizeCorrectAnsRect.width + drawSizeSkippedVisitedRect.width, y: drawSizeCorrectAnsRect.height+downHeight))
        skippedVisitedRect.addLine(to: CGPoint(x: drawSizeCorrectAnsRect.width + drawSizeSkippedVisitedRect.width, y: drawSizeSkippedVisitedRect.height+remainingRectHeight))
        skippedVisitedRect.addLine(to: CGPoint(x: drawSizeCorrectAnsRect.width, y: drawSizeSkippedVisitedRect.height+remainingRectHeight))
        
        
        let partiallyCorrectRect = UIBezierPath()
        partiallyCorrectRect.move(to: CGPoint(x: drawSizeCorrectAnsRect.width + drawSizeSkippedVisitedRect.width, y: drawSizePartiallyCrtRect.height+downHeight))
        partiallyCorrectRect.addLine(to: CGPoint(x: drawSizeCorrectAnsRect.width + drawSizeSkippedVisitedRect.width + drawSizePartiallyCrtRect.width, y: drawSizePartiallyCrtRect.height+downHeight))
        partiallyCorrectRect.addLine(to: CGPoint(x: drawSizeCorrectAnsRect.width + drawSizeSkippedVisitedRect.width + drawSizePartiallyCrtRect.width, y: drawSizePartiallyCrtRect.height+remainingRectHeight))
        partiallyCorrectRect.addLine(to: CGPoint(x: drawSizeCorrectAnsRect.width + drawSizeSkippedVisitedRect.width, y: drawSizePartiallyCrtRect.height+remainingRectHeight))
        
        
                                
        let skippedNotVisitedRect = UIBezierPath()
        skippedNotVisitedRect.move(to: CGPoint(x: drawSizeCorrectAnsRect.width + drawSizeSkippedVisitedRect.width+drawSizePartiallyCrtRect.width, y: drawSizeSkippedNotVisitedRect.height+downHeight))
        skippedNotVisitedRect.addLine(to: CGPoint(x: drawSizeCorrectAnsRect.width + drawSizeSkippedVisitedRect.width + drawSizePartiallyCrtRect.width+drawSizeSkippedVisitedRect.width, y: drawSizeSkippedNotVisitedRect.height+downHeight))
        skippedNotVisitedRect.addLine(to: CGPoint(x: drawSizeCorrectAnsRect.width + drawSizeSkippedVisitedRect.width + drawSizePartiallyCrtRect.width+drawSizeSkippedVisitedRect.width, y: drawSizeSkippedNotVisitedRect.height+remainingRectHeight))
        skippedNotVisitedRect.addLine(to: CGPoint(x: drawSizeCorrectAnsRect.width + drawSizeSkippedVisitedRect.width+drawSizePartiallyCrtRect.width, y: drawSizeSkippedNotVisitedRect.height+remainingRectHeight))
        
        
        let incorrectAnsRect = UIBezierPath()
        incorrectAnsRect.move(to: CGPoint(x: drawSizeCorrectAnsRect.width + drawSizeSkippedVisitedRect.width+drawSizePartiallyCrtRect.width+drawSizeSkippedNotVisitedRect.width, y: drawSizeSkippedNotVisitedRect.height+downHeight))
        incorrectAnsRect.addLine(to: CGPoint(x: drawSizeCorrectAnsRect.width + drawSizeSkippedVisitedRect.width + drawSizePartiallyCrtRect.width+drawSizeSkippedNotVisitedRect.width+drawSizeIncorrectAnsRect.width, y: drawSizeSkippedNotVisitedRect.height+downHeight))
        incorrectAnsRect.addLine(to: CGPoint(x: drawSizeCorrectAnsRect.width + drawSizeSkippedVisitedRect.width + drawSizePartiallyCrtRect.width+drawSizeSkippedNotVisitedRect.width+drawSizeIncorrectAnsRect.width, y: drawSizeIncorrectAnsRect.height+remainingRectHeight))
        incorrectAnsRect.addLine(to: CGPoint(x: drawSizeCorrectAnsRect.width + drawSizeSkippedVisitedRect.width+drawSizePartiallyCrtRect.width+drawSizeSkippedNotVisitedRect.width, y: drawSizeIncorrectAnsRect.height+remainingRectHeight))
        
        
        
        greenColor.setFill()
        correctAnswersRect.fill()
        
        orangeColor.setFill()
        skippedVisitedRect.fill()
        
        cyanColor.setFill()
        partiallyCorrectRect.fill()
        
        yellowColor.setFill()
        skippedNotVisitedRect.fill()
        
        pinkColor.setFill()
        incorrectAnsRect.fill()
       
        
        
    }
}
