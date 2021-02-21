window.addEventListener('load', function(){

const priceInput = document.getElementById("price");
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  console.log(inputValue);

  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
  console.log(addTaxDom);

  const profitPrice = document.getElementById("profit");
    const taxValue = inputValue * 0.1;
    console.log(taxValue);
    profitPrice.innerHTML = Math.floor(inputValue - taxValue);
    console.log(profitPrice);
})
})