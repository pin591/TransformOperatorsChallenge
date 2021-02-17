import UIKit
import RxSwift


public func example(of description: String, action: () -> Void) {
    print ("\n---- Example of:", description, "-----")
    action()
}

example(of: "ignoreElements") {
    
    let diposeBag = DisposeBag()
    
    let cannedProjects = PublishSubject<String>()
    
    cannedProjects
        .ignoreElements()
        .subscribe() {
            print($0)
        }.disposed(by: diposeBag)
    
    cannedProjects.onNext("landOfDroids")
    cannedProjects.onNext("wookieWorld")
    cannedProjects.onNext("detours")
    cannedProjects.onCompleted()
}






