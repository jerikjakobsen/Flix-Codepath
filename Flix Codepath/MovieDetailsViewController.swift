//
//  MovieDetailsViewController.swift
//  Flix Codepath
//
//  Created by John Jakobsen on 10/2/20.
//

import UIKit
import AlamofireImage

class MovieDetailsViewController: UIViewController {
    @IBOutlet weak var backdropView: UIImageView!
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    var movie: [String: Any]!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        titleLabel.text = movie["title"] as? String
        synopsisLabel.text = movie["overview"] as? String
        titleLabel.sizeToFit()
        synopsisLabel.sizeToFit()
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        
        let posterPath = movie["poster_path"] as! String
        let backdropPath = movie["backdrop_path"] as! String
        print(backdropPath)
        
        let posterUrl = URL(string: baseUrl + posterPath)
        let backdropUrl = URL(string: "https://image.tmdb.org/t/p/w780" + backdropPath)
        
        backdropView.af_setImage(withURL: backdropUrl!)
        posterView.af_setImage(withURL: posterUrl!)
        posterView.layer.shadowPath = UIBezierPath(rect: posterView.bounds).cgPath
        posterView.layer.shadowColor = UIColor.black.cgColor
        posterView.layer.shadowOpacity = 0.7
        posterView.layer.shadowOffset = CGSize(width: 10, height: 10)
        posterView.layer.shadowRadius = 3
        let gradient = CAGradientLayer()
        gradient.frame = backdropView.bounds
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradient.locations = [0.6]
        backdropView.layer.addSublayer(gradient)
        
    }
    

    @IBAction func tapToTrailer(_ sender: Any) {
        performSegue(withIdentifier: "presentModally", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let trailerView = segue.destination as! TrailerViewController
        
        trailerView.movieID = String(movie["id"] as! Int)
    }

}
