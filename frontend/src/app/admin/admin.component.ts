import { Component, OnInit } from '@angular/core';
import { OrderService } from '../services/order.service';
import { ProductService } from '../services/product.service';

@Component({
    selector: 'app-admin',
    templateUrl: './admin.component.html',
    styleUrls: ['./admin.component.css']
})
export class AdminComponent implements OnInit {
    orders: any[] = [];
    products: any[] = []; // Initializing products array

    constructor(
        private orderService: OrderService, 
        private productService: ProductService // Injecting ProductService
    ) { }

    ngOnInit() {
        const access_token = localStorage.getItem('access_token');

        if (access_token) {
            this.orderService.getAllOrdersForAdmin(access_token).subscribe(
                (response) => {
                    this.orders = response as any[];
                },
                (error) => {
                    console.error("Error fetching all orders:", error);
                }
            );
            
            // Optionally, if you want to fetch all products on init:
            this.productService.getAll().subscribe(
                (response) => {
                    this.products = response as any[];
                },
                (error) => {
                    console.error("Error fetching all products:", error);
                }
            );
        }
    }

    redirectToAdd() {
      window.location.href = "http://localhost:4200/add";
    }

    deleteOrder(orderId: string) {
      this.orderService.deleteOrder(orderId).subscribe(() => {
        // Refresh orders or remove the deleted one from the list
        this.orders = this.orders.filter(order => order.id !== orderId);
      },
      (error) => {
        console.error("Error deleting the order:", error);
      });
    }

    deleteProduct(productId: number) {
      if (confirm("Are you sure you want to delete this product?")) {
        this.productService.deleteProduct(productId).subscribe(
          () => {
            // Successfully deleted product
            this.products = this.products.filter(product => product.id !== productId);
          },
          error => {
            console.error("Error deleting product:", error);
            alert('Failed to delete product. Please try again.');
          }
        );
      }
    }
}
