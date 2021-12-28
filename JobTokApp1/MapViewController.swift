//
//  MapViewController.swift
//  JobTokApp1
//
//  Created by 東　雄大 on 2019/09/06.
//  Copyright © 2019 Azuma Yudai. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController,UITextFieldDelegate ,UITabBarDelegate{
    static var myTextField: UITextField!
    private var displayMap:MKMapView = MKMapView()
    private var myTabBar:MyTabBar!
    static var searchKeyword = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black
        //画面の幅、高さを取得
        let width = self.view.frame.width
        let height = self.view.frame.height
        
        //MKMapviewを作成する
        displayMap = MKMapView(frame: CGRect(x:0, y:0, width:width, height:height))
        self.view.addSubview(displayMap)
        // UITextFieldを作成する.
        MapViewController.myTextField = UITextField(frame: CGRect(x: 0,y: 0,width: 300,height: 20))
        // 表示する文字を代入する.
        MapViewController.myTextField.text = ""
        // Delegateを設定する.
        MapViewController.myTextField.delegate = self
        // 枠を表示する.
        MapViewController.myTextField.borderStyle = UITextField.BorderStyle.roundedRect
        // UITextFieldの表示する位置を設定する.
        MapViewController.myTextField.layer.position = CGPoint(x:self.view.bounds.width/2,y:30);
        // Viewに追加する.
        self.view.addSubview(MapViewController.myTextField)
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
        }
    //他の場所を押すとキーボードが閉じる
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
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
        case 5:
            let vc = MapViewController()
            vc.modalPresentationStyle = .fullScreen
            //vc.modalTransitionStyle = .flipHorizontal
            self.present(vc,animated: false,completion: nil)
        default : return
            
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        MapViewController.searchKeyword = textField.text!
        
        print(MapViewController.searchKeyword)
        
        let geocoder = CLGeocoder()
        
        geocoder.geocodeAddressString(MapViewController.searchKeyword, completionHandler: { (placemarks:[CLPlacemark]?, error:Error?) in
            
            if let placemark = placemarks?[0] {
                if let targetCoordinate = placemark.location?.coordinate {
                    print(targetCoordinate)
                    
                    let pin = MKPointAnnotation()
                    pin.coordinate = targetCoordinate
                    pin.title = MapViewController.searchKeyword
                    
                    self.displayMap.addAnnotation(pin)
                    self.displayMap.region = MKCoordinateRegion(center: targetCoordinate,latitudinalMeters: 500.0,longitudinalMeters: 500.0)
                }
            }
        })
        return true
    }
    
}
