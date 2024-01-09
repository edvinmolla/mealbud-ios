//
//  ApplePayModel.swift
//  AcceptAPayment
//
//  Created by Thorsten Schaeff on 6/28/21.
//

import Foundation
import Stripe
import PassKit

class ApplePayModel : NSObject, ObservableObject, STPApplePayContextDelegate {
    @Published var paymentStatus: STPPaymentStatus?
    @Published var lastPaymentError: Error?
    var clientSecret: String?

    func pay(clientSecret: String?) {
        self.clientSecret = clientSecret
        // Configure a payment request
        let pr = StripeAPI.paymentRequest(withMerchantIdentifier: "merchant.mealbud.stable", country: "US", currency: "USD")

        // You'd generally want to configure at least `.postalAddress` here.
        // We don't require anything here, as we don't want to enter an address
        // in CI.
        pr.requiredShippingContactFields = []
        pr.requiredBillingContactFields = []

        // Configure shipping methods
//        let buddyDelivery = PKShippingMethod(label: "First Class Mail", amount: NSDecimalNumber(string: "10.99"))
//        buddyDelivery.detail = "Arrives in 3-5 days"
//        buddyDelivery.identifier = "firstclass"
//        pr.shippingMethods = [
//            buddyDelivery,
//        ]

        // Build payment summary items
        // (You'll generally want to configure these based on the selected address and shipping method.
        pr.paymentSummaryItems = [
            PKPaymentSummaryItem(label: "A very nice computer", amount: NSDecimalNumber(string: "59.99")),
        ]

        // Present the Apple Pay Context:
        let applePayContext = STPApplePayContext(paymentRequest: pr, delegate: self)
        applePayContext?.presentApplePay()
    }


    func applePayContext(_ context: STPApplePayContext, didCreatePaymentMethod paymentMethod: STPPaymentMethod, paymentInformation: PKPayment, completion: @escaping STPIntentClientSecretCompletionBlock) {
        // Confirm the PaymentIntent
        if (self.clientSecret != nil) {
            // Call the completion block with the PaymentIntent's client secret.
            completion(clientSecret, nil)
        } else {
            completion(nil, NSError())
        }
    }

    func applePayContext(_ context: STPApplePayContext, didCompleteWith status: STPPaymentStatus, error: Error?) {
        // When the payment is complete, display the status.
        self.paymentStatus = status
        self.lastPaymentError = error
    }
}
