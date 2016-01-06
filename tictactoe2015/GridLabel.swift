//
//  GridLabel.swift
//  tictactoe2015
//
//  Created by teacher on 11/24/15.
//  Copyright © 2015 Mathien. All rights reserved.
//

import UIKit


// custom class GRidlabel of type UILabel

class GridLabel: UILabel
{
    // 3 properties of custom class
        var xTurn = true  //check turn of x or o
        var canTap = true   //checks is label is tappable
        var count = 0   //tracks the number of turns for cat's game
}
