//
//  First2ViewController.swift
//  JobTokApp1
//
//  Created by 東　雄大 on 2019/08/20.
//  Copyright © 2019 Azuma Yudai. All rights reserved.
//

import UIKit
import AVFoundation

class First2ViewController: UIViewController,UITabBarDelegate {
    private var myTabBar:MyTabBar!
    var ImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        /*
        let BoundSize_w:CGFloat = UIScreen.main.bounds.width
        let BoundSize_h:CGFloat = UIScreen.main.bounds.height
        let image = UIImage(named:"jobtokimage7")
        ImageView = UIImageView(frame: CGRect(x:0,y:0,width:
            BoundSize_w,height: BoundSize_h))
        ImageView.image = image
        ImageView.layer.position = CGPoint(x: BoundSize_w/2, y:BoundSize_h/2 )
        view.addSubview(ImageView)
        */
        
        let downSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(self.downViewDidAppear(_:)))
        downSwipeGesture.direction = .down
        //画面にジェスチャーを登録
        view.addGestureRecognizer(downSwipeGesture)
        
        let leftSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(self.leftViewDidAppear(_:)))
        leftSwipeGesture.direction = .left
        // 画面にジェスチャーを登録
        view.addGestureRecognizer(leftSwipeGesture)
        
        
        let upSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(self.upViewDidAppear(_:)))
        upSwipeGesture.direction = .up
        // 画面にジェスチャーを登録
        view.addGestureRecognizer(upSwipeGesture)
        
        
        let width = self.view.frame.width
        let height = self.view.frame.height
        //デフォルトは49
        let tabBarHeight:CGFloat = 58
        
        /**   TabBarを設置   **/
        myTabBar = MyTabBar()
        myTabBar.frame = CGRect(x:0,y:height - tabBarHeight,width:width,height:tabBarHeight)
        //バーの色①
        myTabBar.barTintColor = UIColor.black
        //選択されていないボタンの色②
        myTabBar.unselectedItemTintColor = UIColor.white
        //ボタンを押した時の色③
        myTabBar.tintColor = UIColor.cyan
        
        //ボタンを生成
        let mostRecent:UITabBarItem = UITabBarItem(tabBarSystemItem: .mostRecent, tag: 1)
        mostRecent.badgeColor = UIColor.cyan
        let downloads:UITabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 2)
        let favorites:UITabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 3)
        let bookmarks:UITabBarItem = UITabBarItem(tabBarSystemItem:.bookmarks ,tag:4)
        let more:UITabBarItem = UITabBarItem(tabBarSystemItem: .more,tag:5)
        //ボタンをタブバーに配置する
        myTabBar.items = [mostRecent,downloads,favorites,bookmarks,more]
        //デリゲートを設定する
        myTabBar.delegate = self
        
        self.view.addSubview(myTabBar)
        // 動画ファイルのURLを取得
        let url = URL(string:"https://d2qguwbxlx1sbt.cloudfront.net/TextInMotion-VideoSample-576p.mp4")
        
        // 生成
        let player = AVPlayer(url: url!)
        
        // レイヤーの追加
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.view.bounds
        self.view.layer.addSublayer(playerLayer)
        
        // 再生
        player.play()
        
    }
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        switch item.tag{
        case 1:
            print("１")
        case 2:
            let vc = SearchViewController()
            vc.modalTransitionStyle = .flipHorizontal
            self.present(vc,animated: true,completion: nil)
        case 3:
            let vc = AccountViewController()
            vc.modalTransitionStyle = .flipHorizontal
            self.present(vc,animated: true,completion: nil)
        case 4:
            print("４")
        case 5:
            print("５")
        default : return
            
        }
    }
    @objc func downViewDidAppear(_ animated: Bool) {
        
        // 戻る場合には、dismissViewControllerAnimatedメソッドを使います。
        // ここで、animatedをtrueにするとアニメーションしながら遷移できる
        self.dismiss(animated: true, completion: nil)
    }
    @objc func leftViewDidAppear(_ animated: Bool) {
        // 次の遷移先のViewControllerインスタンスを生成する
        let vc = Second2ViewController()
        vc.modalTransitionStyle = .flipHorizontal
        // presentViewControllerメソッドで遷移する
        // ここで、animatedをtrueにするとアニメーションしながら遷移できる
        self.present(vc, animated: true, completion: nil)
    }
    @objc func upViewDidAppear(_ animated: Bool) {
        
        // 次の遷移先のViewControllerインスタンスを生成する
        let vc = First3ViewController()
        vc.modalTransitionStyle = .coverVertical
        // presentViewControllerメソッドで遷移する
        // ここで、animatedをtrueにするとアニメーションしながら遷移できる
        self.present(vc, animated: true, completion: nil)
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
