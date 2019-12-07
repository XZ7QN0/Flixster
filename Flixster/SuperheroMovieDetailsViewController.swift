//
//  SuperheroMovieDetailsViewController.swift
//  Flixster
//
//  Created by Jonathon Chenvert on 12/6/19.
//  Copyright © 2019 Jonathon Chenvert. All rights reserved.
//

import UIKit
import AlamofireImage

class SuperheroMovieDetailsViewController: UIViewController {
    
    var movie: [String:Any]!
    @IBOutlet weak var backdropView: UIImageView!
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = movie["title"] as? String
        titleLabel.sizeToFit()
        
        synopsisLabel.text = movie["overview"] as? String
        synopsisLabel.sizeToFit()
        
        let posterUrl = UrlHelper.getImageURL(baseUrl: "https://image.tmdb.org/t/p/w185", imagePath: movie["poster_path"] as! String)
        posterView.af_setImage(withURL: posterUrl)
        
        let backdropUrl = UrlHelper.getImageURL(baseUrl: "https://image.tmdb.org/t/p/w780", imagePath: movie["backdrop_path"] as! String)
        backdropView.af_setImage(withURL: backdropUrl)
    }
}
