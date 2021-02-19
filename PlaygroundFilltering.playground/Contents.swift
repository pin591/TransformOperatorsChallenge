import UIKit
import RxSwift

public let episodeI = (title: "I-The Phantom Menace", rating: 55)
public let episodeII = (title: "II-Attack of the Clones", rating: 66)
public let episodeIII = (title: "III-Revenge of the Sith", rating: 79)
public let rogueOne = (title: "IV-Rogue One", rating: 85)
public let episodeIV = (title: "V-A New Hope", rating: 93)
public let episodeV = (title: "VI-The Empire Strikes Back", rating: 94)
public let episodeVI = (title: "VII-Return Of The Jedi", rating: 80)
public let episodeVII = (title: "VIII-The Force Awakens", rating: 93)
public let episodeVIII = (title: "IX-The Last Jedi", rating: 91)
public let tomatometerRatings = [episodeI, episodeII, episodeIII, rogueOne, episodeIV, episodeV, episodeVI, episodeVII, episodeVIII]


public enum Droid {
  case C3PO, R2D2
}

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

example(of: "filter") {
    
    let disposeBag = DisposeBag()
    
    Observable.from(tomatometerRatings)
        .filter { movie in
            movie.rating >= 80
        }
        .subscribe(onNext: {
            print($0)
        })
        .disposed(by: disposeBag)
}

example(of: "skip") {
    let diposeBag = DisposeBag()
    
    Observable.from(tomatometerRatings)
        .skip(4)
        .subscribe(onNext: {
                    print($0)
        })
        .disposed(by: diposeBag)
}


example(of: "take") {
    let diposeBag = DisposeBag()
    
    Observable.from(tomatometerRatings)
        .take(5)
        .subscribe(onNext: {
                    print($0)
        })
        .disposed(by: diposeBag)
}

example(of: "skipWhile") {
    
    let diposeBag = DisposeBag()
    Observable.from(tomatometerRatings)
        .skipWhile { movie in
            movie.rating < 90
        }
        .subscribe(onNext:  {
            print($0)
        })
        .disposed(by: diposeBag)
}

example(of: "takeWhile") {
    
    let diposeBag = DisposeBag()
    Observable.from(tomatometerRatings)
        .takeWhile { movie in
            movie.rating < 90
        }
        .subscribe(onNext:  {
            print($0)
        })
        .disposed(by: diposeBag)
}

example(of: "skipUntil") {
    
    let diposebag = DisposeBag()
    
    let subject = PublishSubject<String>()
    let trigger = PublishSubject<Void>()
    
    subject
        .skipUntil(trigger)
        .subscribe(onNext: {
            print($0)
        })
        .disposed(by: diposebag)
    
    subject.onNext(episodeI.title)
    subject.onNext(episodeII.title)
    subject.onNext(episodeIII.title)
    
    trigger.onNext(())

    subject.onNext(episodeIV.title)
    subject.onNext(episodeV.title)
    subject.onNext(episodeVI.title)
}

example(of: "takeUntil") {
    
    let diposebag = DisposeBag()
    
    let subject = PublishSubject<String>()
    let trigger = PublishSubject<Void>()
    
    subject
        .takeUntil(trigger)
        .subscribe(onNext: {
            print($0)
        })
        .disposed(by: diposebag)
    
    subject.onNext(episodeI.title)
    subject.onNext(episodeII.title)
    subject.onNext(episodeIII.title)
    
    trigger.onNext(())

    subject.onNext(episodeIV.title)
    subject.onNext(episodeV.title)
    subject.onNext(episodeVI.title)
}

example(of: "distinctUntilChange") {
    let disposeBag = DisposeBag()
    
    Observable<Droid>.of(.R2D2, .C3PO,.C3PO, .R2D2)
        .distinctUntilChanged()
        .subscribe(onNext: {
            print($0)
        })
        .disposed(by: disposeBag)
}






