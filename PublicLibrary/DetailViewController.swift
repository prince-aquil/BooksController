//
//  DetailViewController.swift
//  PublicLibrary
//
//  Created by Alberto Vega Gonzalez on 7/6/15.
//  Copyright (c) 2015 Alberto Vega Gonzalez. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate {
  
  @IBOutlet weak var bookTitleTextField: UITextField!
  @IBOutlet weak var bookAuthorTextField: UITextField!
  @IBOutlet weak var bookPublisherTextField: UITextField!
  @IBOutlet weak var bookPagesTextField: UITextField!
  @IBOutlet weak var bookISBNTextField: UITextField!
  
  var selectedBook: Book!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupTextFields()
    
//    NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
//    NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
  }
  
//  deinit {
//    NSNotificationCenter.defaultCenter().removeObserver(self)
//  }
  
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  private func setupTextFields() {
    
    self.bookTitleTextField.delegate = self
    self.bookAuthorTextField.delegate = self
    self.bookPublisherTextField.delegate = self
    self.bookPagesTextField.delegate = self
    self.bookISBNTextField.delegate = self

    self.bookTitleTextField.tag = 0
    self.bookAuthorTextField.tag = 1
    self.bookPublisherTextField.tag = 2
    self.bookPagesTextField.tag = 3
    self.bookISBNTextField.tag = 4

    bookTitleTextField.text = selectedBook.title
    bookAuthorTextField.text = selectedBook.author
    bookPublisherTextField.text = selectedBook.publisher
    if let bookPages = selectedBook.pages {
      bookPagesTextField.text = String(stringInterpolationSegment: bookPages)
      if let bookISBN = selectedBook.iSBN {
        bookISBNTextField.text = String(stringInterpolationSegment: bookISBN)
      }
    }
  }
  
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return false
  }
  
  func textFieldDidEndEditing(textField: UITextField) {
    
//    if textField.tag == 0 {
//      //set the first name
//    println(textField.text)
//    } else {
      //set the last name
//      self.selectedBook.author = textField.text
//    }
    if let textFieldText = textField.text {

    switch textField.tag {
    case 0:
       self.selectedBook.title = textFieldText
    case 1:
      self.selectedBook.author = textFieldText
    case 2:
      self.selectedBook.publisher = textFieldText
    case 3:
      self.selectedBook.pages = textFieldText.toInt()
    default:
      self.selectedBook.iSBN = textFieldText.toInt()
      }
    }
  }

  @IBAction func updateButtonPressed(sender: UIButton) {
    self.navigationController?.popViewControllerAnimated(true)
  }
  
  /*
  // MARK: - Navigation
  
  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
  // Get the new view controller using segue.destinationViewController.
  // Pass the selected object to the new view controller.
  }
  */
  
}
