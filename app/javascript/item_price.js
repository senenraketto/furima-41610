const price = () => {
  const priceInput = document.getElementById("item-price");
  
  if (!priceInput) return;

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