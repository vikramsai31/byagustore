function fillBilling() {
	var f = document.forms['new_order'];
    if (document.forms['new_order']['inlineCheckbox1'].checked ) {
      f['order[shipping_first_name]'].value = f['order[billing_first_name]'].value;
      f['order[shipping_last_name]'].value = f['order[billing_last_name]'].value;
      f['order[shipping_address1]'].value = f['order[billing_address1]'].value;
      f['order[shipping_address2]'].value = f['order[billing_address2]'].value;
      f['order[shipping_city]'].value = f['order[billing_city]'].value;
      f['order[shipping_state]'].value = f['order[billing_state]'].value;
      f['order[shipping_zip]'].value = f['order[billing_zip]'].value;
    } else {
  	 f.order_shipping_first_name.value = '';
    f.order_shipping_last_name.value = '';
    f.order_shipping_address1.value = '';
    f.order_shipping_address2.value = '';
    f.order_shipping_city.value = '';
    f.order_shipping_state.value = '';
    f.order_shipping_zip.value = '';
  }

}


  




