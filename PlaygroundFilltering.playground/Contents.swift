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
    
    cannedProjects.onNext("land of droids")
    cannedProjects.onNext("wookie world")
    cannedProjects.onNext("detours")
    cannedProjects.onCompleted()
}

example(of: "elementAt") {
    
    let disposeBag = DisposeBag()
    
    let quotes = PublishSubject<String>()
    quotes
        .elementAt(1)
        .subscribe(onNext: {
            print($0)
        })
        .disposed(by: disposeBag)
    
    quotes.onNext("may the odds")
    quotes.onNext("live long and prosper")
    quotes.onNext("may the force")
}






