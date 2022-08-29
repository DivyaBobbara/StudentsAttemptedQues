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
        myView.studentResult = Student(correctAnswers: 100, skippedVisited: 0, skippedNotVisited: 0, incorrectAnswers: 0, partiallyCorrect: 0)
        myView.frame = view.frame
        view.addSubview(myView)
    }


}

