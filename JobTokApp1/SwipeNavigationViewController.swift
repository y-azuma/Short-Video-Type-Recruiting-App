//
//  SwipeNavigationViewController.swift
//  JobTokApp1
//
//  Created by 東　雄大 on 2019/10/11.
//  Copyright © 2019 Azuma Yudai. All rights reserved.
//

import UIKit

class SwipeNavigationViewController: UINavigationController ,UIPageViewControllerDelegate,UIPageViewControllerDataSource,UIScrollViewDelegate{
    
    required override init(nibName nibNameOrNil:String?,bundle nibBundleOrNil:Bundle?){
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    required override init(rootViewController:UIViewController){
        super.init(rootViewController:rootViewController)
    }
    
    var pageScrollView:UIScrollView!
    var viewControllerArray:[UIViewController] = []
    var pageController:UIPageViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.setupPageViewController()
        self.setupView()
    }
    
    //PageViewControllerのセットアップ
    func setupPageViewController(){
        //NavigationControllerのtopViewControllerを生成
        pageController = self.topViewController as? UIPageViewController
        
        //デリゲートを設定
        pageController.delegate = self
        pageController.dataSource = self
        
        //ページコントローラーにビューコントローラーを設定
        pageController.setViewControllers([viewControllerArray[0]], direction: .forward, animated: true, completion: nil)
        
        
        self.syncScrollView()
    }
    
    func syncScrollView(){
        for view in pageController.view.subviews{
            if view.isKind(of:UIScrollView.self){
                pageScrollView = view as? UIScrollView
                pageScrollView.delegate = self
            }
        }
    }
    
    //固定して表示するもの
    var closeBtn:UIButton!
    func setupView() {
        closeBtn = UIButton()
        closeBtn.frame = CGRect(x:10,y:10,width:50,height:50)
        closeBtn.setTitle("×", for: .normal)
        closeBtn.addTarget(self,action:#selector(SwipeNavigationViewController.closeBtnTapped(sender:)),for:.touchUpInside)
        pageController.view.addSubview(closeBtn)
    }
    @objc func closeBtnTapped(sender:UIButton){
        dismiss(animated: true, completion: nil)
    }
    
    //左にスワイプしたとき(ページが進む)
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index:Int = self.indexOfController(viewController:viewController)
        if(index == NSNotFound){
            return nil
        }
        index += 1
        if(0 <= index && index < viewControllerArray.count){
            return viewControllerArray[index]
        }
        return nil
    }
    
    //右にスワイプしたとき(ページが戻る)
    func pageViewController(_ pageViewController:UIPageViewController,viewControllerBefore viewController:UIViewController) -> UIViewController?{
        var index:Int = self.indexOfController(viewController:viewController)
        if(index == NSNotFound){
            return nil
        }
        index -= 1
        if(0 <= index && index < viewControllerArray.count){
            return viewControllerArray[index]
        }
        return nil
    }
    
    //viewControllerのindexを返す
    func indexOfController(viewController:UIViewController) -> Int{
        for i in 0 ..< viewControllerArray.count{
            if(viewController == viewControllerArray[i]){
                return i
            }
        }
        return NSNotFound
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
