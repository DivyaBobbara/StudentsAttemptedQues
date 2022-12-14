//
//  GraphView.swift
//  StudentCustomGraph
//
//  Created by Naga Divya Bobbara on 26/08/22.
//

import Foundation
import UIKit
class GraphView : UIView{

    let greenColor : UIColor = .systemGreen
    let orangeColor : UIColor = .systemOrange
    let cyanColor : UIColor = .systemCyan
    let yellowColor : UIColor = .systemYellow
    let pinkColor : UIColor = .systemPink
//    let defaultSize : Int = 40
    let correctAnsRectHeight : CGFloat = 60
    let remainingRectHeight : CGFloat = 50
    var  initialXPosition : CGFloat = 10
    var frameSize : CGFloat {
        return self.frame.width
    }
    
    let correctAnsButton = UIButton()
    let correctAnslabel = UILabel()
    
    let incorrectAnsButton = UIButton()
    let incorrectAnsLabel = UILabel()
    
    let skippedVisitedButton = UIButton()
    let skippedVisitedLabel = UILabel()
    
    let partiallyCorrectButton = UIButton()
    let partiallyCorrectLabel = UILabel()
    
    let skippedNotVisitedButton = UIButton()
    let skippedNotVisitedLabel = UILabel()
    
   
    let downHeight : CGFloat = 10
    var studentResult : Student?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addSubview(correctAnsButton)
        addSubview(correctAnslabel)
        
        addSubview(incorrectAnsButton)
        addSubview(incorrectAnsLabel)
        
        addSubview(skippedVisitedButton)
        addSubview(skippedVisitedLabel)
        
        addSubview(partiallyCorrectButton)
        addSubview(partiallyCorrectLabel)
        
        addSubview(skippedNotVisitedButton)
        addSubview(skippedNotVisitedLabel)
        
        correctAnsButton.backgroundColor = .systemGreen
        correctAnsButton.layer.cornerRadius = 10
        correctAnsButton.setTitle(" ", for: .normal)
        correctAnslabel.text = "\(Int(studentResult?.correctAnswers ?? 0))  CorrectAnswers"
        correctAnsButton.frame = CGRect(x:10 , y: 200, width: 20, height: 20)
        correctAnslabel.frame = CGRect(x: 35, y: 195, width: 160, height: 30)
        
        incorrectAnsButton.backgroundColor = .systemPink
        incorrectAnsButton.layer.cornerRadius = 10
        incorrectAnsButton.setTitle(" ", for: .normal)
        incorrectAnsLabel.text = "\(Int(studentResult?.incorrectAnswers ?? 0))  IncorrectAnswers"
        incorrectAnsButton.frame = CGRect(x:200 , y: 200, width: 20, height: 20)
        incorrectAnsLabel.frame = CGRect(x: 225, y: 195, width: 160, height: 30)
        
        skippedVisitedButton.backgroundColor = .systemOrange
        skippedVisitedButton.layer.cornerRadius = 10
        skippedVisitedButton.setTitle(" ", for: .normal)
        skippedVisitedLabel.text = "\(Int(studentResult?.skippedVisited ?? 0))  Skipped Visited"
        skippedVisitedButton.frame = CGRect(x:10 , y: 250, width: 20, height: 20)
        skippedVisitedLabel.frame = CGRect(x: 35, y: 245, width: 160, height: 30)
        
        partiallyCorrectButton.backgroundColor = .systemCyan
        partiallyCorrectButton.layer.cornerRadius = 10
        partiallyCorrectButton.setTitle(" ", for: .normal)
        partiallyCorrectLabel.text = "\(Int(studentResult?.partiallyCorrect ?? 0))  Partially Correct"
        partiallyCorrectButton.frame = CGRect(x:200 , y: 250, width: 20, height: 20)
        partiallyCorrectLabel.frame = CGRect(x: 225, y: 245, width: 160, height: 30)
        
        skippedNotVisitedButton.backgroundColor = .systemYellow
        skippedNotVisitedButton.layer.cornerRadius = 10
        skippedNotVisitedButton.setTitle(" ", for: .normal)
        skippedNotVisitedLabel.text = "\(Int(studentResult?.skippedNotVisited ?? 0))  Skipped not Visited"
        skippedNotVisitedButton.frame = CGRect(x:10 , y: 300, width: 20, height: 20)
        skippedNotVisitedLabel.frame = CGRect(x: 35, y: 295, width: 190, height: 30)
        
        
        

        
    }
    
    
    

    override func draw(_ rect: CGRect) {
        
        let drawSizeCorrectAnsRect = CGSize(width: (CGFloat(studentResult?.correctAnswers ?? 0)/100) * frameSize , height: 100)
    
        let drawSizeSkippedVisitedRect = CGSize(width: (CGFloat(studentResult?.skippedVisited ?? 0)/100) * frameSize, height: 100)
        let drawSizePartiallyCrtRect = CGSize(width: (CGFloat(studentResult?.partiallyCorrect ?? 0)/100) * frameSize, height: 100)
        let drawSizeSkippedNotVisitedRect = CGSize(width: (CGFloat(studentResult?.skippedNotVisited ?? 0)/100) * frameSize, height: 100)
        let drawSizeIncorrectAnsRect = CGSize(width: (CGFloat(studentResult?.incorrectAnswers ?? 0)/100) * frameSize, height: 100)
        
        
        
        
        
//        print(studentResult?.correctAnswers)
        let correctAnswersRect = UIBezierPath()
        correctAnswersRect.move(to: CGPoint(x: 0, y: drawSizeCorrectAnsRect.height))
        correctAnswersRect.addLine(to: CGPoint(x:drawSizeCorrectAnsRect.width, y: drawSizeCorrectAnsRect.height))
        correctAnswersRect.addLine(to: CGPoint(x: drawSizeCorrectAnsRect.width, y: (drawSizeCorrectAnsRect.height + correctAnsRectHeight)))
        correctAnswersRect.addLine(to: CGPoint(x: 0, y: (drawSizeCorrectAnsRect.height + correctAnsRectHeight)))
        correctAnswersRect.addLine(to: CGPoint(x: 0, y: drawSizeCorrectAnsRect.height))
        
        
        
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
        skippedNotVisitedRect.addLine(to: CGPoint(x: drawSizeCorrectAnsRect.width + drawSizeSkippedVisitedRect.width + drawSizePartiallyCrtRect.width+drawSizeSkippedNotVisitedRect.width, y: drawSizeSkippedNotVisitedRect.height+downHeight))
        skippedNotVisitedRect.addLine(to: CGPoint(x: drawSizeCorrectAnsRect.width + drawSizeSkippedVisitedRect.width + drawSizePartiallyCrtRect.width+drawSizeSkippedNotVisitedRect.width, y: drawSizeSkippedNotVisitedRect.height+remainingRectHeight))
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
