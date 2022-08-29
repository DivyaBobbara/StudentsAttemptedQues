//
//  ViewController.swift
//  StudentCustomGraph
//
//  Created by Naga Divya Bobbara on 26/08/22.
//

import UIKit

class ViewController: UIViewController {
    lazy var myView : GraphView = GraphView()
    override func viewDidLoad() {
        super.viewDidLoad()

        myView.backgroundColor = .white
        myView.studentResult = Student(correctAnswers: 54, skippedVisited: 38, skippedNotVisited: 5, incorrectAnswers: 2, partiallyCorrect:1)
        myView.frame = CGRect(x: 20, y: 0, width: view.frame.size.width - 40, height: 200)
        view.addSubview(myView)
        
        
        
    }


}

