//
//  FutterToSwiftDataHelper.swift
//  Runner
//
//  Created by Mausum Nandy on 6/14/21.
//

import Foundation
import SSLCommerzSDK

class FutterToSwiftDataHelper {
    private init(){}
    private (set) var integrationInformation: IntegrationInformation!
    private (set) var emiInformation: EMIInformation?
    private (set) var customerInformation: CustomerInformation?
    private (set) var shipmentInformation: ShipmentInformation?
    private (set) var productInformation: ProductInformation?
    private (set) var additionalInformation: AdditionalInformation?
    public init (flutterData: FlutterInputDataModel){
        let storeID = flutterData.initializer?.storeId ?? ""
        let storePassword = flutterData.initializer?.storePasswd ?? ""
        let totalAmount = Double(flutterData.initializer?.totalAmount ?? 0)
        let currency = flutterData.initializer?.currency ?? ""
        let transactionId = flutterData.initializer?.tranId ?? ""
        let productCategory = flutterData.initializer?.productCategory ?? ""
        let language = flutterData.initializer?.language ?? "en"

        // Using reflection to bypass accessible initializer issues
        if let infoClass = NSClassFromString("SSLCommerzSDK.IntegrationInformation") as? NSObject.Type {
            let info = infoClass.init()
            info.setValue(storeID, forKey: "storeID")
            info.setValue(storePassword, forKey: "storePassword")
            info.setValue(totalAmount, forKey: "totalAmount")
            info.setValue(currency, forKey: "currency")
            info.setValue(transactionId, forKey: "transactionId")
            info.setValue(productCategory, forKey: "productCategory")
            info.setValue(language, forKey: "language")
            self.integrationInformation = info as? IntegrationInformation
        }
        
        if let ipnUrl = flutterData.initializer?.ipnUrl{
            (integrationInformation as AnyObject?)?.setValue(ipnUrl, forKey: "ipnURL")
        }
        if let multiCardName = flutterData.initializer?.multiCardName{
            (integrationInformation as AnyObject?)?.setValue(multiCardName, forKey: "multiCardName")
        }
        if let allowedBIN = flutterData.initializer?.allowedBin{
            (integrationInformation as AnyObject?)?.setValue(allowedBIN, forKey: "allowedBIN")
        }
        
        if let customer = flutterData.customerInfoInitializer{
            if let custClass = NSClassFromString("SSLCommerzSDK.CustomerInformation") as? NSObject.Type {
                let cust = custClass.init()
                cust.setValue(customer.customerName ?? "", forKey: "customerName")
                cust.setValue(customer.customerEmail ?? "", forKey: "customerEmail")
                cust.setValue(customer.customerAddress1 ?? "", forKey: "customerAddressOne")
                cust.setValue(customer.customerCity ?? "", forKey: "customerCity")
                cust.setValue(customer.customerPostCode ?? "", forKey: "customerPostCode")
                cust.setValue(customer.customerCountry ?? "BD", forKey: "customerCountry")
                cust.setValue(customer.customerPhone ?? "", forKey: "customerPhone")
                self.customerInformation = cust as? CustomerInformation
            }
        }
       
        if let additional = flutterData.sslcAdditionalInitializer{
             if let addClass = NSClassFromString("SSLCommerzSDK.AdditionalInformation") as? NSObject.Type {
                let add = addClass.init()
                add.setValue(additional.valueA, forKey: "paramA")
                add.setValue(additional.valueB, forKey: "paramB")
                add.setValue(additional.valueC, forKey: "paramC")
                add.setValue(additional.valueD, forKey: "paramD")
                add.setValue(additional.campaignCode, forKey: "campaignCode")
                add.setValue(additional.invoiceCode, forKey: "invoiceId")
                
                let noOfferVal = additional.noOffer ?? 0
                add.setValue(noOfferVal, forKey: "noOffer")
                self.additionalInformation = add as? AdditionalInformation
            }
        }
        if let emiInfo = flutterData.sslcemiTransactionInitializer{
            if let emiClass = NSClassFromString("SSLCommerzSDK.EMIInformation") as? NSObject.Type {
                let emi = emiClass.init()
                let rawEmi = emiInfo.emiOptions ?? 0
                emi.setValue(rawEmi, forKey: "emiOption")
                emi.setValue(emiInfo.emiMaxListOptions as NSNumber?, forKey: "emiMaximumInstallmentOption")
                emi.setValue(emiInfo.emiSelectedInst as NSNumber?, forKey: "emiSelectedInstallmentOption")
                self.emiInformation = emi as? EMIInformation
            }
        }
        if let shipment = flutterData.sslcShipmentInfoInitializer{
            if let shipClass = NSClassFromString("SSLCommerzSDK.ShipmentInformation") as? NSObject.Type {
                let ship = shipClass.init()
                ship.setValue(shipment.shipmentMethod ?? "", forKey: "shippingMethod")
                ship.setValue(Int(shipment.numOfItems ?? 0), forKey: "numberOfItem")
                ship.setValue(shipment.shipmentDetails?.shipName, forKey: "shippingName")
                ship.setValue(shipment.shipmentDetails?.shipAddress1, forKey: "shippingAddressOne")
                ship.setValue(shipment.shipAddress2, forKey: "shippingAddressTwo")
                ship.setValue(shipment.shipmentDetails?.shipCity, forKey: "shippingCity")
                ship.setValue(shipment.shipmentDetails?.shipPostCode, forKey: "shippingPostCode")
                ship.setValue(shipment.shipmentDetails?.shipCountry, forKey: "shippingCountry")
                self.shipmentInformation = ship as? ShipmentInformation
            }
        }
        if let product = flutterData.sslcProductInitializer{
            if let prodClass = NSClassFromString("SSLCommerzSDK.ProductInformation") as? NSObject.Type {
                let prod = prodClass.init()
                prod.setValue(product.productName ?? "", forKey: "productName")
                prod.setValue(product.productCategory ?? "", forKey: "productCategory")
                
                prod.setValue(NSNumber(value: product.productAmount ?? 0.0), forKey: "productAmount")
                prod.setValue(NSNumber(value: product.vat ?? 0.0), forKey: "vat")
                prod.setValue(NSNumber(value: product.discountAmount ?? 0.0), forKey: "discountAmount")
                prod.setValue(NSNumber(value: product.convenienceFee ?? 0.0), forKey: "convenienceFee")
                
                if let carts = product.cart{
                     var cartItems: [NSObject] = []
                     carts.forEach { cart in
                         if let cartItemClass = NSClassFromString("SSLCommerzSDK.CartItem") as? NSObject.Type {
                             let cartItem = cartItemClass.init()
                             cartItem.setValue(cart.product, forKey: "product")
                             cartItem.setValue(cart.quantity, forKey: "quantity")
                             cartItem.setValue(cart.amount, forKey: "amount")
                             cartItems.append(cartItem)
                         }
                     }
                     prod.setValue(cartItems, forKey: "cart")
                }
                self.productInformation = prod as? ProductInformation
            }
        }
    }
}
