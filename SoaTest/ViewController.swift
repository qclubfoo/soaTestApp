//
//  ViewController.swift
//  SoaTest
//
//  Created by Дмитрий on 16.11.2020.
//  Copyright © 2020 home. All rights reserved.
//

import UIKit
import NotificationCenter

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var loadButton: UIButton!
    
    var presentationAssembly: IPresentationAssembly!
    var model: IVCDataModel!
    var dataSource: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSavedData()
        
        saveButton.addTarget(self, action: #selector(saveDataFromTextfield), for: .touchUpInside)
        loadButton.addTarget(self, action: #selector(loadSavedData), for: .touchUpInside)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func saveDataFromTextfield() {
        if let line = textField.text {
            model.addNewData(text: line)
            textField.text = ""
        }
    }
    
    @objc func loadSavedData() {
        model.getNewData()
    }
    
    

}

// handling keyboard showing/hiding
extension ViewController {
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide() {
        self.view.frame.origin.y = 0
    }
}

extension ViewController: IVCDataModelDelegate {
    func setup(dataSource: [String]) {
        self.dataSource = dataSource
        updateTextView()
    }
    
    func updateTextView() {
        var counter = 1
        let maxNumber = dataSource.count
        var textForShow = ""
        for line in dataSource {
            textForShow += "\(counter): \(line)"
            if counter != maxNumber {
                textForShow += "\n"
            }
            counter += 1
        }
        textView.text = textForShow
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
    }
}

extension ViewController {
    static func storyboardInstance() -> ViewController {
        let storyboardName = String(describing: self)
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        if let vc = storyboard.instantiateInitialViewController() as? ViewController {
            return vc
        } else {
            fatalError("Can't load vc from storyboard")
        }
    }
}

