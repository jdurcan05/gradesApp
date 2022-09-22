//
//  ViewController.swift
//  gradesApp
//
//  Created by JAMES DURCAN on 9/21/22.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate  {

    @IBOutlet weak var percentEnter: UITextField!
    @IBOutlet weak var passingLabel: UILabel!
    @IBOutlet weak var letterLabel: UILabel!
    @IBOutlet weak var ppLabel: UITextField!
    @IBOutlet weak var percentLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        percentEnter.delegate = self
        ppLabel.delegate = self
        // Do any additional setup after loading the view.
    }


    func passingCheck(_ grade:Double)->String{
        if(grade>=60){
            return("You passed!")
        }
        else{
            return("You failed :(")
        }
    }
    func letterGrade(_ grade: Double)->String{
        if grade>=90{
            return "A"
        }
        else if grade>=80{
            return "B"
        }
        else if grade >= 70{
            return "C"
        }
        else if grade >= 60{
            return "D"
        }
        else{
            return "F"
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    func allCheck(_ pg: Double, _ pp: Double)->(String,String,Double){
        var percent = (pg/pp)*100
        percent = round(100*percent)/100
        let letter = letterGrade(percent)
        let pass = passingCheck(percent)
        return (letter, pass, percent)
    }
    @IBAction func gradeCheck(_ sender: Any) {
        let text = percentEnter.text
        if let dur = Double(text ?? "0"){
        let pp = ppLabel.text ?? "0"
        if Double(pp) != 0{
        if let blah = Double(pp){
            let tup = allCheck(dur, blah)
            passingLabel.text = tup.1
            letterLabel.text = tup.0
            percentLabel.text = String(tup.2)
        }
        else{
            passingLabel.text = "Please enter points possible"
        }
        }
        else{
            passingLabel.text = "Please enter points possible"
        }
        }
        else{
            passingLabel.text = "Please enter points got"
        }
//        if(pp == 0){
//            passingLabel.text = "Please enter points possible"
//        }
//        else{
//        let tup = allCheck(text, pp!)
//        passingLabel.text = tup.1
//        letterLabel.text = tup.0
//        percentLabel.text = String(tup.2)
//        }
    }
}

