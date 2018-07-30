//
//  AnimationsExampleController.swift
//  swift_D
//
//  Created by idea on 2018/7/30.
//  Copyright © 2018年 idea. All rights reserved.
//

import UIKit
import Macaw
class AnimationsExampleController: UIViewController {

    var animView:AnimationsView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animView = AnimationsView()
        animView.bg(kWhiteColor).makeCons { (make) in
            make.edge.equal(0)
        }.addTo(self.view)

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        animView?.onComplete = {
//            self.actionButton?.isEnabled = true
//        }
        animView?.prepareAnimation()
        
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        startAnimationAction()

    }
    @objc func startAnimationAction() {
        animView?.startAnimation()
//        actionButton?.isEnabled = false
    }


}
