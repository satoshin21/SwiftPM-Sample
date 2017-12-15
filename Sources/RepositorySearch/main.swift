
import Foundation
import Core

private func main(args: [String]) {
    let args = args.dropFirst()
    guard let query = args.first, !query.isEmpty else {

        print("ERROR: please input query")
        exit(1)
    }

    let res = GitHub.requestRepositories(q: query)
    switch res {
    case .success(let repositories):

        print(repositories.reduce("") { "\($0)\($1)\n"})
    case .failure(let e):

        print("ERROR: \(e.localizedDescription)")
        exit(1)
    }

    exit(0)
}

print("\(CommandLine.arguments[0])")
main(args: CommandLine.arguments)
