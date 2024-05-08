
const priceInput = document.getElementById("item-price");
const addTaxDom = document.getElementById("add-tax-price");
const profitDisplay = document.getElementById("profit");

priceInput.addEventListener("input", () => {
  const price = priceInput.value;
  addTaxDom.innerHTML = Math.floor(price * 0.1);
  const tax = addTaxDom.innerHTML;
  profitDisplay.innerHTML = price - tax;
})
