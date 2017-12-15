//
//  CoreTests.swift
//  RepositorySearchPackageDescription
//
//  Created by Satoshi Nagasaka on 2017/12/15.
//

import XCTest
@testable import Core

class CoreTests: XCTestCase {

    func testGitHubError() {

        XCTAssertEqual(GitHub.Error.request.localizedDescription, "request failed")
        XCTAssertEqual(GitHub.Error.jsonParse.localizedDescription, "json parsing failed")
        XCTAssertEqual(GitHub.Error.unexpected.localizedDescription, "unexpected error")
    }
}
