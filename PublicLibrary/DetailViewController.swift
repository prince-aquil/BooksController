//
//  DetailViewController.swift
//  PublicLibrary
//
//  Created by Alberto Vega Gonzalez on 7/6/15.
//  Copyright (c) 2015 Alberto Vega Gonzalez. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  
  @IBOutlet weak var bookTitleTextField: UITextField!
  @IBOutlet weak var bookAuthorTextField: UITextField!
  @IBOutlet weak var bookPublisherTextField: UITextField!
  @IBOutlet weak var bookPagesTextField: UITextField!
  @IBOutlet weak var bookISBNTextField: UITextField!
  
  var selectedBook: Book!
  
  override func viewDidLoad() {
    super.viewDidLoad()
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
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  private func setupTextFields() {
    
    self.bookTitleTextField.tag = 0
    self.bookAuthorTextField.tag = 1
    self.bookPublisherTextField.tag = 2
    self.bookPagesTextField.tag = 3
    self.bookISBNTextField.tag = 4

    self.bookTitleTextField.text = self.selectedBook.title
    self.bookAuthorTextField.text = self.selectedBook.title
    self.bookPublisherTextField.text = self.selectedBook.title
    self.bookPagesTextField.text = self.selectedBook.title
    self.bookISBNTextField.text = self.selectedBook.title

    
  }
  
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    
    textField.resignFirstResponder()
    return false
  }
  
  func textFieldDidEndEditing(textField: UITextField) {
    
    switch textField.tag {
    case 0:
      textField.text = selectedBook.title
    case 1:
      textField.text = self.selectedBook.author
    case 2:
      textField.text = self.selectedBook.publisher
    case 3:
      textField.text = String(stringInterpolationSegment: self.selectedBook.pages)
    default:
      textField.text = String(stringInterpolationSegment:self.selectedBook.iSBN)
    }
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
