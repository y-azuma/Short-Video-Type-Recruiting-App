//
//  StudentViewController.swift
//  JobTokApp1
//
//  Created by 東　雄大 on 2019/10/10.
//  Copyright © 2019 Azuma Yudai. All rights reserved.
//

import UIKit

class StudentAccountViewController: UIViewController,UITabBarDelegate {
    //tabbar
    private var myTabBar:MyTabBar!
        
    let image = [UIImage(named:"iconA")!,UIImage(named:"a")!,UIImage(named:"b")!,UIImage(named:"c")!,UIImage(named:"d")!,UIImage(named:"e")!]
    let text = ["","〇〇　〇〇","〇〇卒","〇〇大学○学部〇〇学科〇〇専攻","京都","IT志望"]
        
        let collectionView: UICollectionView = {
            //セルのレイアウト設計
            let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
            //各々の設計に合わせて調整
            layout.scrollDirection = .vertical
            layout.minimumInteritemSpacing = 0
            layout.minimumLineSpacing = 0
            
            //ヘッダーの高さを測る
            // UIImage インスタンスの生成
            let headerimage:UIImage = UIImage(named:"jobtokimage14")!
            // UIImageView 初期化
            let headerimageView = UIImageView(image:headerimage)
            // 画像の縦横サイズを取得
            let headerimgWidth:CGFloat = headerimage.size.width
            let headerimgHeight:CGFloat = headerimage.size.height
            // 画像サイズをスクリーン幅に合わせる
            let headerimagescale:CGFloat = headerimgHeight / headerimgWidth
            // スクリーンの縦横サイズを取得
            let screenWidth:CGFloat = UIScreen.main.bounds.size.width
            let screenHeight:CGFloat = UIScreen.main.bounds.size.height
            
            
            let collectionView = UICollectionView( frame: CGRect(x:0 , y:screenWidth*headerimagescale, width: screenSize.width, height:screenSize.height*2 ), collectionViewLayout: layout)
            collectionView.backgroundColor = UIColor.black
            //セルの登録
            collectionView.register(StudentCollectionViewCell.self, forCellWithReuseIdentifier: "StudentCollectionViewCell")
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
            scrollView.contentSize = CGSize(width:screenWidth, height:screenHeight*2)
            //scrollViewをviewのSubViewとして追加
            self.view.addSubview(scrollView)
            
            //ヘッダー
            // UIImage インスタンスの生成
            let headerimage:UIImage = UIImage(named:"jobtokimage14")!
            // UIImageView 初期化
            let headerimageView = UIImageView(image:headerimage)
            // 画像の縦横サイズを取得
            let headerimgWidth:CGFloat = headerimage.size.width
            let headerimgHeight:CGFloat = headerimage.size.height
            // 画像サイズをスクリーン幅に合わせる
            let headerimagescale:CGFloat = headerimgHeight / headerimgWidth
            let headerimagerect:CGRect =
                CGRect(x:0, y:0, width:screenWidth, height:screenWidth*headerimagescale)
            // ImageView frame をCGRectで作った矩形に合わせる
            headerimageView.frame = headerimagerect;
            // UIImageViewのインスタンスをビューに追加
            scrollView.addSubview(headerimageView)
            
            
            // Do any additional setup after loading the view.
            //生成したcollectionViewのdataSourceとdelegteを紐づける
            collectionView.dataSource = self as UICollectionViewDataSource
            collectionView.delegate = self as UICollectionViewDelegate
            scrollView.addSubview(collectionView)
            
            let scrollheight = screenWidth*headerimagescale+screenSize.width*3/2+58
            scrollView.contentSize = CGSize(width: screenWidth, height: scrollheight)
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
            let calendar:UITabBarItem = UITabBarItem(title: "event", image: UIImage(named: "calendar30"), tag: 4)
            //ボタンをタブバーに配置する
            myTabBar.items = [top,search,account,calendar]
            //デリゲートを設定する
            myTabBar.delegate = self
            
            self.view.addSubview(myTabBar)
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
    extension StudentAccountViewController: UICollectionViewDataSource {
        
        //cellの個数設定
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 6//SecondViewController.movieimage.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StudentCollectionViewCell", for: indexPath) as! StudentCollectionViewCell
            
            //let cellText = fruits[indexPath.item]
            //アイコン画像
            let cellImage = image[indexPath.row]
            let cellLabel = text[indexPath.row]
            /*
            let newImage = resizeImage(image: cellImage, toTheSize: CGSize(width: 30, height: 30))
            let cellImageLayer: CALayer?  = cell.imageView?.layer
            cellImageLayer!.cornerRadius = 15
            cellImageLayer!.masksToBounds = true
            */
            cell.setUpContentsimage(image:cellImage)
            cell.setUpContentslabel(text: cellLabel)
            
            
            return cell
        }
    }

    //イベントの設定(何もなければ記述の必要なし)
    extension StudentAccountViewController: UICollectionViewDelegate {
        
    }

    //cellのサイズの設定
    extension StudentAccountViewController: UICollectionViewDelegateFlowLayout {
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            
            //ここでは画面の横サイズの半分の大きさのcellサイズを指定
            return CGSize(width: screenSize.width / 2.0, height: screenSize.width / 2.0)
        }
    }

