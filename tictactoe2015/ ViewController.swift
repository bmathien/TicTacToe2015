//
//  ViewController.swift
//  tictactoe2015
//
//  Created by teacher on 11/18/15.
//  Copyright © 2015 Mathien. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    // outlets for my gridview and custom labels
    @IBOutlet weak var gridView: UIView!
    @IBOutlet weak var lab1: GridLabel!
    @IBOutlet weak var lab2: GridLabel!
    @IBOutlet weak var lab3: GridLabel!
    @IBOutlet weak var lab4: GridLabel!
    @IBOutlet weak var lab5: GridLabel!
    @IBOutlet weak var lab6: GridLabel!
    @IBOutlet weak var lab7: GridLabel!
    @IBOutlet weak var lab8: GridLabel!
    @IBOutlet weak var lab9: GridLabel!

    // myGrid is an object of the custom Gridlabel class
    var myGrid = GridLabel()
    //array of the gridlabel class that will hold my labels
    var labelsArray : [GridLabel] = []
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        //adds labels to my array
        labelsArray = [lab1, lab2, lab3, lab4, lab5, lab6, lab7, lab8, lab9]
    }
    // tap gesture for my grid
    @IBAction func gridTapped(sender: UITapGestureRecognizer)
    {
        print("tapped")

        // iterate through the loops array, check every item of my array
        for label in labelsArray
        {
            //checks for a tap on a label
            if CGRectContainsPoint(label.frame, sender.locationInView(gridView))
            {
                //conditional for the label being able to be tapped
                if label.canTap == true
                {
                    if myGrid.xTurn == true
                    {
                        label.text = "X"
                        label.canTap = false
                        myGrid.count += 1 //increments the count variable
                    }
                    else
                    {
                        label.text = "O"
                        label.canTap = false
                        myGrid.count += 1

                    }
                    myGrid.xTurn = !myGrid.xTurn
                }
            }
        }

        checkWinner()
    }

    //function checking for possible win outcomes
    func checkWinner()
    {
        if lab1.text == lab2.text && lab2.text == lab3.text && lab1.text != ""
        {
            print("winner")
            winner(lab1.text!)
            //calls winning function
        }
        if lab4.text == lab5.text && lab5.text == lab6.text && lab4.text != ""
        {
            print("winner") 
            winner(lab4.text!)
        }
        if lab7.text == lab8.text && lab8.text == lab9.text && lab7.text != ""
        {
            print("winner")
            winner(lab7.text!)
        }
        if lab1.text == lab4.text && lab4.text == lab7.text && lab1.text != ""
        {
            print("winner")
            winner(lab1.text!)
        }
        if lab2.text == lab5.text && lab5.text == lab8.text && lab2.text != ""
        {
            print("winner")
            winner(lab2.text!)
        }
        if lab3.text == lab6.text && lab6.text == lab9.text && lab3.text != ""
        {
            print("winner")
            winner(lab3.text!)
        }
        if lab1.text == lab5.text && lab5.text == lab9.text && lab1.text != ""
        {
            print("winner")
            winner(lab1.text!)
        }
        if lab3.text == lab5.text && lab5.text == lab7.text && lab3.text != ""
        {
            print("winner")
            winner(lab3.text!)
        }
        if myGrid.count >= 9
        {
            print("cat's game")
            winner("The Cat")
        }
    }

    //winner funciton that displays alert view
    func winner(winner: String)
    {
        let alert = UIAlertController(title: winner + " is the Winner!", message: nil, preferredStyle: UIAlertControllerStyle.Alert)

        let resetButton = UIAlertAction(title: "Play Again", style: UIAlertActionStyle.Default, handler: {sender in

            // interates through array and resets all labels
            for labels in self.labelsArray
            {
                labels.text = ""
                labels.canTap = true
            }
            self.myGrid.xTurn = true
            self.myGrid.count = 0
        })
        alert.addAction(resetButton)
        presentViewController(alert, animated: true, completion: nil)
    }


}

