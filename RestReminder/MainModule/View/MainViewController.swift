//
//  MainViewController.swift
//  RestReminder
//
//  Created by Александр Лебедев on 22.10.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    
    @IBOutlet weak var lengthPicker: UIDatePicker!
    @IBOutlet weak var purityPicker: UIDatePicker!
    
    @IBOutlet weak var changeButton: UIButton!
    @IBOutlet weak var setupButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var presenter: MainViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }


    @IBAction func changeAction(_ sender: Any) {
        presenter.changeTap()
    }
    
    
    @IBAction func setupAction(_ sender: Any) {
        presenter.setupTap()
    }
    
    
    @IBAction func stopAction(_ sender: Any) {
        presenter.stopTap()
    }
    
}


//MARK: MainView Extension

extension MainViewController: MainViewProtocol {
    
}
