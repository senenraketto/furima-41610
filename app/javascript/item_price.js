const price = () => {
  // 商品価格 要素をGetelememntByIdで取得する
  const priceInput = document.getElementById("item-price");
  

  // addEventListenerで入力した時にイベント起こるように
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    const addTaxDom = document.getElementById("add-tax-price");
    const profitDom = document.getElementById("profit");

    const taxPrice = Math.floor(inputValue * 0.1);
    const profitPrice = Math.floor(inputValue - taxPrice);

    addTaxDom.innerHTML = taxPrice;
    profitDom.innerHTML = profitPrice;
  });
};

// 
window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);