//
//  HomeViewController.swift
//  thmanyah
//
//  Created by Ebtsam alkhuzai on 18/05/1443 AH.
//

import UIKit

class movies {
    var movieName :String?
    var moviePeriod: String?
    var moviePoster: UIImage?
    
    init(movieName :String?, moviePeriod :String?, moviePoster :UIImage?) {
        self.movieName = movieName
        self.moviePeriod = moviePeriod
        self.moviePoster = moviePoster
        
    }
}

class artical {
    var authorName :String?
    var authorImage: UIImage?
    var artiaclTitle: String?
    var articalDate :String?
    var articalImage: UIImage?
    
    init( authorName :String? , authorImage: UIImage?, artiaclTitle: String?, articalDate :String?, articalImage: UIImage?) {
        
        self.authorName = authorName
        self.authorImage = authorImage
        self.artiaclTitle = artiaclTitle
        self.articalDate = articalDate
        self.articalImage = articalImage
        
    }
}

class podcast {
    var podcastName :String?
    var podcastDate: String?
    var podcastDescription :String?
    var podcastPeriod: String?
    var podcastPoster: UIImage?
    
    init( podcastName :String? , podcastDate: String? , podcastDescription :String? ,podcastPeriod: String?, podcastPoster: UIImage?) {
        
        self.podcastName = podcastName
        self.podcastDate = podcastDate
        self.podcastDescription = podcastDescription
        self.podcastPeriod = podcastPeriod
        self.podcastPoster = podcastPoster
    }
}

class numbers {
    var number :Int?
    var title: String?
    
    init( number :Int? , title: String?) {
        
        self.number = number
        self.title = title
    }
}


class HomeViewController: UIViewController{
    
    @IBOutlet weak var articalRedirect: UIButton!
    @IBOutlet weak var moviesCollectionView: UICollectionView!
    @IBOutlet weak var ourNumbersCollectionView: UICollectionView!

    @IBOutlet weak var podcastTableView: UITableView!
    @IBOutlet weak var articalTableView: UITableView!
    
    @IBOutlet weak var homeDate: UILabel!
    @IBOutlet weak var homeCategory: UILabel!
    @IBOutlet weak var homeArticalTitle: UILabel!
    @IBOutlet weak var latestInMovie: UILabel!
    @IBOutlet weak var moreMoview: UIButton!
    @IBOutlet weak var morePodcast: UIButton!
    @IBOutlet weak var moreArtical: UIButton!
    @IBOutlet weak var thamanyahNum: UILabel!
    @IBOutlet weak var latestArtical: UILabel!
    @IBOutlet weak var latestPodcast: UILabel!
    
    var movieArr = [movies]()
    var podcastArr = [podcast]()
    var articallArr = [artical]()
    var numbersArr = [numbers]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        //moviesCollectionView.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        
        setupNavighation()
        setupBuutomUI()
        setUpFont()
        FillMovies()
        FillPodcast()
        FillArticals()
        fillNumbers()
    }
    
    func setUpFont(){
        
        self.homeDate.font = UIFont(name: "IBMPlexSansArabic-Regular", size: 12)
        self.homeCategory.font = UIFont(name: "IBMPlexSansArabic-SemiBold", size: 13)
        self.homeArticalTitle.font = UIFont(name: "IBMPlexSansArabic-Bold", size: 22)
        self.latestInMovie.font = UIFont(name: "IBMPlexSansArabic-Bold", size: 20)
        self.thamanyahNum.font = UIFont(name: "IBMPlexSansArabic-Bold", size: 25)
        self.latestArtical.font = UIFont(name: "IBMPlexSansArabic-Bold", size: 20)
        self.latestPodcast.font = UIFont(name: "IBMPlexSansArabic-Bold", size: 20)
        
    }
    
    func fillNumbers(){
        numbersArr.append(numbers.init(number: 10, title: "جوائز محلية وأقليمية"))
        numbersArr.append(numbers.init(number: 91, title: "فلمًا وثائقيًا"))
        numbersArr.append(numbers.init(number: 600, title: "ألف متابع"))
        numbersArr.append(numbers.init(number: 30, title: "مليون متابع على الأفلام"))
    }
    
    
    func FillMovies(){
        
        //Movies
        movieArr.append(movies.init(movieName: "سلمان ابن البلد", moviePeriod: "16:56", moviePoster: UIImage(named: "movie1.jpg")))
        movieArr.append(movies.init(movieName: "الرهان الاخير في حرب العظام", moviePeriod: "6:56", moviePoster: UIImage(named: "movie2.jpg")))
        movieArr.append(movies.init(movieName: "كيف يعبر فنان عن مأساة سوريا", moviePeriod: "18:06", moviePoster: UIImage(named: "movie3.jpg")))
        movieArr.append(movies.init(movieName: "كيف يعبر العالم أثناء أزمة كورونا", moviePeriod: "5:50", moviePoster: UIImage(named: "movie4.jpg")))
        
    }

    func FillPodcast(){
        
        //Podcast
        podcastArr.append(podcast.init(podcastName: "سالفة منصة الاستشارات الطبية – كيورا", podcastDate: "22 نوفمبر", podcastDescription: "سولفنا في هذه الحلقة مع الشريك المؤسس لشركة «كيورا» ورئيسها التنفيذي وائل كابلي. و«كيورا» منصة تقدم الاستشارات والخدمات الطبية عبر الهاتف الذكي.", podcastPeriod: "19 دقيقة", podcastPoster: UIImage(named: "podcast1.jpg")))
        
       podcastArr.append(podcast.init(podcastName: "العرب هم أول من عرف القهوة", podcastDate: "14 ديسمبر", podcastDescription: "نستضيف في هذه الحلقة الرحالة والمستكشف الكويتي عبدالكريم الشطي الذي خاض تجارب عديدة وعجيبة، ألَّف منها عدة كتب في أدب الرحلة وأدب الأشياء.", podcastPeriod: "14 دقيقة", podcastPoster: UIImage(named: "podcast2.jpg")))
      
        
    }
    
    func FillArticals(){
        
        //Articals
        articallArr.append(artical.init(authorName: "سحر الهاشمي", authorImage: UIImage(named: "au1.jpg"), artiaclTitle: "الصحة النفسية في بيئة العمل بعد الجائحة", articalDate: "10 اكتوبر", articalImage: UIImage(named: "art1.jpg")))
        
        articallArr.append(artical.init(authorName: "هيفاء القحطاني", authorImage: UIImage(named: "au2.jpg"), artiaclTitle: "الرأسمالية وانفصال المطرب العربي عن جماهيره", articalDate: "14 ديسمبر", articalImage: UIImage(named: "art2.jpg")))
      
        
    }


    func setupBuutomUI(){
        let frame = CGRect(x: 0, y: articalRedirect.frame.size.height, width: articalRedirect.frame.size.width, height: 0.3)
        let borderBottom = UIView(frame: frame)
        borderBottom.backgroundColor = UIColor.lightGray
        articalRedirect.addSubview(borderBottom)
        
        
    }
    func setupNavighation(){
                
        let logo = UIImage(named: "thmanyah-logo")

        let container = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        container.backgroundColor = UIColor.clear
        let imageView = UIImageView(frame:  CGRect(x: 140, y: -20, width: 70, height: 70))
        imageView.contentMode = .scaleAspectFit
        imageView.image = logo
        container.addSubview(imageView)
        self.navigationItem.titleView = container
        
    }


}


extension  HomeViewController:  UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == moviesCollectionView{
            return movieArr.count
        }
        else {
            return 4
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == moviesCollectionView{

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! movieCollectionViewCell
            cell.moviePoster.image = self.movieArr[indexPath.row].moviePoster
            cell.moviePeriod.text = self.movieArr[indexPath.row].moviePeriod
            cell.movieName.text = self.movieArr[indexPath.row].movieName
            
            cell.moviePeriod.font =  UIFont(name: "IBMPlexSansArabic-Regular", size: 12)
            cell.movieName.font = UIFont(name: "IBMPlexSansArabic-SemiBold", size: 16)
                //UIFont(name: "IBMPlexSansArabic-Medium", size: 15)
            
            
            //cell.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            cell.movieName.text = self.movieArr[indexPath.row].movieName
                return cell
        } else {
        
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! numbersCollectionViewCell
            
            cell.num.countFrom(1, to: CGFloat(self.numbersArr[indexPath.row].number!), withDuration: 7.0)
            cell.title.text = self.numbersArr[indexPath.row].title
            cell.title.font = UIFont(name: "IBMPlexSansArabic-Medium", size: 17)
         
                    return cell
            }
    }
}

extension  HomeViewController:  UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == podcastTableView{
            return podcastArr.count
        }
        else
        {
            return articallArr.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == podcastTableView{
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath) as! podcastTableViewCell
            cell.podcastTitle.text = self.podcastArr[indexPath.row].podcastName
            cell.podcastDescription.text = self.podcastArr[indexPath.row].podcastDescription
            cell.podcastPeriod.text = self.podcastArr[indexPath.row].podcastPeriod
            cell.publishedDate.text = self.podcastArr[indexPath.row].podcastDate
            cell.podcastImage.image = self.podcastArr[indexPath.row].podcastPoster
            
            cell.podcastDescription.font =  UIFont(name: "IBMPlexSansArabic-Regular", size: 12)
            cell.podcastTitle.font = UIFont(name: "IBMPlexSansArabic-SemiBold", size: 17)
            cell.podcastPeriod.font =  UIFont(name: "IBMPlexSansArabic-Medium", size: 12)
            cell.publishedDate.font = UIFont(name: "IBMPlexSansArabic-SemiBold", size: 13)
            
            if indexPath.row == podcastArr.count - 1  {
                cell.line.alpha = 0
            }
      

            
                return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath) as! articalTableViewCell
            
            cell.articalTitle.text = self.articallArr[indexPath.row].artiaclTitle
            cell.authorName.text = self.articallArr[indexPath.row].authorName
            cell.authorImage.image = self.articallArr[indexPath.row].authorImage
            cell.publishDate.text = self.articallArr[indexPath.row].articalDate
            cell.articalImage.image = self.articallArr[indexPath.row].articalImage
            
            cell.authorName.font =  UIFont(name: "IBMPlexSansArabic-Regular", size: 14)
            cell.articalTitle.font = UIFont(name: "IBMPlexSansArabic-SemiBold", size: 18)
            cell.publishDate.font =  UIFont(name: "IBMPlexSansArabic-Medium", size: 12)
            cell.readTime.font =  UIFont(name: "IBMPlexSansArabic-Medium", size: 12)
            
           return cell
            
        }
    }
    
    
  
    }

