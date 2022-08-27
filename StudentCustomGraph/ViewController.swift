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
        myView.studentResult = Student(correctAnswers: 24, skippedVisited: 24, skippedNotVisited: 24, incorrectAnswers: 5, partiallyCorrect: 24)
        myView.frame = view.frame
        view.addSubview(myView)
    }


}

