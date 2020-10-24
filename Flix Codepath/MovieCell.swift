//
//  MovieCell.swift
//  Flix Codepath
//
//  Created by John Jakobsen on 9/25/20.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var movieImageBackground: UIView!
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var synopsisLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    //update 
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        posterView.layer.shadowPath = UIBezierPath(rect: posterView.bounds).cgPath
        posterView.layer.shadowColor = UIColor.black.cgColor
        posterView.layer.shadowOpacity = 0.5
        posterView.layer.shadowOffset = CGSize(width: 1, height: 1)
        posterView.layer.shadowRadius = 3
        

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
