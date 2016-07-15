//
//  ViewController.swift
//  Moya-Practice
//
//  Created by Popeye Lau on 16/7/14.
//  Copyright © 2016年 Popeye. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

	let disposeBag = DisposeBag()

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	@IBAction func getTouchUpInside(sender: UIButton) {
		RxHTTPBinProvider.request(.Get).subscribe(
			onNext: { (response) in
				if let result = HTTPBinGetModel.yy_modelWithJSON(response.data) {
					debugPrint(result.yy_modelDescription())
				}
			},
			onError: { (error) in
				debugPrint(error)
		}).addDisposableTo(disposeBag)

	}

	@IBAction func postTouchUpInside(sender: UIButton) {

		let params: Dictionary<String, AnyObject> = ["Languange": ["Swift", "Java", "Objective-C"]]

		RxHTTPBinProvider.request(.Post(params)).subscribe(
			onNext: { (response) in
				do { let json: Dictionary? = try response.mapJSON() as? Dictionary<String, AnyObject>
					debugPrint(json)
				} catch {
					debugPrint(error)
				}
			},
			onError: { (error) in
				debugPrint(error)
		}).addDisposableTo(disposeBag)

	}
}

