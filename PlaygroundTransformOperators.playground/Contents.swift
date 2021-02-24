import UIKit
import RxSwift

example(of: "map") {
    
    let disposeBag = DisposeBag()
    
    Observable.from(episodes)
        .map {
            var components = $0.components(separatedBy: " ")
            let number = NSNumber(value: try! components[1].romanNumeralIntValue())
            let numberString = String(describing: number)
            components[1] = numberString
            return components.joined(separator: " ")
        }
        .subscribe(onNext: {
            print($0)
        })
        .disposed(by: disposeBag)
}
