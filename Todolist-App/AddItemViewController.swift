//
//  AddItemViewController.swift
//  Todolist-App
//
//  Created by Kriz Fern on 6/11/17.
//
//

import UIKit

class AddItemViewController: UIViewController {

    var text_input:String!
    
    
    @IBOutlet weak var txtFieldNewTodoItem: UITextField!
    @IBOutlet weak var lblStatusIndicator: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("My AddItem View Controller just loaded")
        lblStatusIndicator.isHidden = true
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("About to segue to Add Controller")
        
        if let ti = self.txtFieldNewTodoItem.text {
            text_input = ti
            print(" My data is: \(text_input)")
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
