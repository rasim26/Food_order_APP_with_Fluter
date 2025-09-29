import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_food_ordering_app/bloc/cart_bloc.dart';
import 'package:local_food_ordering_app/bloc/cart_event.dart';
import 'package:local_food_ordering_app/bloc/cart_state.dart';
import 'package:local_food_ordering_app/constants/const.dart';
import 'package:local_food_ordering_app/models/cart_item_model.dart';
import 'package:local_food_ordering_app/widget/main_title.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              H.constHeight,
              MainTitle(title: "My Cart"),
              const SizedBox(height: 20),

              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  if (state is CartLoaded) {
                    if (state.cartItems.isEmpty) {
                      return _emptyCart();
                    }
                    return _cartItems(context, state);
                  }
                  return _emptyCart();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _emptyCart() {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 100),
          Icon(Icons.shopping_cart_outlined, size: 80, color: Colors.grey[400]),
          const SizedBox(height: 16),
          Text(
            'Your cart is empty',
            style: TextStyle(fontSize: 18, color: Colors.grey[600]),
          ),
          const SizedBox(height: 8),
          Text(
            'Add to cart now!!',
            style: TextStyle(fontSize: 14, color: Colors.grey[500]),
          ),
        ],
      ),
    );
  }

  Widget _cartItems(BuildContext context, CartLoaded state) {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: state.cartItems.length,
          itemBuilder: (context, index) {
            final cartItem = state.cartItems[index];
            return _cartItemCard(context, cartItem);
          },
        ),
        const SizedBox(height: 20),
        _cartSummary(context, state),
      ],
    );
  }

  Widget _cartItemCard(BuildContext context, CartItem cartItem) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            // Item Image
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                cartItem.foodItem.imagePath,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),

            // Item Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cartItem.foodItem.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '₹${cartItem.foodItem.price} each',
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),

                  const SizedBox(height: 8),
                  Text(
                    '₹${cartItem.totalPrice.toStringAsFixed(0)} total',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.green[700],
                    ),
                  ),
                ],
              ),
            ),

            // Quantity Controls
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.read<CartBloc>().add(
                            DecreaseQuantity(cartItem.foodItem),
                          );
                        },
                        child: Container(
                          width: 32,
                          height: 32,
                          child: const Icon(
                            Icons.remove,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          cartItem.quantity.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.read<CartBloc>().add(
                            IncreaseQuantity(cartItem.foodItem),
                          );
                        },
                        child: Container(
                          width: 32,
                          height: 32,
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 8),
                GestureDetector(
                  onTap: () {
                    context.read<CartBloc>().add(
                      RemoveFromCart(cartItem.foodItem),
                    );
                  },
                  child: Text(
                    'Remove',
                    style: TextStyle(
                      color: Colors.red[600],
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _cartSummary(BuildContext context, CartLoaded state) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.green[200]!),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total (${state.totalItems} items)',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),

              Text(
                '₹${state.totalPrice.toStringAsFixed(0)}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Proceeding to checkout...'),
                    backgroundColor: Colors.green,
                  ),
                );
              },

              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Proceed to Checkout',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
