//
//  ViewController.swift
//  splashViewTest
//
//  Created by 楊智崴 on 2021/1/4.
//

import UIKit

class ViewController: UIViewController {
    
    let LaunchImage = UIImageView(image: UIImage(named: "BEATS")!)
    let splashView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        splashView.backgroundColor = UIColor.white
        view.addSubview(splashView)
        splashView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        
        LaunchImage.contentMode = .scaleAspectFit
        splashView.addSubview(LaunchImage)
        LaunchImage.frame = CGRect(x: splashView.frame.midX-120, y: splashView.frame.midY-120, width: 240, height: 240)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return UIStatusBarStyle.default
    }
    
    override func viewDidAppear(_ animated: Bool) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2){
            self.scaleDownAnimation()
        }
    }

    
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        navigationController?.pushViewController(viewControllerToCommit, animated: true)
    }
    
    //for splashview
    func scaleDownAnimation(){
        UIView.animate(withDuration: 0.5, animations: {
            self.LaunchImage.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        }){( success ) in
            self.scaleUpAnimation()
        }
    }
    
    func scaleUpAnimation(){
        UIView.animate(withDuration: 0.35, delay: 0.1, options: .curveEaseIn, animations: {
            self.LaunchImage.transform = CGAffineTransform(scaleX: 5, y: 5)
        }){( success ) in
            self.removeSplashScreen()
        }
    }
    
    func removeSplashScreen(){
        splashView.removeFromSuperview()
    }

}

