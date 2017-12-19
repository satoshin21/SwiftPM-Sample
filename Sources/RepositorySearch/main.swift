
import Foundation
import Core
import Basic
import Utility

private func main(query: String) {

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

do {
    // CLIツールについての説明
    let parser = ArgumentParser(commandName: "RepositorySearch", usage: "query [--query swift]", overview: "It's a just sample for swift package manager.")

    // --query オプションを追加
    let queryArg = parser.add(option: "--query", shortName: "-q", kind: String.self, usage: "A word what you want to search repository in GitHub.com", completion: .none)

    // 引数をパースしてクエリを取得
    let args = Array(CommandLine.arguments.dropFirst())
    let result = try parser.parse(args)
    guard let query = result.get(queryArg) else {

        throw ArgumentParserError.expectedArguments(parser, ["query"])
    }

    // 実行
    main(query: query)

} catch ArgumentParserError.expectedValue(let value) {
    print("Missing value for argument \(value).")
} catch ArgumentParserError.expectedArguments(let parser, _) {

    parser.printUsage(on: stdoutStream)
} catch {
    print(error.localizedDescription)
}
