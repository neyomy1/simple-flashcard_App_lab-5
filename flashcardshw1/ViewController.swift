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


    @IBAction func didTapOnFlashcard(_ sender: Any) {frontlabel.isHidden=true
    }
}

