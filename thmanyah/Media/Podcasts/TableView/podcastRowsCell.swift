//
//  podcastRowsCell.swift
//  thmanyah
//
//  Created by Ebtsam alkhuzai on 21/05/1443 AH.
//

import UIKit

typealias DisSelectPodcast = ((_ tableIndex:Int?, _ collectionIndex:Int?) -> Void)

class podcastRowsCell: UITableViewCell ,UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    var disSelectPodcast : DisSelectPodcast?
    var index : Int?
    
    var models = [PodcastInfo]()
    static let identifier = "podcastRowsCell"
    static func nib() -> UINib {
        return UINib(nibName: "podcastRowsCell",
                     bundle: nil)
    }
    
    func configure(with models : [PodcastInfo] , tableIndex : Int ){
        self.models = models
        self.index = tableIndex

        collectionView.reloadData()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        

        collectionView.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        collectionView.register(podcastEpisodesCell.nib(), forCellWithReuseIdentifier: podcastEpisodesCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: podcastEpisodesCell.identifier, for: indexPath as IndexPath) as! podcastEpisodesCell
 
        cell.configureInfo(with: (models[indexPath.row]))

        cell.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)

        return cell

    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 183, height: 270)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        disSelectPodcast?(self.index,indexPath.row)
        
  }
    
}
