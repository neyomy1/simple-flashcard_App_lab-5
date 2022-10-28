//
//  ViewController.swift
//  flashcardshw1
//
//  Created by Naomy Chepngeno Chesengeny on 9/21/22.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var frontlabel: UILabel!
    @IBOutlet weak var backlabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func didTapOnFlashcard(_ sender: Any) {
        frontlabel.isHidden=true
    }
    func updateFlashcard(QuestionText: String, AnswerText: String){
        frontlabel.text = QuestionText
        backlabel.text = AnswerText
        
        
        
    }
    override func prepare(for segue :UIStoryboardSegue, sender: Any?){
        let navigationController = segue.destination as! UINavigationController
        let creationController = navigationController.topViewController as! CreationViewController
        creationController.flashcardsController = self
   
        
    }
}

