class TPricingCalculator {

  /// -- Calculate Total Price including tax and shipping
  static double calculateTotalPrice(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;

    double shippingCost = getShippingCost(location);

    double totalPrice = productPrice + taxAmount + shippingCost;
    return totalPrice;
  }

  /// -- Calculate Shipping Cost
  static double calculateShippingCost(double productPrice, String location) {
    return getShippingCost(location);
  }

  /// -- Calculate Tax
  static double calculateTax(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    return taxAmount;
  }

  /// -- Get Tax Rate for a Location
  static double getTaxRateForLocation(String location) {
    // Lookup the tax rate for the given location from a tax rate database or API.
    // Return the appropriate tax rate.
    return 0.10; // Example tax rate of 10%
  }

  /// -- Get Shipping Cost for a Location
  static double getShippingCost(String location) {
    // Lookup the shipping cost for the given location using a shipping rate API.
    // Calculate the shipping cost based on variant factors like distance, weight, etc.
    return 5.00; // Example shipping cost of $5
  }

/// -- Sum all cart values and return total amount
// static double calculateCartTotal(CartModel cart) {
//   return cart.items.fold(0.0, (previousPrice, item) => previousPrice + (item.price ?? 0.0));
// }
}
