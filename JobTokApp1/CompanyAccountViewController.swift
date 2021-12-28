//
//  SecondViewController.swift
//  JobTokApp1
//
//  Created by 東　雄大 on 2019/08/20.
//  Copyright © 2019 Azuma Yudai. All rights reserved.
//

import UIKit

class CompanyAccountViewController: UIViewController,UITabBarDelegate {
    //tabbar
    private var myTabBar:MyTabBar!
    //ブックマークボタン
    let bookmarkbutton:UIButton = UIButton()
    //mapbutton
    let mapbutton:UIButton = UIButton()
    //calendar
    let calendarbutton:UIButton = UIButton()
    //ブックマーク済みかを判定
    var bookmarkcount = 0
    let fruits: [String] = ["apple", "grape", "lemon", "banana", "cherry", "strobery", "peach", "orange","meron","dog"]
    static let movieimage = [UIImage(named:"jobtokimage5.png")!,UIImage(named:"jobtokimage6.png")!,UIImage(named:"jobtokimage7.png")!,UIImage(named:"jobtokimage8.png")!,UIImage(named:"jobtokimage9.png")!,UIImage(named:"jobtokimage10.png")!,UIImage(named:"jobtokimage11.png")!,UIImage(named:"jobtokimage12.png")!,UIImage(named:"jobtokimage13.png")!,UIImage(named:"jobtokimage16.png")!]
    let n_of_movie = Double(SecondViewController.movieimage.count)/3.0

    let collectionView: UICollectionView = {
        //セルのレイアウト設計
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let n_of_movie = Double(SecondViewController.movieimage.count)/3.0
        //各々の設計に合わせて調整
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        
        // スクリーンの縦横サイズを取得
        let screenWidth:CGFloat = UIScreen.main.bounds.size.width
        let screenHeight:CGFloat = UIScreen.main.bounds.size.height
        //ヘッダー
        let image1:UIImage = UIImage(named:"jobtokimage15")!
        // UIImageView 初期化
        let imageView1 = UIImageView(image:image1)
        // 画像の縦横サイズを取得
        let imgWidth1:CGFloat = image1.size.width
        let imgHeight1:CGFloat = image1.size.height
        // 画像サイズをスクリーン幅に合わせる
        let scale1:CGFloat = imgHeight1 / imgWidth1
        
        let collectionView = UICollectionView( frame: CGRect(x:0 , y:screenWidth*scale1+90+screenWidth/4 , width: screenSize.width, height:CGFloat(ceil(n_of_movie))*1.618*(screenSize.width/3) ), collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.black
        //セルの登録
        collectionView.register(CompanyCollectionViewCell.self, forCellWithReuseIdentifier: "CompanyCollectionViewCell")
        collectionView.isScrollEnabled = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black
        
        // スクリーンの縦横サイズを取得
        let screenWidth:CGFloat = self.view.frame.size.width
        let screenHeight:CGFloat = self.view.frame.size.height
        //UIScrollViewのインスタンス作成
        let scrollView = UIScrollView()
        //scrollViewの大きさを設定。
        scrollView.frame = CGRect(x:0, y:0, width:screenWidth , height:screenHeight)
        //スクロール領域の設定
        scrollView.contentSize = CGSize(width:screenWidth, height:CGFloat(ceil(n_of_movie))*1.618*(screenSize.width/3)+300+90+58)
        //scrollViewをviewのSubViewとして追加
        self.view.addSubview(scrollView)
        
        //ヘッダー
        let image1:UIImage = UIImage(named:"jobtokimage15")!
        // UIImageView 初期化
        let imageView1 = UIImageView(image:image1)
        // 画像の縦横サイズを取得
        let imgWidth1:CGFloat = image1.size.width
        let imgHeight1:CGFloat = image1.size.height
        // 画像サイズをスクリーン幅に合わせる
        let scale1:CGFloat = imgHeight1 / imgWidth1
        let rect1:CGRect =
            CGRect(x:0, y:0, width:screenWidth, height:screenWidth*scale1)
        // ImageView frame をCGRectで作った矩形に合わせる
        imageView1.frame = rect1;
        // UIImageViewのインスタンスをビューに追加
        scrollView.addSubview(imageView1)
        
        //アイコン画像
        let image2:UIImage = UIImage(named:"iconA")!
        let imageView2 = UIImageView(image:image2)
        // 画像の縦横サイズを取得
        let imgWidth2:CGFloat = image2.size.width
        let imgHeight2:CGFloat = image2.size.height
        let scale2:CGFloat = imgHeight2 / imgWidth2
        imageView2.contentMode = .scaleAspectFill
        imageView2.clipsToBounds = true
        imageView2.layer.cornerRadius = imgHeight2 / 2.0
        let rect2:CGRect = CGRect(x:screenWidth/4-20-scale2*screenWidth/8,y:screenWidth*scale1+10+scale2*screenWidth/8-scale2*screenWidth/12,width: screenWidth/6,height: scale2*screenWidth/6)
        imageView2.frame = rect2;
        imageView2.circle(screenWidth: screenWidth/6)
        scrollView.addSubview(imageView2)
        
        //ブックマークボタン
        let bookmarkrect:CGRect = CGRect(x: screenWidth/4-20-scale2*screenWidth/8, y: screenWidth*scale1+10+scale2*screenWidth/8, width: self.view.frame.width/6, height: self.view.frame.width/6)
        bookmarkbutton.frame = bookmarkrect;
        // 任意の場所に設置する
        bookmarkbutton.layer.position = CGPoint(x: screenWidth/4+60, y:screenWidth*scale1+10+scale2*screenWidth/8)
        // 枠の太さを変える
        //bookmarkbutton.layer.borderWidth = 0.5
        // 枠の色を変える
        //bookmarkbutton.layer.borderColor = UIColor.red.cgColor
        //bookmarkbutton.backgroundColor = UIColor.orange
        //bookmarkbutton.setTitleColor(.white, for: .normal)
        bookmarkbutton.setImage(UIImage.init(named: "bookmarkOFF"), for: UIControl.State.normal)
        //bookmarkbutton.setTitle("ブックマーク", for: .normal)
        //bookmarkbutton.setTitle("ブックマークする", for: .highlighted)
        // ボタンが押されたときの文字色
        //bookmarkbutton.setTitleColor(UIColor.white, for: UIControl.State.highlighted)
        //bookmarkbutton.setImage(UIImage.init(named: "jobtokimage20"), for: UIControl.State.normal)
        bookmarkbutton.addTarget(self, action: #selector(bookmarkbuttonEvent(_:count:)), for: UIControl.Event.touchUpInside)
        scrollView.addSubview(bookmarkbutton)
        
        //mapボタン
        let maprect:CGRect = CGRect(x: screenWidth/4+140, y: screenWidth*scale1+10+scale2*screenWidth/8, width: self.view.frame.width/6, height: self.view.frame.width/6)
        mapbutton.frame = maprect;
        // 任意の場所に設置する
        mapbutton.layer.position = CGPoint(x: screenWidth/4+140, y:screenWidth*scale1+10+scale2*screenWidth/8)
        mapbutton.setImage(UIImage.init(named: "map"), for: UIControl.State.normal)
        mapbutton.addTarget(self, action: #selector(mapbuttonEvent(_:count:)), for: UIControl.Event.touchUpInside)
        scrollView.addSubview(mapbutton)
        
        //calendar
        let calendarrect:CGRect = CGRect(x: screenWidth/4+220, y: screenWidth*scale1+10+scale2*screenWidth/8, width: self.view.frame.width/6, height: self.view.frame.width/6)
        calendarbutton.frame = calendarrect;
        // 任意の場所に設置する
        calendarbutton.layer.position = CGPoint(x: screenWidth/4+220, y:screenWidth*scale1+10+scale2*screenWidth/8)
        calendarbutton.setImage(UIImage.init(named: "calendar"), for: UIControl.State.normal)
        calendarbutton.addTarget(self, action: #selector(calendarbuttonEvent(_:count:)), for: UIControl.Event.touchUpInside)
        scrollView.addSubview(calendarbutton)
        
        
        // TextView生成する.
        let myTextView1: UITextView = UITextView(frame: CGRect(x:0, y:screenWidth*scale1+20+screenWidth/4, width: screenWidth, height: scale2*screenWidth/7))
        // TextViewの背景を黃色に設定する.
        myTextView1.backgroundColor = UIColor.black
        // 表示させるテキストを設定する.
        myTextView1.text = " 株式会社○○ 代表取締役社長 〇〇 〇〇"
        myTextView1.font = UIFont(name: "Hiragino Sans", size: CGFloat(15))
        // フォントの色の設定をする.
        myTextView1.textColor = UIColor.white
        // 左詰めの設定をする.
        myTextView1.textAlignment = NSTextAlignment.left
        // テキストを編集不可にする.
        myTextView1.isEditable = false
        //スクロールさせない
        myTextView1.isScrollEnabled = false
        // TextViewをViewに追加する.
       scrollView.addSubview(myTextView1)
        
        //MOVIEラベル
        let label = UILabel()
        label.frame = CGRect(x:0, y:screenWidth*scale1+60+screenWidth/4, width:screenSize.width, height:30)
        label.text = "MOVIE"
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.layer.borderWidth = 2.0   // 枠線の幅（0なので表示なし）
        label.layer.borderColor = UIColor.white.cgColor // 枠線の色
        scrollView.addSubview(label)
        
        //生成したcollectionViewのdataSourceとdelegteを紐づける
        collectionView.dataSource = self as UICollectionViewDataSource
        collectionView.delegate = self as UICollectionViewDelegate
        scrollView.addSubview(collectionView)
        // Do any additional setup after loading the view.
        
        /**   TabBarを設置   **/
        //デフォルトは49
        let tabBarHeight:CGFloat = 58
        myTabBar = MyTabBar()
        myTabBar.frame = CGRect(x:0,y:height - tabBarHeight,width:width,height:tabBarHeight)
        //バーの色①
        myTabBar.barTintColor = UIColor.black
        //選択されていないボタンの色②
        myTabBar.unselectedItemTintColor = UIColor.white
        //ボタンを押した時の色③
        myTabBar.tintColor = UIColor.cyan
        
        //ボタンを生成
        let top:UITabBarItem = UITabBarItem(title: "top", image: UIImage(named: "top30"), tag: 1)
        let search:UITabBarItem = UITabBarItem(title: "search", image: UIImage(named: "search30"), tag: 2)
        let account:UITabBarItem = UITabBarItem(title: "account", image: UIImage(named: "account30"), tag: 3)
        let calendar:UITabBarItem = UITabBarItem(title: "calendar", image: UIImage(named: "calendar30"), tag: 4)
        let map:UITabBarItem = UITabBarItem(title: "map", image: UIImage(named: "map30"), tag: 5)
        //ボタンをタブバーに配置する
        myTabBar.items = [top,search,account,calendar,map]
        //デリゲートを設定する
        myTabBar.delegate = self
        
        self.view.addSubview(myTabBar)
        
        //左スワイプ 
        let leftSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(self.leftViewDidAppear(_:)))
        leftSwipeGesture.direction = .left
        // 画面にジェスチャーを登録
        self.view.addGestureRecognizer(leftSwipeGesture)
    }
    
    @objc func leftViewDidAppear(_ animated: Bool) {
        // 次の遷移先のViewControllerインスタンスを生成する
        let vc = EditingArticleViewController()
        vc.modalTransitionStyle = .flipHorizontal
        vc.modalPresentationStyle = .fullScreen
        // presentViewControllerメソッドで遷移する
        // ここで、animatedをtrueにするとアニメーションしながら遷移できる
        self.present(vc, animated: true, completion: nil)
    }
    //ブックマークのbuttonを押すと呼ばれる
    @objc func bookmarkbuttonEvent(_ sender: UIButton,count:Int) {
        //まだブックマークしていないなら
        if self.bookmarkcount == 0 {
            self.bookmarkcount = 1
            bookmarkbutton.setImage(UIImage.init(named: "bookmarkON"), for: UIControl.State.normal)
            //self.bookmarkbutton.backgroundColor = UIColor.red
            //self.bookmarkbutton.setTitle("ブックマーク済み", for: .normal)
            //self.bookmarkbutton.setTitle("ブックマークを解除する", for: .highlighted)
        }else{
        //すでにブックマーク済みなら
            self.bookmarkcount = 0
            bookmarkbutton.setImage(UIImage.init(named: "bookmarkOFF"), for: UIControl.State.normal)
            //self.bookmarkbutton.backgroundColor = UIColor.orange
            //self.bookmarkbutton.setTitle("ブックマーク", for: .normal)
            //self.bookmarkbutton.setTitle("ブックマークする", for: .highlighted)
        }
    }
    @objc func mapbuttonEvent(_ sender: UIButton,count:Int) {
        let vc = MapViewController()
        vc.modalPresentationStyle = .fullScreen
        //vc.modalTransitionStyle = .flipHorizontal
        self.present(vc,animated: false,completion: nil)
        
    }
    @objc func calendarbuttonEvent(_ sender: UIButton,count:Int) {
        let vc = CalendarViewController()
        vc.modalPresentationStyle = .fullScreen
        //vc.modalTransitionStyle = .flipHorizontal
        self.present(vc,animated: false,completion: nil)
    }
    //タブバーを押すと呼ばれる
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        switch item.tag{
        case 1:
            let pageController:UIPageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
            let navigationController:SwipeNavigationViewController = SwipeNavigationViewController(rootViewController: pageController)
                      
                      //これがないと上に隙間ができる
            pageController.automaticallyAdjustsScrollViewInsets = false
                      
            let firstView:UIViewController =  FirstViewController()
            let secondView:UIViewController =  SecondViewController()
            let thirdView:UIViewController = ThirdViewController()

            navigationController.viewControllerArray = [firstView,secondView,thirdView]
            navigationController.modalPresentationStyle = .fullScreen
            present(navigationController, animated: true, completion: nil)
        case 2:
            let vc = SearchViewController()
            vc.modalPresentationStyle = .fullScreen
            //vc.modalTransitionStyle = .flipHorizontal
            self.present(vc,animated: false,completion: nil)
        case 3:
            let vc = AccountViewController()
            vc.modalPresentationStyle = .fullScreen
            //vc.modalTransitionStyle = .flipHorizontal
            self.present(vc,animated: false,completion: nil)
        case 4:
            let vc = CalendarViewController()
            vc.modalPresentationStyle = .fullScreen
            //vc.modalTransitionStyle = .flipHorizontal
            self.present(vc,animated: false,completion: nil)
        case 5:
            let vc = MapViewController()
            vc.modalPresentationStyle = .fullScreen
            //vc.modalTransitionStyle = .flipHorizontal
            self.present(vc,animated: false,completion: nil)
        default : return
               
           }
       }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
}
//cellに与える情報の設定
extension CompanyAccountViewController: UICollectionViewDataSource {
    
    //cellの個数設定
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return SecondViewController.movieimage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CompanyCollectionViewCell", for: indexPath) as! CompanyCollectionViewCell
        
        //let cellText = fruits[indexPath.item]
        //アイコン画像
        let cellImage = SecondViewController.movieimage[indexPath.row]
        /*
        let newImage = resizeImage(image: cellImage, toTheSize: CGSize(width: 30, height: 30))
        let cellImageLayer: CALayer?  = cell.imageView?.layer
        cellImageLayer!.cornerRadius = 15
        cellImageLayer!.masksToBounds = true
        */
        cell.setUpContents(image: cellImage)
        
        
        return cell
    }
}

//イベントの設定(何もなければ記述の必要なし)
extension CompanyAccountViewController: UICollectionViewDelegate {
    
}

//cellのサイズの設定
extension CompanyAccountViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        //ここでは画面の横サイズの半分の大きさのcellサイズを指定
        return CGSize(width: screenSize.width / 3.0, height: 1.618*(screenSize.width / 3.0))
    }
}
