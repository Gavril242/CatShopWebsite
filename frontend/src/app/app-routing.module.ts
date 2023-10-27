import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './home/home.component';
import { LoginComponent } from './auth/login/login.component';
import { RegisterComponent } from './auth/register/register.component';
import { CheckoutComponent } from './checkout/checkout.component';
import { ProductComponent } from './product/product.component';
import { UserComponent } from './user/user.component';
import { PaymentComponent } from './payment/payment.component'
import { OrderComponent } from './order/order.component';
import { ContactComponent } from './contact/contact.component';
import { AddProductComponent } from './add-product/add-product.component';
import { AdminComponent } from './admin/admin.component';
import { AdminGuard } from './guards/admin.guard';





const routes: Routes = [
  { path: '', component: HomeComponent },
  { path: 'login', component: LoginComponent },
  { path: 'register', component: RegisterComponent },
  { path: 'checkout', component: CheckoutComponent },
  { path: 'product/:id', component: ProductComponent },
  { path: 'user', component: UserComponent },
  { path: 'payment', component: PaymentComponent },
  { path: 'add', component: AddProductComponent },
  { path: 'admin', component: AdminComponent, canActivate: [AdminGuard] },
  { path: 'contact', component: ContactComponent },
  { path: 'order', component: OrderComponent }

];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }