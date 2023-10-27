import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { AuthService } from '../../services/auth.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent {
  email = '';
  password = '';

  constructor(private authService: AuthService, private router: Router) {}

  // Helper method to decode JWT payload
  decodeJwtPayload(token: string): any {
    const base64Url = token.split('.')[1];
    const base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/');
    return JSON.parse(window.atob(base64));
  }

  login() {
    this.authService.login(this.email, this.password).subscribe({
      next: (response) => {
        const payload = this.decodeJwtPayload(response.jwt);
        
        // Check the roles claim in the JWT payload.
        if (payload.roles === 'ADMIN') {
          this.router.navigate(['/admin']);
        } else {
          this.router.navigate(['']);
        }
      },
      error: (error) => {
        alert("Login failed!");
        console.error(error);
      }
    });
  }
}

function decodeJwtPayload(token: string): any {
  const base64Url = token.split('.')[1];
  const base64 = base64Url.replace('-', '+').replace('_', '/');
  return JSON.parse(window.atob(base64));
}
