//
//  DetailViewController.swift
//  PublicLibrary
//
//  Created by Alberto Vega Gonzalez on 7/6/15.
//  Copyright (c) 2015 Alberto Vega Gonzalez. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  @IBOutlet weak var bookTitleLabel: UILabel!
  @IBOutlet weak var bookAuthorLabel: UILabel!
  @IBOutlet weak var bookPublisherLabel: UILabel!
  @IBOutlet weak var bookPagesLabel: UILabel!
  @IBOutlet weak var bookISBNLabel: UILabel!
  
  var selectedBook: Book!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    bookTitleLabel.text = selectedBook.title
    bookAuthorLabel.text = selectedBook.author
    bookPublisherLabel.text = selectedBook.publisher
    if let bookPages = selectedBook.pages {
      bookPagesLabel.text = String(stringInterpolationSegment: bookPages)
      if let bookISBN = selectedBook.iSBN {
        bookISBNLabel.text = String(stringInterpolationSegment: bookISBN)
      }
    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
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
