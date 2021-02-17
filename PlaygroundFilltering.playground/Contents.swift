import UIKit
import RxSwift

public let episodeI = (title: "The Phantom Menace", rating: 55)
public let episodeII = (title: "Attack of the Clones", rating: 66)
public let episodeIII = (title: "Revenge of the Sith", rating: 79)
public let rogueOne = (title: "Rogue One", rating: 85)
public let episodeIV = (title: "A New Hope", rating: 93)
public let episodeV = (title: "The Empire Strikes Back", rating: 94)
public let episodeVI = (title: "Return Of The Jedi", rating: 80)
public let episodeVII = (title: "The Force Awakens", rating: 93)
public let episodeVIII = (title: "The Last Jedi", rating: 91)
public let tomatometerRatings = [episodeI, episodeII, episodeIII, rogueOne, episodeIV, episodeV, episodeVI, episodeVII, episodeVIII]


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

example(of: "Skip while") {
    
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






