import { Injectable } from '@angular/core';
import { Router, UrlTree } from '@angular/router';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class AdminGuard {

  constructor(private router: Router) { }

  canActivate():
    | Observable<boolean | UrlTree>
    | Promise<boolean | UrlTree>
    | boolean
    | UrlTree {
    
    const jwt = localStorage.getItem('access_token'); 
    console.log('JWT:', jwt);

    if (jwt) {
      const base64Url = jwt.split('.')[1];
      const base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/');
      const payload = JSON.parse(window.atob(base64));

      console.log('Payload:', payload);

      if (payload.roles === 'ADMIN') {
        console.log("AdminGuard activated");

        return true;
      }
    }

    // If not an admin, navigate to the home page and return false.
    this.router.navigate(['']);
    return false;
  }
}
