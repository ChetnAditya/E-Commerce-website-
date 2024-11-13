const mongoose = require('mongoose');

// Connect to MongoDB
mongoose.connect('mongodb://localhost:27017/ecommerce', { useNewUrlParser: true, useUnifiedTopology: true });

// Define schemas

// 1. Users Schema
const addressSchema = new mongoose.Schema({
  address_id: { type: mongoose.Schema.Types.ObjectId, default: new mongoose.Types.ObjectId() },
  street: String,
  city: String,
  state: String,
  postal_code: String,
  country: String
});

const userSchema = new mongoose.Schema({
  user_id: { type: mongoose.Schema.Types.ObjectId, default: new mongoose.Types.ObjectId() },
  name: String,
  email: { type: String, unique: true },
  password: String,
  phone: String,
  address: [addressSchema],
  created_at: { type: Date, default: Date.now },
  updated_at: { type: Date, default: Date.now },
  is_active: { type: Boolean, default: true },
  role: { type: String, enum: ['customer', 'admin'], default: 'customer' }
});

// 2. Products Schema
const variantSchema = new mongoose.Schema({
  variant_id: { type: mongoose.Schema.Types.ObjectId, default: new mongoose.Types.ObjectId() },
  size: String,
  color: String,
  price_adjustment: Number,
  stock: Number
});

const productSchema = new mongoose.Schema({
  product_id: { type: mongoose.Schema.Types.ObjectId, default: new mongoose.Types.ObjectId() },
  name: String,
  description: String,
  price: Number,
  category_id: mongoose.Schema.Types.ObjectId,
  brand: String,
  stock: Number,
  images: [String],
  created_at: { type: Date, default: Date.now },
  updated_at: { type: Date, default: Date.now },
  rating: { type: Number, min: 0, max: 5 },
  variants: [variantSchema]
});

// 3. Categories Schema
const categorySchema = new mongoose.Schema({
  category_id: { type: mongoose.Schema.Types.ObjectId, default: new mongoose.Types.ObjectId() },
  name: String,
  description: String,
  parent_category_id: mongoose.Schema.Types.ObjectId
});

// 4. Orders Schema
const orderItemSchema = new mongoose.Schema({
  product_id: mongoose.Schema.Types.ObjectId,
  variant_id: mongoose.Schema.Types.ObjectId,
  quantity: Number,
  price: Number
});

const orderSchema = new mongoose.Schema({
  order_id: { type: mongoose.Schema.Types.ObjectId, default: new mongoose.Types.ObjectId() },
  user_id: mongoose.Schema.Types.ObjectId,
  order_date: { type: Date, default: Date.now },
  status: { type: String, enum: ['pending', 'shipped', 'delivered', 'cancelled'], default: 'pending' },
  items: [orderItemSchema],
  total_amount: Number,
  payment_id: mongoose.Schema.Types.ObjectId,
  shipping_address: addressSchema
});

// 5. Payments Schema
const paymentSchema = new mongoose.Schema({
  payment_id: { type: mongoose.Schema.Types.ObjectId, default: new mongoose.Types.ObjectId() },
  order_id: mongoose.Schema.Types.ObjectId,
  user_id: mongoose.Schema.Types.ObjectId,
  amount: Number,
  method: { type: String, enum: ['credit_card', 'paypal', 'cash_on_delivery'] },
  status: { type: String, enum: ['paid', 'pending', 'failed'], default: 'pending' },
  transaction_date: { type: Date, default: Date.now }
});

// 6. Reviews Schema
const reviewSchema = new mongoose.Schema({
  review_id: { type: mongoose.Schema.Types.ObjectId, default: new mongoose.Types.ObjectId() },
  product_id: mongoose.Schema.Types.ObjectId,
  user_id: mongoose.Schema.Types.ObjectId,
  rating: { type: Number, min: 1, max: 5 },
  comment: String,
  created_at: { type: Date, default: Date.now }
});

// 7. Shopping Cart Schema
const cartItemSchema = new mongoose.Schema({
  product_id: mongoose.Schema.Types.ObjectId,
  variant_id: mongoose.Schema.Types.ObjectId,
  quantity: Number,
  added_at: { type: Date, default: Date.now }
});

const cartSchema = new mongoose.Schema({
  cart_id: { type: mongoose.Schema.Types.ObjectId, default: new mongoose.Types.ObjectId() },
  user_id: mongoose.Schema.Types.ObjectId,
  items: [cartItemSchema]
});

// 8. Wishlist Schema
const wishlistItemSchema = new mongoose.Schema({
  product_id: mongoose.Schema.Types.ObjectId,
  added_at: { type: Date, default: Date.now }
});

const wishlistSchema = new mongoose.Schema({
  wishlist_id: { type: mongoose.Schema.Types.ObjectId, default: new mongoose.Types.ObjectId() },
  user_id: mongoose.Schema.Types.ObjectId,
  items: [wishlistItemSchema]
});

// 9. Inventory Schema
const inventorySchema = new mongoose.Schema({
  product_id: mongoose.Schema.Types.ObjectId,
  variant_id: mongoose.Schema.Types.ObjectId,
  stock: Number,
  last_updated: { type: Date, default: Date.now }
});

// 10. Shipping Schema
const shippingSchema = new mongoose.Schema({
  shipping_id: { type: mongoose.Schema.Types.ObjectId, default: new mongoose.Types.ObjectId() },
  order_id: mongoose.Schema.Types.ObjectId,
  method: { type: String, enum: ['standard', 'express'] },
  tracking_number: String,
  carrier: String,
  status: { type: String, enum: ['in_transit', 'delivered', 'pending'], default: 'pending' },
  estimated_delivery_date: Date
});

// Export models
const User = mongoose.model('User', userSchema);
const Product = mongoose.model('Product', productSchema);
const Category = mongoose.model('Category', categorySchema);
const Order = mongoose.model('Order', orderSchema);
const Payment = mongoose.model('Payment', paymentSchema);
const Review = mongoose.model('Review', reviewSchema);
const Cart = mongoose.model('Cart', cartSchema);
const Wishlist = mongoose.model('Wishlist', wishlistSchema);
const Inventory = mongoose.model('Inventory', inventorySchema);
const Shipping = mongoose.model('Shipping', shippingSchema);

module.exports = {
  User,
  Product,
  Category,
  Order,
  Payment,
  Review,
  Cart,
  Wishlist,
  Inventory,
  Shipping
};
