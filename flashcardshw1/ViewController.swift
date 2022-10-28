//
//  ViewController.swift
//  flashcardshw1
//
//  Created by Naomy Chepngeno Chesengeny on 9/21/22.
//

import UIKit
struct Flashcard {
    var QuestionText: String
    var AnswerText: String
}

class ViewController: UIViewController {
    

    @IBOutlet weak var frontlabel: UILabel!
    @IBOutlet weak var backlabel: UILabel!
    
    var flashcards = [Flashcard]()
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        readSavedFlashcards()
        
        if flashcards.count == 0 {
            updateFlashcard(QuestionText:"What is the capital city of Kenya?", AnswerText: "Nairobi")
        }
        else{
            updateLabels()
            updateNextPrevButtons()
        }
    }


    @IBAction func didTapOnFlashcard(_ sender: Any) {
        frontlabel.isHidden=true
    }
    func updateFlashcard(QuestionText: String, AnswerText: String){
        let flashcard = Flashcard(QuestionText: QuestionText, AnswerText: AnswerText)
        frontlabel.text = flashcard.QuestionText
        backlabel.text = flashcard.AnswerText
        flashcards.append(flashcard)
        print("Add a new flashcard")
        print("We now have\(flashcards.count)flashcards")
        
        currentIndex = flashcards.count - 1
        print("Our current Index is \(currentIndex)")
        updateNextPrevButtons()
        
        updateLabels()
        saveAllFlashcardsToDisk()
        
        
        
    }
    override func prepare(for segue :UIStoryboardSegue, sender: Any?){
        let navigationController = segue.destination as! UINavigationController
        let creationController = navigationController.topViewController as! CreationViewController
        creationController.flashcardsController = self
   
        
    }
    
    
    @IBAction func didTapOnPrev(_ sender: Any) {
        
        currentIndex = currentIndex - 1
        
        updateLabels()
        updateNextPrevButtons()
    }
    
    
    @IBAction func didTapOnNext(_ sender: Any) {
        currentIndex = currentIndex + 1
        
        updateLabels()
        updateNextPrevButtons()
    }
    
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    func updateNextPrevButtons(){
        if currentIndex == flashcards.count - 1
        {
            nextButton.isEnabled = false
        }else {
            nextButton.isEnabled = true
            
        }
        if currentIndex == flashcards.count - 1
        {
            prevButton.isEnabled = true
        }else {
            prevButton.isEnabled = false
            
        }
        if currentIndex == 0
        {prevButton.isEnabled = false}
    }
    func updateLabels(){
        let currentFlashcard = flashcards[currentIndex]
        frontlabel.text = currentFlashcard.QuestionText
        backlabel.text = currentFlashcard.AnswerText
        
    }
    func saveAllFlashcardsToDisk(){
        
        let dictionaryArray = flashcards.map {(card) -> [String:String] in
            return ["question":card.QuestionText,"answer":card.AnswerText]
            
        }
    }
    
    func readSavedFlashcards(){
        
        if let dictionaryArray = UserDefaults.standard.array(forKey:"flashcards") as? [[String: String]]{
            let savedCards = dictionaryArray.map {dictionary ->Flashcard in
                return Flashcard(QuestionText:dictionary["question"]!, AnswerText: dictionary["answer"]!)
            }
                
                flashcards.append(contentsOf: savedCards)
            
                
            }
       
        }
        
    }

    
   
       
    


