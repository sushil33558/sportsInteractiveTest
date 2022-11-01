//
//  FirstCell.swift
//  SportInterceiveTest
//
//  Created by Divya Pegwal on 10/28/22.
//

import UIKit

class FirstCell: UICollectionViewCell {
    //MARK: - IBOutlet
    //----------------
    @IBOutlet weak var innerView: UIView!
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var impView: UIView!
    //----
    @IBOutlet weak var styleLbl: UILabel!
    @IBOutlet weak var avgrateLbl: UILabel!
    @IBOutlet weak var strikeRateLbl: UILabel!
    @IBOutlet weak var runnLbl: UILabel!
    //-----
    @IBOutlet weak var styleBowldLbl: UILabel!
    @IBOutlet weak var avgrateBowlLbl: UILabel!
    @IBOutlet weak var economyRateLbl: UILabel!
    @IBOutlet weak var wicketLbl: UILabel!
    //MARK: -
    //---
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
