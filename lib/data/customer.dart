class Customer {
 String email;
 String fullName;
 String address;
 String phone;

 Customer({
  required this.email,
  required this.fullName,
  required this.address,
  required this.phone,
 });
}

Customer customer = Customer(email: '', fullName: '', address: '', phone: '');