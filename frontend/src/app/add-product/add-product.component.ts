import { Component } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Router } from '@angular/router';

@Component({
  selector: 'app-add-product',
  templateUrl: './add-product.component.html',
  styleUrls: ['./add-product.component.css']
})
export class AddProductComponent {

  productName: string = '';
  productDescription: string = '';
  productImgUrl: string = '';
  productPrice: number =0;

  constructor(private http: HttpClient,  private router: Router) { }

  addProduct() {
    const url = 'http://localhost:8080/api/v1/products/add';
    const body = {
      name: this.productName,
      description: this.productDescription,
      imgUrl: this.productImgUrl,
      price: this.productPrice
    };

    const token = localStorage.getItem('access_token')
    const headers = new HttpHeaders({
      'Authorization': 'Bearer ' + token
    });

    this.http.post(url, body, { headers: headers }).subscribe({
      next: (response) => {
        alert("Product added successfully!");
        // Handle successful response, maybe navigate to the product list or clear the form for another product addition
        console.log(response);
        this.productName = '';
        this.productDescription = '';
        this.productImgUrl = '';
        this.productPrice = 0;
        // Optionally, navigate somewhere after adding
        // this.router.navigate(['path-to-navigate']);
      },
      error: (error) => {
        alert("Adding product failed idk its not ok!");
        this.router.navigate(['/order']);
        console.error(error);
        
        // Handle errors
      }
    });
}
}
