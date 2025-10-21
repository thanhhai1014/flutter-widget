# Stripe Threshold - Understanding Thresholds in Stripe

## What is Threshold in Stripe?

"Threshold" in Stripe refers to limits or value levels that are set to trigger specific actions or conditions in the payment system.

## Common Types of Thresholds in Stripe

### 1. **Billing Threshold**

This is the minimum value a customer must reach before Stripe automatically generates an invoice. For example:
- If the threshold is set to $100, Stripe will only create an invoice when the total amount reaches $100
- Helps reduce the number of small transactions and processing fees

### 2. **Payout Threshold**

The minimum threshold for Stripe to transfer funds to your bank account:
- Default: Stripe typically transfers money automatically on a schedule
- You can set a custom threshold to control when you receive funds
- Example: Only transfer money when the balance reaches $1000

### 3. **Usage Threshold**

Applied to usage-based billing services:
- Triggers notifications when customers exceed a certain usage level
- Helps control costs and manage resources

### 4. **Risk Threshold**

Stripe uses risk thresholds to:
- Detect suspicious transactions
- Trigger 3D Secure verification
- Block or flag high-risk transactions

## How to Configure Thresholds in Stripe

### Using Stripe Dashboard:

1. Log in to Stripe Dashboard
2. Go to **Settings** → **Billing**
3. Find the **Billing thresholds** section
4. Set the desired threshold value

### Using Stripe API:

```dart
// Example of configuring billing threshold with Flutter/Dart
final subscription = await stripe.subscriptions.update(
  subscriptionId,
  billingThresholds: BillingThresholds(
    amountGte: 10000, // $100.00 (in cents)
    resetBillingCycleAnchor: true,
  ),
);
```

```javascript
// Example with Node.js/JavaScript
const subscription = await stripe.subscriptions.update(
  'sub_xxx',
  {
    billing_thresholds: {
      amount_gte: 10000, // $100.00 in cents
      reset_billing_cycle_anchor: true,
    },
  }
);
```

```python
# Example with Python
subscription = stripe.Subscription.modify(
  'sub_xxx',
  billing_thresholds={
    'amount_gte': 10000,  # $100.00 in cents
    'reset_billing_cycle_anchor': True,
  }
)
```

## Benefits of Using Thresholds

1. **Reduce transaction fees**: Combine multiple small payments into one larger transaction
2. **Optimize cash flow**: Control when payments are received
3. **Improve user experience**: Reduce the number of times customers need to pay
4. **Better risk management**: Set thresholds to detect fraud

## Important Notes

⚠️ **Be careful when setting thresholds:**
- Too high threshold may make it difficult for customers
- Too low threshold may increase transaction costs
- Consider based on your specific business model

## Real-world Examples

### Case 1: SaaS Service
```
- Threshold: $50
- Customer uses service at $10/month
- Stripe will accumulate and only charge after 5 months
```

### Case 2: E-commerce
```
- Payout Threshold: $500
- Store only receives money when total sales reach $500
- Reduces bank transfer fees
```

## Use Cases in Flutter Apps

When integrating Stripe in Flutter applications, thresholds can be particularly useful for:

### Subscription-based Apps
```dart
class SubscriptionService {
  Future<void> setupBillingThreshold() async {
    // Configure threshold to reduce billing frequency
    await stripe.subscriptions.update(
      subscriptionId,
      billingThresholds: BillingThresholds(
        amountGte: 5000, // $50.00
        resetBillingCycleAnchor: true,
      ),
    );
  }
}
```

### Usage-based Billing
```dart
class UsageMonitor {
  void checkUsageThreshold(int currentUsage) {
    const threshold = 1000;
    if (currentUsage >= threshold) {
      // Notify user about threshold reached
      notifyUser('You have reached the usage threshold');
    }
  }
}
```

## Reference Documentation

- [Stripe Billing Documentation](https://stripe.com/docs/billing)
- [Stripe API Reference - Subscriptions](https://stripe.com/docs/api/subscriptions)
- [Managing Payouts](https://stripe.com/docs/payouts)
- [Stripe Flutter SDK](https://pub.dev/packages/flutter_stripe)

## Frequently Asked Questions

**Q: Can I change the threshold after it has been set?**  
A: Yes, you can change the threshold at any time via the Dashboard or API.

**Q: Does the threshold apply to all types of transactions?**  
A: No, thresholds are typically applied separately for each type (billing, payout, etc.)

**Q: Are there minimum or maximum limits for thresholds?**  
A: Yes, Stripe has limits depending on the type of threshold and country.

**Q: How do thresholds affect my customers?**  
A: Billing thresholds can reduce billing frequency, which may improve customer experience but could also delay revenue recognition.

**Q: Can I set different thresholds for different customers?**  
A: Yes, thresholds can be configured per subscription or customer.
