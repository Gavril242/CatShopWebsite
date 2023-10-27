import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class OrderService {
  private apiUrl = 'http://localhost:8080/api/v1/orders';

  constructor(private http: HttpClient) {}
 

  getOrdersByUserId(userId: string, access_token: string) {
    const headers = new HttpHeaders({
      Authorization: 'Bearer ' + access_token
    });
    

    return this.http.get(`${this.apiUrl}/${userId}`, { headers });
  }

  getAllOrdersForAdmin(access_token: string) {
    const headers = new HttpHeaders({
        Authorization: 'Bearer ' + access_token
    });

    return this.http.get(`${this.apiUrl}/all`, { headers });
}
deleteOrder(orderId: string) {
  const headers = new HttpHeaders({
    Authorization: 'Bearer ' + localStorage.getItem('access_token')
  });

  return this.http.delete(`${this.apiUrl}/${orderId}`, { headers });
}


}
