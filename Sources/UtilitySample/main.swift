//
//  main.swift
//  RepositorySearchPackageDescription
//
//  Created by Satoshi Nagasaka on 2017/12/19.
//

import Foundation
import Basic
import Utility

guard let stdout = stdoutStream as? LocalFileOutputByteStream else {

    exit(1)
}

let progressBar = createProgressBar(forStream: stdoutStream, header: "Loaging")

for i in 1...100 {

    let text: String = {
        switch i {
        case ..<30:
            return "Hoge"
        case ..<60:
            return "Foo"
        default:
            return "Bar"

        }
    }()
    progressBar.update(percent: i, text: text)
    Thread.sleep(forTimeInterval: 0.03)
}

progressBar.complete()
print("Completed!")

// MARK: - TerminalController
guard let tc = TerminalController(stream: stdout) else {

    exit(1)
}

tc.write("Hoge\n", inColor: .red, bold: true)
tc.write("Foo\n", inColor: .yellow, bold: true)
tc.write("Bar\n", inColor: .green, bold: true)

