//
//  SonarSampleTests.swift
//  SonarSampleTests
//
//  Created by Rafael FERNANDEZ on 12/2/24.
//

import XCTest
@testable import SonarSample

final class SonarSampleTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAddProduct1() throws {
        let logic = ShoppingCartLogic()
        logic.addProduct(ProductBO.mock)
        logic.addProduct(ProductBO.mock)
        logic.addProduct(ProductBO.mock)
        
        XCTAssertEqual(logic.shoppingCartProducts.count, 1)
        logic.shoppingCartProducts.forEach { shoppingCartBO in
            XCTAssertEqual(shoppingCartBO.amount, 3)
        }
    }
    
    func testAddProduct2() throws {
        let logic = ShoppingCartLogic()
        logic.addProduct(ProductBO.mock)
        logic.addProduct(ProductBO.mock)
        logic.addProduct(ProductBO.mock2)
        logic.addProduct(ProductBO.mock2)
        logic.addProduct(ProductBO.mock2)
        logic.addProduct(ProductBO.mock2)
        
        XCTAssertEqual(logic.shoppingCartProducts.count, 2)
        logic.shoppingCartProducts.forEach { shoppingCartBO in
            if shoppingCartBO.product == ProductBO.mock {
                XCTAssertEqual(shoppingCartBO.amount, 2)
            } else if shoppingCartBO.product == ProductBO.mock2 {
                XCTAssertEqual(shoppingCartBO.amount, 4)
            }
        }
    }

    func testAddProduct3() throws {
        let logic = ShoppingCartLogic()
        logic.addProduct(ProductBO.mock)
        logic.addProduct(ProductBO.mock2)
        logic.addProduct(ProductBO.mock2)
        logic.addProduct(ProductBO.mock3)
        logic.addProduct(ProductBO.mock3)
        logic.addProduct(ProductBO.mock3)
        logic.addProduct(ProductBO.mock3)
        
        XCTAssertEqual(logic.shoppingCartProducts.count, 3)
        logic.shoppingCartProducts.forEach { shoppingCartBO in
            if shoppingCartBO.product == ProductBO.mock {
                XCTAssertEqual(shoppingCartBO.amount, 1)
            } else if shoppingCartBO.product == ProductBO.mock2 {
                XCTAssertEqual(shoppingCartBO.amount, 2)
            } else if shoppingCartBO.product == ProductBO.mock3 {
                XCTAssertEqual(shoppingCartBO.amount, 4)
            }
        }
    }
    
    func testAddProduct4() throws {
        let logic = ShoppingCartLogic()
        logic.addProduct(ProductBO.mock)
        logic.addProduct(ProductBO.mock2)
        logic.addProduct(ProductBO.mock2)
        logic.addProduct(ProductBO.mock3)
        logic.addProduct(ProductBO.mock3)
        logic.addProduct(ProductBO.mock3)
        logic.addProduct(ProductBO.mock3)
        logic.removeProduct(ProductBO.mock2)
        
        XCTAssertEqual(logic.shoppingCartProducts.count, 2)
        logic.shoppingCartProducts.forEach { shoppingCartBO in
            if shoppingCartBO.product == ProductBO.mock {
                XCTAssertEqual(shoppingCartBO.amount, 1)
            } else if shoppingCartBO.product == ProductBO.mock3 {
                XCTAssertEqual(shoppingCartBO.amount, 4)
            }
        }
        
    }
    
    func testAddProduct5() throws {
        let logic = ShoppingCartLogic()
        logic.addProduct(ProductBO.mock)
        logic.addProduct(ProductBO.mock2)
        logic.addProduct(ProductBO.mock2)
        logic.addProduct(ProductBO.mock3)
        logic.addProduct(ProductBO.mock3)
        logic.addProduct(ProductBO.mock3)
        logic.addProduct(ProductBO.mock3)
        logic.decreaseProduct(ProductBO.mock2)
        
        XCTAssertEqual(logic.shoppingCartProducts.count, 3)
        logic.shoppingCartProducts.forEach { shoppingCartBO in
            if shoppingCartBO.product == ProductBO.mock {
                XCTAssertEqual(shoppingCartBO.amount, 1)
            } else if shoppingCartBO.product == ProductBO.mock3 {
                XCTAssertEqual(shoppingCartBO.amount, 4)
            } else if shoppingCartBO.product == ProductBO.mock2 {
                XCTAssertEqual(shoppingCartBO.amount, 1)
            }
        }
    }
    
    func testAddProduct6() throws {
        let logic = ShoppingCartLogic()
        logic.addProduct(ProductBO.mock)
        logic.addProduct(ProductBO.mock2)
        logic.addProduct(ProductBO.mock2)
        logic.addProduct(ProductBO.mock3)
        logic.addProduct(ProductBO.mock3)
        logic.addProduct(ProductBO.mock3)
        logic.addProduct(ProductBO.mock3)
        logic.decreaseProduct(ProductBO.mock2)
        logic.decreaseProduct(ProductBO.mock3)
        
        XCTAssertEqual(logic.shoppingCartProducts.count, 3)
        logic.shoppingCartProducts.forEach { shoppingCartBO in
            if shoppingCartBO.product == ProductBO.mock {
                XCTAssertEqual(shoppingCartBO.amount, 1)
            } else if shoppingCartBO.product == ProductBO.mock3 {
                XCTAssertEqual(shoppingCartBO.amount, 3)
            } else if shoppingCartBO.product == ProductBO.mock2 {
                XCTAssertEqual(shoppingCartBO.amount, 1)
            }
        }
    }
    
    func testAddProduct7() throws {
        let logic = ShoppingCartLogic()
        logic.addProduct(ProductBO.mock)
        logic.addProduct(ProductBO.mock2)
        logic.addProduct(ProductBO.mock2)
        logic.addProduct(ProductBO.mock3)
        logic.addProduct(ProductBO.mock3)
        logic.addProduct(ProductBO.mock3)
        logic.addProduct(ProductBO.mock3)
        logic.decreaseProduct(ProductBO.mock2)
        logic.decreaseProduct(ProductBO.mock3)
        logic.decreaseProduct(ProductBO.mock3)
        
        XCTAssertEqual(logic.shoppingCartProducts.count, 3)
        logic.shoppingCartProducts.forEach { shoppingCartBO in
            if shoppingCartBO.product == ProductBO.mock {
                XCTAssertEqual(shoppingCartBO.amount, 1)
            } else if shoppingCartBO.product == ProductBO.mock3 {
                XCTAssertEqual(shoppingCartBO.amount, 2)
            } else if shoppingCartBO.product == ProductBO.mock2 {
                XCTAssertEqual(shoppingCartBO.amount, 1)
            }
        }
    }
}


