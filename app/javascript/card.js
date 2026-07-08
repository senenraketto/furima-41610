const pay = () => {

  const publicKey = gon.public_key
  const payjp = Payjp(publicKey)

  const form = document.getElementById('charge-form');
  if (!form) return;

  const elements = payjp.elements();
  const numberElement = elements.create('cardNumber');
  const expiryElement = elements.create('cardExpiry');
  const cvcElement = elements.create('cardCvc');

  numberElement.mount('#number-form');
  expiryElement.mount('#expiry-form');
  cvcElement.mount('#cvc-form');
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    payjp.createToken(numberElement).then(function (response) {
      if (response.error) {
        console.log("トークン作成エラー:", response.error.message);
      } else {
        const token = response.id;
        console.log("取得したトークン:", token); 
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        form.insertAdjacentHTML("beforeend", tokenObj);
      }
      form.submit();
    });
  });
};

window.addEventListener("turbo:render", pay);
window.addEventListener("turbo:load", pay);