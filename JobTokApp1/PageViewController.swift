//
//  PageViewController.swift
//  JobTokApp1
//
//  Created by 東　雄大 on 2019/08/20.
//  Copyright © 2019 Azuma Yudai. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setViewControllers([getFirst()], direction:.forward, animated: true, completion: nil)
        self.dataSource =  self
        
        

        // Do any additional setup after loading the view.
    }
    
    func getFirst() -> FirstViewController{
        return storyboard!.instantiateViewController(withIdentifier: "FirstViewController") as! FirstViewController
        
    }
    func getSecond() ->SecondViewController{
        return storyboard!.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
    }
    func getThird() ->ThirdViewController{
        return storyboard!.instantiateViewController(withIdentifier: "ThirdViewController") as!
        ThirdViewController
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
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
extension PageViewController : UIPageViewControllerDataSource{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
            if viewController.isKind(of: ThirdViewController.self){
                return getSecond()
            } else if viewController.isKind(of: SecondViewController.self){
                return getFirst()
            }else{
                return nil
            }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if viewController.isKind(of: FirstViewController.self){
            return getSecond()
        } else if viewController.isKind(of: SecondViewController.self){
            return getThird()
        }else{
            return nil
        }
    }
    
   
    
}

