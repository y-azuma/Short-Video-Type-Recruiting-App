//
//  SearchViewController.swift
//  JobTokApp1
//
//  Created by 東　雄大 on 2019/08/25.
//  Copyright © 2019 Azuma Yudai. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController,UITabBarDelegate,UISearchBarDelegate {
    var ImageView: UIImageView!
    var mySearchBar: UISearchBar!
    var myLabel : UILabel!
    private var myTabBar: MyTabBar!
    
    let sectionName = [["おすすめ"], ["IT"], ["コンサル"]]
    let data = [["〇〇株式会社", "〇〇", "〇〇"], ["〇〇○", "〇〇〇〇", "〇〇・〇〇"], ["〇〇", "〇〇", "〇〇"]]
    let photo = [["jobtokimage5", "jobtokimage6", "jobtokimage7"], ["jobtokimage8", "jobtokimage9", "jobtokimage10"], ["jobtokimage11", "jobtokimage12", "jobtokimage13"]]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black
        
        
        //サーチバー作成
        mySearchBar = UISearchBar()
        //UISearchBarBackgroundを削除
        //let barImageView = mySearchBar.value(forKey: "_background") as! UIImageView
        //barImageView.removeFromSuperview()
        mySearchBar.backgroundColor = UIColor.black
        mySearchBar.delegate = self
        mySearchBar.frame = CGRect(x: 0, y: 0, width: 300, height: 50)
        mySearchBar.layer.position = CGPoint(x: self.view.bounds.width/2, y: 50)
        mySearchBar.showsCancelButton = true
        mySearchBar.placeholder = "検索"
        self.view.addSubview(mySearchBar)
        
        /*
        let BoundSize_w:CGFloat = UIScreen.main.bounds.width
        let BoundSize_h:CGFloat = UIScreen.main.bounds.height
        let image = UIImage(named:"jobtokimage11")
        ImageView = UIImageView(frame: CGRect(x:0,y:0,width:
            BoundSize_w,height: BoundSize_h))
        ImageView.image = image
        ImageView.layer.position = CGPoint(x: BoundSize_w/2, y:BoundSize_h/2 )
        view.addSubview(ImageView)
        */
        
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
        let top:UITabBarItem = UITabBarItem(title: "top", image: UIImage(named: "top30"), tag: 1)
        let search:UITabBarItem = UITabBarItem(title: "search", image: UIImage(named: "search30"), tag: 2)
        let account:UITabBarItem = UITabBarItem(title: "account", image: UIImage(named: "account30"), tag: 3)
        let calendar:UITabBarItem = UITabBarItem(title: "event", image: UIImage(named: "calendar30"), tag: 4)
        //ボタンをタブバーに配置する
        myTabBar.items = [top,search,account,calendar]
        //デリゲートを設定する
        myTabBar.delegate = self
        
        self.view.addSubview(myTabBar)
        
        // UICollectionViewを生成
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 70, width: self.view.frame.size.width, height: self.view.frame.size.height-130), collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = UIColor.white
        collectionView.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.register(SearchCollectionViewHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "Header")
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        self.view.addSubview(collectionView)
        
        }
    //サーチバー更新時(UISearchBarDelegateを関連づけておく必要があります）
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    }
    //キャンセルクリック時_ (UISearchBarDelegateを関連づけておく必要があります）
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        mySearchBar.text = ""
        self.mySearchBar.endEditing(true)
    }
    //サーチボタンクリック時_ (UISearchBarDelegateを関連づけておく必要があります）
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        mySearchBar.text = ""
        self.view.endEditing(true)
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
    //他の場所を押すとキーボードが閉じる
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
extension SearchViewController: UICollectionViewDelegate {
    // セル選択時の処理
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(data[indexPath.section][indexPath.row])
    }
}

extension SearchViewController: UICollectionViewDataSource {
    // セルの数を返す
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.data[section].count
    }
    
    // ヘッダーの数
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    // セルの設定
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell",for: indexPath as IndexPath) as! SearchCollectionViewCell
        let cellImage = UIImage(named: photo[indexPath.section][indexPath.item])!
        let cellText = data[indexPath.section][indexPath.item]
        cell.setUpContents(image: cellImage,textName: cellText)
        return cell
    }
    
    // ヘッダーの設定
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let collectionViewHeader = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "Header", for: indexPath) as! SearchCollectionViewHeader
        let headerText = sectionName[indexPath.section][indexPath.item]
        collectionViewHeader.setUpContents(titleText: headerText)
        return collectionViewHeader
    }
}

extension SearchViewController:  UICollectionViewDelegateFlowLayout {
    // セルの大きさ
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height:80)
    }
    
    // セルの余白
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 5, bottom: 100, right: 25)
    }
    
    // ヘッダーのサイズ
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: self.view.frame.size.width, height:50)
    }
}
