//
//  MovieGridViewController.swift
//  Flixster
//
//  Created by Jonathon Chenvert on 12/3/19.
//  Copyright © 2019 Jonathon Chenvert. All rights reserved.
//

import UIKit
import AlamofireImage

class MovieGridViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var movies = [[String:Any]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        flowLayout()
        
        getMovies(url: "https://api.themoviedb.org/3/movie/297762/similar?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")
    }
    
    // Sets the Collection View's layout flow
    func flowLayout() {
        // Collection view's layout flow
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        // Spacing between rows of movie posters and each item
        layout.minimumLineSpacing = 4
        layout.minimumInteritemSpacing = 4
        
        let width = (view.frame.size.width - layout.minimumInteritemSpacing * 2) / 3
        layout.itemSize = CGSize(width: width, height: width * 3 / 2)
    }
    
    // Call to UrlHelper
    func getMovies(url: String) {
        UrlHelper.fetchApiUrl(apiUrl: url) { (movies) in
            if let movies = movies {
                self.movies = movies
                self.collectionView.reloadData()
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieGridCell", for: indexPath) as! MovieGridCell
        
        let movie = movies[indexPath.item]
        
        let posterUrl = UrlHelper.getImageURL(baseUrl: "https://image.tmdb.org/t/p/w185", imagePath: movie["poster_path"] as! String)
        cell.posterView.af_setImage(withURL: posterUrl)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Find selected movie
        let cell = sender as! UICollectionViewCell
        let indexPath = collectionView.indexPath(for: cell)!
        let movie = movies[indexPath.item]
        
        // Pass the selected movie to the Superhero Details VC
        let detailsViewController = segue.destination as! SuperheroMovieDetailsViewController
        detailsViewController.movie = movie
        
        // Deselects the row
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}
