# Stripe Threshold - Giải thích về ngưỡng trong Stripe

## Threshold trong Stripe là gì?

"Threshold" (ngưỡng) trong Stripe đề cập đến các giới hạn hoặc mức giá trị được thiết lập để kích hoạt các hành động hoặc điều kiện cụ thể trong hệ thống thanh toán.

## Các loại Threshold phổ biến trong Stripe

### 1. **Billing Threshold (Ngưỡng thanh toán)**

Đây là giá trị tối thiểu mà khách hàng phải đạt được trước khi Stripe tự động tạo hóa đơn. Ví dụ:
- Nếu threshold được đặt là $100, Stripe sẽ chỉ tạo hóa đơn khi tổng số tiền đạt $100
- Giúp giảm số lượng giao dịch nhỏ và phí xử lý

### 2. **Payout Threshold (Ngưỡng chi trả)**

Ngưỡng tối thiểu để Stripe thực hiện việc chuyển tiền vào tài khoản ngân hàng của bạn:
- Mặc định: Stripe thường chuyển tiền tự động theo lịch trình
- Có thể đặt threshold tùy chỉnh để kiểm soát thời điểm nhận tiền
- Ví dụ: Chỉ chuyển tiền khi số dư đạt $1000

### 3. **Usage Threshold (Ngưỡng sử dụng)**

Áp dụng cho các dịch vụ tính phí theo mức sử dụng:
- Kích hoạt thông báo khi khách hàng vượt quá một mức sử dụng nhất định
- Giúp kiểm soát chi phí và quản lý tài nguyên

### 4. **Risk Threshold (Ngưỡng rủi ro)**

Stripe sử dụng các ngưỡng rủi ro để:
- Phát hiện giao dịch đáng ngờ
- Kích hoạt xác minh 3D Secure
- Chặn hoặc đánh dấu giao dịch có rủi ro cao

## Cách cấu hình Threshold trong Stripe

### Sử dụng Stripe Dashboard:

1. Đăng nhập vào Stripe Dashboard
2. Đi tới **Settings** → **Billing**
3. Tìm phần **Billing thresholds**
4. Thiết lập giá trị threshold mong muốn

### Sử dụng Stripe API:

```dart
// Ví dụ cấu hình billing threshold với Flutter/Dart
final subscription = await stripe.subscriptions.update(
  subscriptionId,
  billingThresholds: BillingThresholds(
    amountGte: 10000, // $100.00 (tính bằng cents)
    resetBillingCycleAnchor: true,
  ),
);
```

```javascript
// Ví dụ với Node.js/JavaScript
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

## Lợi ích của việc sử dụng Threshold

1. **Giảm phí giao dịch**: Gộp nhiều khoản thanh toán nhỏ thành một giao dịch lớn
2. **Tối ưu hóa dòng tiền**: Kiểm soát thời điểm nhận thanh toán
3. **Cải thiện trải nghiệm người dùng**: Giảm số lần khách hàng phải thanh toán
4. **Quản lý rủi ro tốt hơn**: Thiết lập các ngưỡng để phát hiện gian lận

## Lưu ý quan trọng

⚠️ **Cẩn thận khi đặt threshold:**
- Threshold quá cao có thể gây khó khăn cho khách hàng
- Threshold quá thấp có thể làm tăng chi phí giao dịch
- Cần cân nhắc dựa trên mô hình kinh doanh cụ thể

## Ví dụ thực tế

### Trường hợp 1: Dịch vụ SaaS
```
- Threshold: $50
- Khách hàng sử dụng dịch vụ $10/tháng
- Stripe sẽ tích lũy và chỉ tính phí sau 5 tháng
```

### Trường hợp 2: E-commerce
```
- Payout Threshold: $500
- Cửa hàng chỉ nhận tiền khi tổng doanh số đạt $500
- Giảm phí chuyển khoản ngân hàng
```

## Tài liệu tham khảo

- [Stripe Billing Documentation](https://stripe.com/docs/billing)
- [Stripe API Reference - Subscriptions](https://stripe.com/docs/api/subscriptions)
- [Managing Payouts](https://stripe.com/docs/payouts)

## Câu hỏi thường gặp

**Q: Có thể thay đổi threshold sau khi đã đặt không?**  
A: Có, bạn có thể thay đổi threshold bất cứ lúc nào qua Dashboard hoặc API.

**Q: Threshold có áp dụng cho tất cả các loại giao dịch không?**  
A: Không, threshold thường áp dụng riêng cho từng loại (billing, payout, v.v.)

**Q: Có giới hạn tối thiểu hoặc tối đa cho threshold không?**  
A: Có, Stripe có các giới hạn tùy thuộc vào loại threshold và quốc gia.
