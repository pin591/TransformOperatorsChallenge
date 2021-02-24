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

example (of: "flatMap") {
    
    let disposeBag = DisposeBag()
    
    let ryan = Jedi(rank: BehaviorSubject(value: .youngling))
    let charlotte = Jedi(rank: BehaviorSubject(value: .youngling))
    
    let student = PublishSubject<Jedi>()
    
    student
        .flatMap {
            $0.rank
        }
        .subscribe(onNext: {
            print($0.rawValue)
        })
        .disposed(by: disposeBag)
    
    student.onNext(ryan)
    ryan.rank.onNext(.padawan)
    
    student.onNext(charlotte)
    
    ryan.rank.onNext(.jediKnight)
    charlotte.rank.onNext(.jediMaster)

}
